import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fuel2u_user/model/order/fuel_type_model.dart';
import 'package:fuel2u_user/model/order_model.dart';
import 'package:fuel2u_user/model/vehicle/vehicle_list_model.dart';
import 'package:fuel2u_user/resources/session_manager.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/api_constant.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController{
   
    final emptyOrder = true.obs;
    final confirmNextBth = false.obs;    
    late int selectVehicleIndex;
    late int selectPlan;
    late int selectAddress;
    late int selectPaymentMethod;
    late Map selectdata;
    final promoCodeCtrl =TextEditingController();
   final  commentCtrl =TextEditingController();
  //  Rating Screen Variable
   final  ratingCommentCtrl =TextEditingController();
   final rateingFomrKey = GlobalKey<FormState>();
   final israting = false.obs;
   final rateStar = 0.obs;
   final submitRateing = false.obs;

    List staticfuelTypeList = ["87 Octane", "89 Octane", "Diesel"];
    List dateList = [
      {"day" : "Mon","date" : "24"},
      {"day" : "Tue","date" : "25"},
      {"day" : "Wed","date" : "26"},
      {"day" : "Thu","date" : "27"},
      {"day" : "Fri","date" : "28"},
      {"day" : "Sat","date" : "29"},
      {"day" : "Sun","date" : "30"},
      {"day" : "Mon","date" : "31"},
      {"day" : "Tue","date" : "01"},
    ];
    List addressType = ["Home", "Work"];
    var latList = [
      // LatLng(45.521563, -122.677433),
      //  LatLng(45.521121, -122.573072),

      -122.677433,  -122.677300,  -122.677200,  -122.50000,  -122.674000];

    final  selectFuelAmount =0.obs;
    late int selectFuelType;
    // late int selectVehicle;

// All Google Map variable and location
Completer<GoogleMapController> mapController = Completer();
 LatLng center = const LatLng(45.521563, -122.677433);
  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }
  final Set<Marker> markers = {};
  @override
  void onInit() {
    super.onInit();
    getOrder();
    selectVehicleIndex = -1;
    selectFuelType = -1;
    selectPlan = -1;
    selectAddress = -1;
    selectPaymentMethod = -1;
    selectdata = {};
    Future.delayed(Duration(seconds: 3), () {  emptyOrder.value = false;
    update();
    GetTruckImage();
  }
  );
   
  }
  GetTruckImage() async{
   markers.clear();
  BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(),
    "assets/images/location.png",);

  BitmapDescriptor truckmarkerbitmap = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(),
    "assets/images/truck_icon.png",);
  for(int i =0;  i < 5; i++){
    if(i == 0){
     markers.add(Marker(
        // This marker id wan be anything that uniquely identifies each marker.
        markerId: MarkerId("$i"),
        position: LatLng(45.521563, latList[i]),       
        icon: markerbitmap,
      ));
       update();
    }
    else{
       markers.add(Marker(
        // This marker id c"wan be anything that uniquely identifies each marker.
        markerId: MarkerId("$i"),
        position: LatLng(45.521563, latList[i]),       
        icon: truckmarkerbitmap,
      ));
       update();

    }
  }


  }
  GetSingleTruck() async{
  markers.clear();
  log("GetSingleTruck");
  BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(),
    "assets/images/location.png",);

  BitmapDescriptor truckmarkerbitmap = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(),
    "assets/images/truck_icon.png",);
  for(int i =0;  i < 2; i++){
    if(i == 0){
     markers.add(Marker(
        // This marker id wan be anything that uniquely identifies each marker.
        markerId: MarkerId("$i"),
        position: LatLng(45.521563, latList[i]),       
        icon: markerbitmap,
      ));
       update();
    }
    else{
       markers.add(Marker(
        // This marker id c"wan be anything that uniquely identifies each marker.
        markerId: MarkerId("$i"),
        position: LatLng(45.521563, -122.680033),       
        icon: truckmarkerbitmap,
      ));
       update();

    }
    update();
  }


  }


  @override
  void onReady() {
    super.onReady();
 
    
    // useAccessibilityService();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setVehicle(int index) {
    selectVehicleIndex = index;
    update();
  }
  

  void changeFuelAmount(int? value) {
    selectFuelAmount.value =  value!;
    update();
  }

  void checkRateing() {
    if(rateStar>0 && ratingCommentCtrl.text.isNotEmpty){
     israting.value = true; 
      update();
    }
    else{
      israting.value = false;
       update();
    }
   
  }

  void updateReview() {
    log("load puneet calling");
   submitRateing.value = true;
   update();
  }

// Api Calling Block




// Only 10 order show 
 SessionManager pref = SessionManager();
 final isLoading = true.obs;
 List<dynamic>? orderList;
List<FuelTypeModelData>? fuelTypeList;
final fuelLoaidng = true.obs;
Future<void>  getOrder() async{
   try {
       String? token = await pref.getAccessToken();      
      // var map = <String, dynamic>{};
      log(ApiUrls.orders + "?limit=10&page=1");
      // log(map.toString());
      http.Response response = await http.get(
      Uri.parse(ApiUrls.make),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("Make Api Response=>> " +
        (response.body).toString());
        isLoading.value = false;
         OrderModel res = OrderModel.fromJson(json.decode(response.body));
         orderList = res.data;
         update();     
      } 
      else{
          isLoading.value = false;
          update();
        //  hideLoader(loader);

      }
  } catch (e) {
     isLoading.value = false;
         update();
     log(e.toString());
    
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
   }

// List Of Vehicle
final vehicleListLoading = true.obs;
List<VehicleListModelData>? vehicleList;
var selectVehicleId;
var selectfuelTypeId;
var fuelQuantity;
Future<void> GetVehicleList() async{
   try {
      String? token = await pref.getAccessToken();      
      log(ApiUrls.vehicles + "?limit=10&page=1");     
      http.Response response = await http.get(
      Uri.parse(ApiUrls.vehicles),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        vehicleListLoading.value = false;
        update();
      log("vehicles?limit=10&page=1 Response=>> " +
        (response.body).toString());
          isLoading.value = false;
         VehicleListModel res = VehicleListModel.fromJson(json.decode(response.body));
         vehicleList = res.data;
         update();     
      } 
      else{
        vehicleListLoading.value = false;
        update();       
      }
  } catch (e) {
     vehicleListLoading.value = false;
        update();
     log(e.toString());
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
   }
// Fuel Type Api
Future<void> fuelTypeApi() async{
   try{
      String? token = await pref.getAccessToken();      
      log(ApiUrls.fuelType + "?limit=10&page=1");     
      http.Response response = await http.get(
      Uri.parse(ApiUrls.fuelType+ "?limit=10&page=1"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        fuelLoaidng.value = false;
        update();
      log("fuel-Type?limit=10&page=1 Response=>> " +
        (response.body).toString());
          fuelLoaidng.value = false;  
         FuelTypeModel res = FuelTypeModel.fromJson(json.decode(response.body));
         fuelTypeList = res.data;
         update();     
      } 
      else{
        fuelLoaidng.value = false;
        update();       
      }
  } catch (e) {
     fuelLoaidng.value = false;
        update();
     log(e.toString());
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
   }
}
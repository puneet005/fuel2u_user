import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderController extends GetxController{
   
    final emptyOrder = true.obs;
    final confirmNextBth = false.obs;    
    late int selectVehicle;
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

    List fuelTypeList = ["87 Octane", "89 Octane", "Diesel"];
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
    // getVaild();
    selectVehicle = -1;
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
    selectVehicle = index;
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



    

}
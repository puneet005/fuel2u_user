import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fuel2u_user/controller/login_controller.dart';
import 'package:fuel2u_user/model/location_list_model.dart';
import 'package:fuel2u_user/model/order/card_detail_model.dart';
import 'package:fuel2u_user/model/order/fuel_type_model.dart';
import 'package:fuel2u_user/model/order/order_creating_model.dart';
import 'package:fuel2u_user/model/order/single_order_model.dart';
import 'package:fuel2u_user/model/order_model.dart';
import 'package:fuel2u_user/model/profile_model.dart';
import 'package:fuel2u_user/model/sign_up_model/promocode_model.dart';
import 'package:fuel2u_user/model/socket_model/all_truck_in_map_model.dart';
import 'package:fuel2u_user/model/socket_model/get_user_order.dart';
import 'package:fuel2u_user/model/vehicle/vehicle_list_model.dart';
import 'package:fuel2u_user/resources/session_manager.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/confirm_order.dart';
import 'package:fuel2u_user/view/order/order_process/driver_accpet_request.dart';
import 'package:fuel2u_user/view/order/order_process/order_review.dart';
import 'package:fuel2u_user/view/order/select_location.dart';
import 'package:fuel2u_user/view/order/select_payment_method.dart';
import 'package:fuel2u_user/view/order/single_order_in_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../utils/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class OrderController extends GetxController {
  final emptyOrder = true.obs;
  final confirmNextBth = false.obs;
  late int selectVehicleIndex;
  late int selectPlan;
  final payAsGo = false.obs;  
  late int selectAddress;
  late int selectPaymentMethod;
  late Map selectdata;
  final promoCodeCtrl = TextEditingController();
  final promoCodeInPlanSelect = false.obs;
  final commentCtrl = TextEditingController();
  //  Rating Screen Variable
  final ratingCommentCtrl = TextEditingController();
  final rateingFomrKey = GlobalKey<FormState>();
  final israting = false.obs;
  final rateStar = 0.obs;
  final submitRateing = false.obs;

  //  Edit Variable
  final isEdit = false.obs;
  final iseditSeeMore = false.obs;

// List staticfuelTypeList = ["87 Octane", "89 Octane", "Diesel"];
  DateTime today = DateTime.now();

// Order Details after Order Creating in Main Order List
  SingleOrderModelData? orderDetailsData;

  int? planId;
// Get Next 9 Days Function
  void getnextDay() {
    DateTime _firstDayOfTheweek =
        today.subtract(new Duration(days: today.weekday));
    print(_firstDayOfTheweek.toString());
  }

// Get Date and Day
 Future<void> mainDate() async{
//  Change this to the number of days you want to add.
    dateListofdays.clear();
    List<DateTime> dateList = [];
    var currentDate = DateTime.now();
    // var numberOfDays = 9;
    String? formattedDate;
    for (var i = 0; i < 9; i++) {
      dateList.add(currentDate);
      currentDate = currentDate.add(Duration(days: 1));
    }
    print('List of Dates:');
    for (var date in dateList) {     
      formattedDate = DateFormat('yyyy-MM-dd').format(date);
      var formattedDate2 = DateFormat('dd').format(date);
      dateListofdays.add({

        "day": getDayOfWeek(date),
        "date": "$formattedDate",
        "shortData": formattedDate2
      });
      // print('$date :::::: ${getDayOfWeek(date)}');
      // print(dateListofdays.toString());
      // getDayOfWeek(date);
      update();
    }
  }

// Business Date
Future<void> BusinessDate(List<String>? day
) async{
  
//  Change this to the number of days you want to add.
    log("BusinessDate block");
    log(day.toString());
    dateListofdays.clear();
    List<DateTime> dateList = [];
    var currentDate = DateTime.now();
    // var numberOfDays = 9;
    String? formattedDate;
    for (var i = 0; i < 9; i++) {
      dateList.add(currentDate);
      
      currentDate = currentDate.add(Duration(days: 1));
    }
  log(dateList.toString());
    print('List of Dates:');
    if(day!.isNotEmpty || day != null){
    for (var date in dateList) {     
      formattedDate = DateFormat('yyyy-MM-dd').format(date);
      var formattedDate2 = DateFormat('dd').format(date);
    var weekname = getDayOfWeek(date);
    log( "weekName ==> " + weekname);
    
    for(int j =0; j< day.length; j++){
      String shotday = day[j].substring(0, 3);
      log("shotday ====> " +shotday);
      if(shotday == weekname){
        dateListofdays.add({
        "day": weekname,
        "date": "$formattedDate",
        "shortData": formattedDate2
      });
      }
    }
    // if(weekname == "Mon" || weekname == "Tue"){
    //    dateListofdays.add({
    //     "day": weekname,
    //     "date": "$formattedDate",
    //     "shortData": formattedDate2
    //   });
    // }           
    print(dateListofdays.toString());    
    update();
    }
    }
  }






  String getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  List<Map<String, String>> dateListofdays = [];

  final selectFuelAmount = 0.obs;
  late int selectFuelType;
  // late int selectVehicle;

// All Google Map variable and location
  GoogleMapController? mapController;

  LatLng center = const LatLng(35.1281495, -90.5809757);
  final Set<Marker> markers = {};
  @override
  void onInit() {
    super.onInit();
    getnextDay();
    
    getOrder();
    // selectVehicleIndex = -1;
    // selectFuelType = -1;
    // selectPlan = -1;
    // selectAddress = -1;
    // selectPaymentMethod = -1;
    selectdata = {};
    Future.delayed(Duration(seconds: 3), () {
      emptyOrder.value = false;
      update();
      // GetTruckImage();
    });
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
    selectFuelAmount.value = value!;
    update();
  }

  void checkRateing() {
    if (rateStar > 0 && ratingCommentCtrl.text.isNotEmpty) {
      israting.value = true;
      update();
    } else {
      israting.value = false;
      update();
    }
  }

// for calling api if you need in another controller
  final newOrderCretating = false.obs;
// Api Calling Block

// Only 10 order show
  SessionManager pref = SessionManager();
  final isLoading = true.obs;
  List<OrderListModelData>? orderList ;
  List<FuelTypeModelData>? fuelTypeList;
  final fuelLoaidng = true.obs;
  final orderLoading = true.obs;
// Order List Api
  Future<void> getOrder() async {
    if(await ConnectivityWrapper.instance.isConnected){
    List<OrderListModelData>? allorderList;
    orderList = [];
    orderList!.clear();
    allorderList = [];
    update();
    // try {
    String? token = await pref.getAccessToken();
    if (token == null || token == "") {
      token = oneTimeToken;
    }
    // var map = <String, dynamic>{};
    log(ApiUrls.orders + "?limit=10&page=1");
    // log(map.toString());
    http.Response response =
        await http.get(Uri.parse(ApiUrls.orders), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).timeout(Duration(seconds: 30));
    log(response.body);
    if (response.statusCode == 200) {
      allorderList.clear();
      orderList?.clear();
      log("orders Api Response=>> " + (response.body).toString());
      OrderListModel res = OrderListModel.fromJson(json.decode(response.body));
      allorderList = res.data;
      for(int i =0 ; i< allorderList!.length; i++){
        log(allorderList[i].status.toString());
        log("${allorderList[i].status}==Out for Delivery");
          //  if(allorderList[i].status == "Completed" || allorderList[i].status == "Cancelled" || allorderList[i].status == "Completed"){
            if(allorderList[i].status?.removeAllWhitespace == "Received" || 
            allorderList[i].status?.removeAllWhitespace == "Confirmed" || 
            allorderList[i].status == "Pre-Auth Successful" ||  
            allorderList[i].status == "In Progress" || 
            allorderList[i].status == "Out for Delivery"|| 
            allorderList[i].status == "Delivered"){
               orderList!.add(allorderList[i]);
               update();
           }
           else{
            // if(orderList!.isEmpty){

            // }

            
           }
             update();

        }
      // orderList = res.data;
      orderLoading.value = false;
      update();
    } else {
      orderLoading.value = false;
      update();
      //  hideLoader(loader);
    }
    }
    else{
     orderLoading.value = false;
      update();
      ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
    // } catch (e) {
    //   orderLoading.value = false;
    //   update();
    //   log(e.toString());

    //   // hideLoader(loader);
    //   ToastUi(
    //     e.toString(),
    //     bgColor: ColorCode.red,
    //     textColor: ColorCode.white,
    //   );
    // }
  }

// List Of Vehicle
  final vehicleListLoading = true.obs;
  List<VehicleListModelData>? vehicleList;
  var selectVehicleId;
  var selectfuelTypeId;
  var fuelQuantity;
  Future<void> GetVehicleList() async {
    try {
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.vehicles + "?limit=10&page=1");
      http.Response response = await http
          .get(Uri.parse(ApiUrls.vehicles + "?limit=10&page=1"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        vehicleListLoading.value = false;
        update();
        log("vehicles Response=>> " +
            (response.body).toString());
        isLoading.value = false;
        VehicleListModel res =
            VehicleListModel.fromJson(json.decode(response.body));
        vehicleList = res.data;
        update();
      } else {
        vehicleListLoading.value = false;
        update();
      }
    } catch (e) {
      vehicleListLoading.value = false;
      if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          // hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
          vehicleListLoading.value = false;
    log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      update();
      // log(e.toString());
      // // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
    }
  }

// Fuel Type Api
  Future<void> fuelTypeApi() async {
    try {
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.fuelType + "?limit=10&page=1");
      http.Response response = await http
          .get(Uri.parse(ApiUrls.fuelType + "?limit=10&page=1"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        
       
        // update();
        minFuelApi();
        log("fuel-Type?limit=10&page=1 Response=>> " +
            (response.body).toString());
        // fuelLoaidng.value = false;
        FuelTypeModel res = FuelTypeModel.fromJson(json.decode(response.body));
        fuelTypeList = res.data;
        fuelLoaidng.value = false;
        update();
      } else {
        fuelLoaidng.value = false;
        update();
      }
    } catch (e) {
      fuelLoaidng.value = false;
      update();
      if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          // hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    fuelLoaidng.value = false;
    log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      // log(e.toString());
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
    }
  }
String? minFuelType;
 Future<void> minFuelApi() async {
    try {
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.minFuelAmount);
      http.Response response = await http
          .get(Uri.parse(ApiUrls.minFuelAmount), headers: {
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
        var res = jsonDecode(response.body);
        minFuelType = res['min_fuel_amount'];
        // FuelTypeModel res = FuelTypeModel.fromJson(json.decode(response.body));
        // fuelTypeList = res.data;
        update();
      } else {
        fuelLoaidng.value = false;
        update();
      }
    } catch (e) {
      fuelLoaidng.value = false;
      update();
      log(e.toString());
      if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
   
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
    }
  }

//  List Of Location
  List<LocationListModelData>? locationList;
  LocationListModelData? selectLocation;
  final locationLoading = true.obs;
  Future<void> GetLocationList() async {
    try {
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.locations + "?limit=10&page=1");
      http.Response response = await http
          .get(Uri.parse(ApiUrls.locations + "?limit=10&page=1"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        locationLoading.value = false;
        update();
        log("vehicles?limit=10&page=1 Response=>> " +
            (response.body).toString());
        locationLoading.value = false;
        LocationListModel res =
            LocationListModel.fromJson(json.decode(response.body));
        locationList = res.data;
        update();
      } else {
        locationLoading.value = false;
        update();
      }
    } catch (e) {
      locationLoading.value = false;
      update();
      log(e.toString());
      // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          // hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    }
  }

  // Profile Api Get User Data
  ProfileModelData? profileData;
  final profileLoading = true.obs;
  Future<void> ProfileApi(BuildContext context) async {
    // try {
    
    OverlayEntry loader = overlayLoader(context);
    Overlay.of(context).insert(loader);
    if(await ConnectivityWrapper.instance.isConnected){
    profileLoading.value = true;
    update();
    String? token = await pref.getAccessToken();
    if (token == null || token == "") {
      token = oneTimeToken;
    }
    log(ApiUrls.profile);
    http.Response response =
        await http.get(Uri.parse(ApiUrls.profile), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).timeout(Duration(seconds: 30));
    log(response.body);
    if (response.statusCode == 200) {
      log("profile Response=>> " + (response.body).toString());
      ProfileModel res = ProfileModel.fromJson(json.decode(response.body));
      profileData = res.data;
      update();
      // if(res.data!.userType != "User" && res.data!.userType != "Family User"){
      // VerifyPromoCode(context, profileData!.promocode.toString());
      // }
      if(res.data!.userType == "Employee"){
        VerifyPromoCode(context, profileData!.promocode.toString());
      }
      if(res.data!.userType == "Employer"){
          selectPlan = 1;
          isPromoCodevalid.value = true;
          update();
      }
      update();
      hideLoader(loader);
    } else {
      profileLoading.value = false;
      update();
      hideLoader(loader);
      // return false;
    }
    }
    else{
      hideLoader(loader);
      ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
  }

  // verify-promocode APi
  final isPromoCodevalid = false.obs;
  Future<void> VerifyPromoCode(BuildContext context, String code) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.verfiyPromocode);
      var map = <String, dynamic>{};
      map['promocode'] = code;
      http.Response response = await http.post(
          Uri.parse(ApiUrls.verfiyPromocode),
          body: jsonEncode(map),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        // locationLoading.value = false;
       
        update();
        log("verfiyPromocode Response=>> " + (response.body).toString());
        var res = json.decode(response.body);

        if (res['is_valid'] == true) {
           selectPlan = 1;
          isPromoCodevalid.value = true;

          update();
        } else {
          isPromoCodevalid.value = false;
          // selectPlan = 1;
          update();
        }
        profileLoading.value = false;
        update();
        hideLoader(loader);
      } else {
        profileLoading.value = false;
        update();
        hideLoader(loader);
      }
    } catch (e) {
      profileLoading.value = false;
      update();
      log(e.toString());
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
    }
  }

  PromocodeModelData promoCodeDetail = PromocodeModelData();
  Future<void> updatePromoCodeApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.updatePromocode);
      var map = <String, dynamic>{};
      map['promocode'] = promoCodeCtrl.text.trim();
      http.Response response = await http.post(
          Uri.parse(ApiUrls.updatePromocode),
          body: jsonEncode(map),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }).timeout(Duration(seconds: 30));
      log(response.body);
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        // locationLoading.value = false;
        update();
        log("updatePromocode Response=>> " + (response.body).toString());
        // var res = json.decode(response.body);
        PromocodeModel res = PromocodeModel.fromJson(data);
        log(res.toString());
        if (res.status == true) {
          promoCodeDetail = res.data!;
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SelectPaymentMethod(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
        hideLoader(loader);
      } else {
        profileLoading.value = false;
        update();
        hideLoader(loader);
      }
    } catch (e) {
      profileLoading.value = false;
      update();
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      // log(e.toString());
      // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
    }
    // /update/promocode
  }

// Get Plans
  // Future<void> GetPlan(BuildContext context, int id) async {
  //   OverlayEntry loader = overlayLoader(context);
  //   try {
  //     String? token = await pref.getAccessToken();
  //     if (token == null || token == "") {
  //       token = oneTimeToken;
  //     }
  //     Overlay.of(context).insert(loader);
  //     var map = <String, dynamic>{};
  //     map['plan_id'] = id;
  //     log(ApiUrls.plans);
  //     log(map.toString());
  //     http.Response response = await http
  //         .post(Uri.parse(ApiUrls.plans), body: jsonEncode(map), headers: {
  //       HttpHeaders.contentTypeHeader: 'application/json',
  //       HttpHeaders.acceptHeader: 'application/json',
  //       HttpHeaders.authorizationHeader: 'Bearer $token',
  //     }).timeout(Duration(seconds: 30));
  //     // ignore: unused_local_variable
  //     var data = json.decode(response.body);
  //     log(response.body);
  //     if (response.statusCode == 200) {
  //       // log("Promo code Api Response=>> " +
  //       //   (response.body).toString());
  //       hideLoader(loader);
  //       if (data['status'] == true) {
  //         if(id == 3){
  //            PersistentNavBarNavigator.pushNewScreen(
  //                                     context,
  //                                     screen: SelectPaymentMethod(),
  //                                     withNavBar:
  //                                         true, // OPTIONAL VALUE. True by default.
  //                                     pageTransitionAnimation:
  //                                         PageTransitionAnimation.cupertino,
  //             );
  //         }
  //         else{
  //         PersistentNavBarNavigator.pushNewScreen(
  //           context,
  //           screen: SelectLocation(),
  //           withNavBar: true,
  //           pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //         );
  //         }
  //       }
  //     } else {
  //       hideLoader(loader);
  //       ToastUi(
  //         data['message'].toString(),
  //         bgColor: ColorCode.red,
  //         textColor: ColorCode.white,
  //       );
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     hideLoader(loader);
  //     hideLoader(loader);
  //     ToastUi(
  //       e.toString(),
  //       bgColor: ColorCode.red,
  //       textColor: ColorCode.white,
  //     );
  //   }
  // }

// Get Card Details
  List<CardDetailModelData>? cardDetails;
  CardDetailModelData? selectedCardDetails;
  final cardLoading = true.obs;
  Future<void> GetCardList(BuildContext context) async {
    // OverlayEntry loader = overlayLoader(context);
    try {
      cardLoading.value = true;
      update();
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      // Overlay.of(context).insert(loader);
      // var map = <String, dynamic>{};
      // map['plan_id']= 1;
      log("${ApiUrls.paymentMethods}?order_type=${planId !=3 ?"personal":"business"}");

      http.Response response =
          await http.get(Uri.parse("${ApiUrls.paymentMethods}?order_type=${planId !=3 ?"personal":"business"}"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        log("payment-methods Api Response=>> " + (response.body).toString());
        CardDetailModel res = CardDetailModel.fromJson(data);
        if (data['status'] == true) {
          cardDetails = res.data!;
        }
        cardLoading.value = false;
        update();
        //  hideLoader(loader);
      } else {
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
      cardLoading.value = false;
      update();
    } catch (e) {
      log(e.toString());

      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          // hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      cardLoading.value = false;
      update();
    }
  }

  void cleanAllData() {
    selectVehicleIndex = -1;
    selectFuelType = -1;
    selectFuelAmount.value = 0;
    selectPlan = -1;
    update();
    selectAddress = -1;
    selectPaymentMethod = -1;
    selectdata = {};
    update();
    if(orderList != null)
    orderList!.clear();
    if(fuelTypeList != null)
    fuelTypeList!.clear();
    commentCtrl.clear();
    promoCodeDetail = PromocodeModelData();
    if(cardDetails != null)
    cardDetails!.clear();
    selectedCardDetails = CardDetailModelData();
    // fuelTypeList!.clear();
    isEdit.value = false;

    Future.delayed(Duration(seconds: 3), () {
      emptyOrder.value = false;
      update();
    });

    update();
  }

  OrderCreatingModelData? orderCreatingData;
  Future<void> CreateOrderApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.orders);
      var map = <String, dynamic>{};
      if(payAsGo.value){
      
      map['location_id'] = selectLocation!.id.toString();

      }     
      map['vehicle_id'] = vehicleList![selectVehicleIndex].id;
      map['fuel_type_id'] = selectfuelTypeId;
      map['fuel_quantity'] = selectFuelAmount.value == 1
          ? "I only want \$${minFuelType} of fuel"
          : "Fill the tank";
      map['instructions'] = commentCtrl.text.trim();
      map['delivery_date'] = selectdata['date'];
      map['payment_method'] = selectedCardDetails!.id.toString();
      map['plan_id'] = planId;
      log(map.toString());
      http.Response response = await http
          .post(Uri.parse(ApiUrls.orders), body: jsonEncode(map), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      var res = json.decode(response.body);
      OrderCreatingModel data = OrderCreatingModel.fromJson(res);
      if (response.statusCode == 200) {
        // locationLoading.value = false;
        update();
        log("orders Response=>> " + (response.body).toString());
        if (data.status == true) {
          orderCreatingData = data.data;
          update();
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: ComfirmOrder(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
          hideLoader(loader);
        }
        // Get.offAllNamed(Routes.HOME);
        else {
          ToastUi(
            data.message.toString(),
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
          hideLoader(loader);
        }
        hideLoader(loader);
      } else {
        hideLoader(loader);
        ToastUi(
          res['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      profileLoading.value = false;
      update();
      log(e.toString());
      if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    }
  }

// Get Review
  // OrderCreatingModelData? orderCreatingData;
  Future<void> GetRateingOnOrder(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.orderRating);
      var map = <String, dynamic>{};
      map['order_id'] = orderDetailsData!.id.toString();
      map['rating'] = rateStar.value;
      map['feedback'] = ratingCommentCtrl.text.trim();
      log(map.toString());
      http.Response response = await http.post(Uri.parse(ApiUrls.orderRating),
          body: jsonEncode(map),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }).timeout(Duration(seconds: 30));
      log(response.body);
      var res = json.decode(response.body);
      OrderCreatingModel data = OrderCreatingModel.fromJson(res);
      if (response.statusCode == 200) {
        update();
        log("Rateing Response=>> " + (response.body).toString());
        if (data.status == true) {
          // GetSingleOrderDetailsApi(context, orderDetailsData!.id.toString());
          hideLoader(loader);
          submitRateing.value = true;
          update();
        }
        // Get.offAllNamed(Routes.HOME);
        else {
          ToastUi(
            data.message.toString(),
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
          hideLoader(loader);
        }
        hideLoader(loader);
      } else {
        hideLoader(loader);
        ToastUi(
          res['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      profileLoading.value = false;
      update();
      log(e.toString());
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
      // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
    }
  }

  // Get Info Single Order
  Future<void> GetSingleOrderDetailsApi(BuildContext context, String id) async {
    OverlayEntry loader = overlayLoader(context);
    // try {
    orderDetailsData = SingleOrderModelData();
    Overlay.of(context).insert(loader);
    String? token = await pref.getAccessToken();
    if (token == null || token == "") {
      token = oneTimeToken;
    }
    log(ApiUrls.orders + "/$id");

    http.Response response =
        await http.get(Uri.parse("${ApiUrls.orders}/$id"), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).timeout(Duration(seconds: 30));
    log(response.body);
    var res = json.decode(response.body);
    SingleOrderModel data = SingleOrderModel.fromJson(res);
    if (response.statusCode == 200) {
      update();
      log("One Order Details Response=>> " + (response.body).toString());
      if (data.status == true) {
        orderDetailsData = data.data;
        MangerScreenBaseOnStatus(context, data.data as SingleOrderModelData);
        hideLoader(loader);
        // Navigator.of(context).pop(false);
      } else {
        ToastUi(
          data.message.toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
        hideLoader(loader);
      }
      hideLoader(loader);
    } else {
      hideLoader(loader);
      ToastUi(
        res['message'].toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
    }
    // } catch (e) {
    //   profileLoading.value = false;
    //   update();
    //   log(e.toString());
    //   hideLoader(loader);
    //   ToastUi(
    //     e.toString(),
    //     bgColor: ColorCode.red,
    //     textColor: ColorCode.white,
    //   );
    // }
  }

  MangerScreenBaseOnStatus(BuildContext context, SingleOrderModelData data) {
    OrderController controller = Get.find<OrderController>();
    controller.orderDetailsData = data;
    if (data.status == "Out for Delivery") {
      controller.update();
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: SingleOrderViewMap(
          id: data.id!,
        ),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else if (data.status == "In Progress")
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: DriverAccpetRequest(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    else {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen:
            // DriverAccpetRequest(),
            OrderReviewStatus(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
  }

  Position? currentPosition;
  final alltruckinMap = true.obs;
  List<AllTruckInMapModelData> driverList = [];
  final selectDriver = 0.obs;
  final mapFullLoading = true.obs;
  Future<bool> getCurrentPosition() async {
    markers.clear();
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/location.png",
    );
    log("Get Location Permission");
    // try {
      final hasPermission = await _handleLocationPermission();
  
      Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );  
  log(position.toString()); 
  if(position != null){
    currentPosition = position;
        center = LatLng(position.latitude, position.longitude);
        update();
        // log(LatLng(position.latitude, position.longitude).toString());
        // markers.add()
        //  mapController!.animateCamera(
        //   CameraUpdate.newLatLng(
        //     LatLng(position.latitude, position.longitude),
        //   ),
        // ); 
        markers.add(Marker(
          // This marker id wan be anything that uniquely identifies each marker.
          markerId: MarkerId("1"),
          position: LatLng(position.latitude, position.longitude),
          icon: markerbitmap,
        ));
        update();
        initSocket();
        return true;
  }
else{
  log("Not Getting Location");
   return false;
}
      // await Geolocator.getCurrentPosition(
      //         desiredAccuracy: LocationAccuracy.high)
      //     .then((Position position) {
      //   currentPosition = position;
      //   mapController!.animateCamera(
      //     CameraUpdate.newLatLng(
      //       LatLng(position.latitude, position.longitude),
      //     ),
      //   );
      //   center = LatLng(position.latitude, position.longitude);
      //   update();
      //   // log(LatLng(position.latitude, position.longitude).toString());
      //   // markers.add()
      //   markers.add(Marker(
      //     // This marker id wan be anything that uniquely identifies each marker.
      //     markerId: MarkerId("1"),
      //     position: LatLng(position.latitude, position.longitude),
      //     icon: markerbitmap,
      //   ));
      //   update();
      //   initSocket();
      //   return true;
      // })
      // .catchError((e) {
      //   log("catch Error Location");
      //   log(e.toString());
      //   return false;
      // });
      return true;
    // } catch (e) {
    //   log(e.toString());
    //   return false;
    // }
  }

// Add Location
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

// Edit Order Data Get Api
  final editLoading = true.obs;
  SingleOrderModelData? editOrderDetailsData;
  Future<void> GetEditOrderDetailsApi(BuildContext context, String id) async {
// OverlayEntry loader = overlayLoader(context);
editLoading.value = true;
      update();
    try {
      
      editOrderDetailsData = SingleOrderModelData();
      // Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.orders + "/$id");

      http.Response response =
          await http.get(Uri.parse("${ApiUrls.orders}/$id"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      var res = json.decode(response.body);
      SingleOrderModel data = SingleOrderModel.fromJson(res);
      if (response.statusCode == 200) {
        update();
        log("Edit Order Details Response=>> " + (response.body).toString());
        if (data.status == true) {
          editOrderDetailsData = data.data;
          editdate = editOrderDetailsData!.orderDeliveryDay!.split(" ");
          commentCtrl.text = editOrderDetailsData!.instructions ?? "";
          editLoading.value = false;
          update();
        } else {
        editLoading.value = false;
        update();
          ToastUi(
            data.message.toString(),
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
          // hideLoader(loader);
        }
        // hideLoader(loader);
      } else {
        editLoading.value = false;
        update();
        // hideLoader(loader);
        ToastUi(
          res['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      editLoading.value = false;
      update();
      profileLoading.value = false;
      update();
      log(e.toString());
      // // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          // hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    }
  }
// update live Location

  Future<bool> OrderLocaionUpdate(BuildContext context, String id) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.orderLocationUpdate);
      var map = <String, dynamic>{};
      map['id'] = id;
      map['address'] = streetAddressCtrl.text.trim();
      map['city'] = cityCtrl.text.trim();
      map['zipcode'] = zipCodeCtrl.text.trim();
        map['latitude'] = addLanlng != null ? addLanlng!.latitude:currentPositionForAddress!.latitude;
      map['longitude'] =  addLanlng != null ? addLanlng!.longitude: currentPositionForAddress!.longitude;
      // map['latitude'] = currentPositionForAddress!.latitude;
      // map['longitude'] = currentPositionForAddress!.longitude;
      log(map.toString());
      http.Response response = await http.post(
          Uri.parse(ApiUrls.orderLocationUpdate),
          body: jsonEncode(map),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }).timeout(Duration(seconds: 30));
      log(response.body);
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        // locationLoading.value = false;
        update();
        log("verfiyPromocode Response=>> " + (response.body).toString());
        if (res['status'] == true) {
          hideLoader(loader);
          ToastUi(
            res['message'],
            bgColor: Colors.green,
            textColor: ColorCode.white,
          );
          return true;
        } else {
          hideLoader(loader);
          ToastUi(
            res['message'],
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
          update();
          hideLoader(loader);
          return false;
        }
      } else {
        // profileLoading.value = false;
        // update();
        hideLoader(loader);
        return false;
      }
    } catch (e) {
      profileLoading.value = false;
      update();
     if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
         if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    // log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
    }
      return false;
    }
  }

  // Live Location
  String? _currentAddress;
  Position? currentPositionForAddress;
  final usecurrentLoading = false.obs;
  final streetAddressCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final zipCodeCtrl = TextEditingController();
  final addressFormValid = false.obs;
  LatLng? addLanlng;

  Future<void> getCurrentPositionForLive() async {
    // update();
    log("Get Location Permission");
    final hasPermission = await _handleLocationPermission();
    log(hasPermission.toString());
    if (!hasPermission) {}
    ;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPositionForAddress = position;
      update();
      log(position.toString());
      // if(userLive){
      getAddressFromLatLng(position);
      // }
      // _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    isLoading.value = true;
    update();
    await placemarkFromCoordinates(currentPositionForAddress!.latitude,
            currentPositionForAddress!.longitude)
        .then((List<Placemark> placemarks) {
      // log(placemarks.toString());
      Placemark place = placemarks[0];
      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}, ${place.administrativeArea}';
      streetAddressCtrl.text = place.street.toString();
      cityCtrl.text = place.locality.toString();
      zipCodeCtrl.text = place.postalCode.toString();
      isLoading.value = false;
      addressFormCheck();
      update();
      log(_currentAddress.toString());
    }).catchError((e) {
      debugPrint(e);
      isLoading.value = false;

      update();
    });
  }

  addressFormCheck() {
    log({
      cityCtrl.text.toString(),
      streetAddressCtrl.text.toString(),
      // stateCodeValue.toString(),
      zipCodeCtrl.text.toString()
    }.toString());
    if (cityCtrl.text.isNotEmpty &&
        streetAddressCtrl.text.isNotEmpty &&
        zipCodeCtrl.text.isNotEmpty) {
      addressFormValid.value = true;
      update();
    } else {
      addressFormValid.value = false;
      update();
    }
  }

// Edit Order Variable And Api
  List editdate = [];

// MAP LOCATION PART

//  Set Location Maker
  final Set<Marker> oneOrdermarkers = {};
  Marker? myCarlocation;
  Marker? driverlocation;
  SetCarLocation(String name, double lat, double long) async {
    oneOrdermarkers.clear();
    log("GetSingleTruck");
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/location.png",
    );
    myCarlocation = Marker(
      markerId: MarkerId("1"),
      position: LatLng(lat, long),
      icon: markerbitmap,
    );
    // oneOrdermarkers.add(Marker(
    //       markerId: MarkerId(name),
    //       position: LatLng(lat, long),
    //       icon: markerbitmap,
    //     ));
    update();
  }

  SetTruckLocation(String name, double lat, double long) async {
    oneOrdermarkers.clear();
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/truck_icon.png",
    );
    driverlocation = Marker(
      markerId: MarkerId(name),
      position: LatLng(lat, long),
      icon: markerbitmap,
    );
    update();
  }

  final singleOrderMapLoading = true.obs;
  GetUserOrderData? orderData;
  void updateLocation(lat, long) {
    log("CAlling UdateLocation");
    mapController!.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(lat, long),
      ),
    );
    center = LatLng(lat, long);
    singleOrderMapLoading.value = false;
    update();
  }

  // Web Scoket
  IO.Socket? socket;
  initSocket() async {
    log("calling scoket");
    singleOrderMapLoading.value = true;
    update();
    if (socket != null && socket!.connected) {
      socket!.disconnected;
      log("socket");
    }
    socket = IO.io(ApiUrls.socketUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
      // 'Authorization': 'Bearer ' + token!.toString()
    });
    socket!.connect();
    socket!.onConnect((_) {
      log("socket connect");
      ShowTruckInMap();
    });
    socket!.onDisconnect((_) {
      initSocket();
      singleOrderMapLoading.value = false;
      log("socket Disconnect"); 
    });
    socket!.onConnectError((err) {  
      singleOrderMapLoading.value = false;
      initSocket();
      log("onConnectError");
      log(err.toString());
      print(err);
    });
    socket!.onError((err) {
      singleOrderMapLoading.value = false;
      // controller.update();
      // if (kDebugMode) {
      initSocket();
      print(err);
      // }
    });
  }

  ShowTruckInMap() {
    
    alltruckinMap.value = true;
    if (markers.isNotEmpty) {
      markers.removeWhere((element) => element.markerId != MarkerId("1"));
    }
    update();
    log("nearByDriver");
    // log(widget.id.toString());
    socket!.emitWithAck("nearByDriver", {
      "latitude": currentPosition!.latitude,
      "longitude": currentPosition!.longitude
    }, ack: (val) {
      log(val);
    });

    socket!.on("nearByDriverResponse", (data) {
     
      driverList.clear();
      log("nearByDriverResponse ---> \n $data");
      var res = jsonEncode(data);
      AllTruckInMapModel driverData = AllTruckInMapModel.fromJson(data);
      log(res);
      log(data.runtimeType.toString());
      if (data != null) {
        List<AllTruckInMapModelData>? alldataList = [];
        alldataList = driverData.data;
        alltruckinMap.value = false;
        update();
        for (int i = 0; i < alldataList!.length; i++) {
          if (alldataList[i].latitude != null &&
              alldataList[i].longitude != null) {
            driverList.add(alldataList[i]);
            ShowAllDriverLocation(
                alldataList[i].firstName!,
                double.parse(alldataList[i].latitude!),
                double.parse(alldataList[i].longitude!), () {
              // if(i > 0){
              selectDriver.value = i;
              update();
              // }
              // else{
              //   selectDriver.value = i;
              //   update();
              // }
            });
          }
        }       
      } else {
        alltruckinMap.value = false;
        update();
      }
    });


    /**
        log('getUserOrders');
    log(profileData!.id.toString());
     socket!.emitWithAck("getUserOrders", {
      "user_id": profileData!.id.toString()
    }, ack: (val) {
      log(val);
    });

     socket!.on("getUserOrdersResponse", (data) {


      log("getUserOrdersResponse ---> \n $data");
     });
     */
  }

  ShowAllDriverLocation(
    String name, double lat, double long, void Function() onTap) async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/truck_icon.png",
    );
    markers.add(
      Marker(
          markerId: MarkerId(name),
          position: LatLng(lat, long),
          icon: markerbitmap,
          onTap: onTap),
    );
    update();
  }

  EditOrderDataSet() {
    editLoading.value = true;
    update();
    GetVehicleList().then((val) {
      for(int i =0; i < vehicleList!.length; i++){
          if(editOrderDetailsData!.vehicle!.id ==  vehicleList![i].id){
          selectVehicleIndex =i;
// update();
          }
      }
      fuelTypeApi().then((value) {
      for (int i = 0; i < fuelTypeList!.length; i++) {
        if (editOrderDetailsData!.fuelType!.id == fuelTypeList![i].id) {
          selectFuelType = i;
          selectfuelTypeId = fuelTypeList![i].id;
          update();
        }
        if (editOrderDetailsData!.fuelQuantity == "Fill the tank") {
          changeFuelAmount(2);
        } else {
          changeFuelAmount(1);
        }
      
      } 
    
    });
    if(editOrderDetailsData!.user!.userType == "User"){
      GetLocationList().then((value){        
         for(int i =0; i < locationList!.length; i++){
          if(editOrderDetailsData!.location!.id ==  locationList![i].id){
          selectLocation =  locationList![i];
          update();
          }
      }
      });
    }
    else{
      selectLocation = null;
       
    }
    if(editOrderDetailsData!.user!.userType == "User" || editOrderDetailsData!.user!.userType ==  "Family User"){
         mainDate().then((value)  {
        for(int j = 0; j < dateListofdays.length; j++){
          // log(dateListofdays[j]['date'].toString()  + "==" + editOrderDetailsData!.deliveryDate.toString());
      if(dateListofdays[j]['date'] ==  editOrderDetailsData!.deliveryDate){
        selectdata = dateListofdays[j];
        

      }
      // else{
      //   selectdata.clear();
      // }
    
    }  
    // //  editOrderDetailsData. =  commentCtrl
   
    
     });
    }
    else{
      BusinessDate(editOrderDetailsData!.business!.deliveryDay).then((value) => {
        for(int j = 0; j < dateListofdays.length; j++){
          // log(dateListofdays[j]['date'].toString()  + "==" + editOrderDetailsData!.deliveryDate.toString());
      if(dateListofdays[j]['date'] ==  editOrderDetailsData!.deliveryDate){
        selectdata = dateListofdays[j]
      }} 
        
      });

    }
    
           
     
    // 
    //  update();
    editLoading.value = false;
    update();
    });
    

  }

   Future<void>  editOrderApi(BuildContext context) async{
   
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.orders);
      var map = <String, dynamic>{};
      map['id'] = editOrderDetailsData!.id;
      map['location_id'] = selectLocation == null ? editOrderDetailsData!.location!.id : selectLocation!.id.toString();
      map['vehicle_id'] = selectVehicleIndex == null ? editOrderDetailsData!.vehicle!.id : vehicleList![selectVehicleIndex].id;
      map['fuel_type_id'] = selectfuelTypeId;
      map['fuel_quantity'] = selectFuelAmount.value == 1
          ? "I only want \$${minFuelType} of fuel"
          : "Fill the tank";
      map['instructions'] = commentCtrl.text.trim();
      map['delivery_date'] = selectdata['date'] == null ? editOrderDetailsData!.deliveryDate : selectdata['date'];
      map['payment_method'] = editOrderDetailsData!.paymentMethod.toString();
      log(map.toString());
      http.Response response = await http
          .post(Uri.parse(ApiUrls.orders), body: jsonEncode(map), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      var res = json.decode(response.body);
      OrderCreatingModel data = OrderCreatingModel.fromJson(res);
      if (response.statusCode == 200) {
        // locationLoading.value = false;
        update();
        log("orders Response=>> " + (response.body).toString());
        if (data.status == true) {
          hideLoader(loader);
           ToastUi(
            data.message.toString(),
            bgColor: Colors.green,
            textColor: ColorCode.white,
          );
          // orderCreatingData = data.data;
          getOrder();
          cleanAllData();
          update();
          Navigator.of(context).pop();

          hideLoader(loader);
        }
        // Get.offAllNamed(Routes.HOME);
        else {
          ToastUi(
            data.message.toString(),
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
          hideLoader(loader);
        }
        hideLoader(loader);
      } else {
        hideLoader(loader);
        ToastUi(
          res['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      profileLoading.value = false;
      update();
      // log(e.toString());
      // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    }
   }

   Future<void>  cancelOrderApi(BuildContext context) async{
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if (token == null || token == "") {
        token = oneTimeToken;
      }
      log(ApiUrls.orders);
      var map = <String, dynamic>{};
      map['id'] = editOrderDetailsData!.id;
      log(map.toString());
      http.Response response = await http
          .post(Uri.parse(ApiUrls.orderCancel), body: jsonEncode(map), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      var res = json.decode(response.body);
      OrderCreatingModel data = OrderCreatingModel.fromJson(res);
      if (response.statusCode == 200) {
        // locationLoading.value = false;
        update();
        log("cancel order Response=>> " + (response.body).toString());
        if (data.status == true) {
          hideLoader(loader);
           ToastUi(
            data.message.toString(),
            bgColor: Colors.green,
            textColor: ColorCode.white,
          );
          // orderCreatingData = data.data;
          
         
             Navigator.of(context).pop();
          getOrder();
          hideLoader(loader);
        }
        // Get.offAllNamed(Routes.HOME);
        else {
          ToastUi(
            data.message.toString(),
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
          hideLoader(loader);
        }
        hideLoader(loader);
      } else {
        hideLoader(loader);
        ToastUi(
          res['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      profileLoading.value = false;
      update();
      // log(e.toString());
      // hideLoader(loader);
      // ToastUi(
      //   e.toString(),
      //   bgColor: ColorCode.red,
      //   textColor: ColorCode.white,
      // );
       if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    log(e.toString());
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    }
   }


  //  Order History 
    final orderHistoryLoading = true.obs;
      List<OrderListModelData>? orderHistoryList;
  Future<void> orderHistory() async {
    // try {
    orderHistoryLoading.value = true;
    update();
    String? token = await pref.getAccessToken();
    if (token == null || token == "") {
      token = oneTimeToken;
    }
    // var map = <String, dynamic>{};
    log(ApiUrls.orders + "?limit=10000&page=1");
    // log(map.toString());
    http.Response response =
        await http.get(Uri.parse(ApiUrls.orders), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).timeout(Duration(seconds: 30));
    log(response.body);
    if (response.statusCode == 200) {
      log("orders Api Response=>> " + (response.body).toString());
      OrderListModel res = OrderListModel.fromJson(json.decode(response.body));
      orderHistoryList = res.data!;
      orderHistoryLoading.value = false;
      update();
    } else {
      orderHistoryLoading.value = false;
      update();
      //  hideLoader(loader);
    }
    // } catch (e) {
    //   orderHistoryLoading.value = false;
    //   // update();
    //   log(e.toString());

    //   // hideLoader(loader);
    //   ToastUi(
    //     e.toString(),
    //     bgColor: ColorCode.red,
    //     textColor: ColorCode.white,
    //   );
    // }
  }
  final loadingAllData = true.obs;
void loadingFlase() {
  loadingAllData.value =  false;
  update();
}
}

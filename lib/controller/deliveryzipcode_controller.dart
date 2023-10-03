

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/model/sign_up_model/delivery_zipcode_mode.dart';
import 'package:fuel2u_user/routes/app_pages.dart';

import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/session_manager.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../resources/session_manager.dart';

class DeliveryZipCodeController extends GetxController {
      final zipcode = TextEditingController();
      final zipCodeVaild = false.obs;
  // SessionManager pref = SessionManager();
  // String? token;
  // final headers =  {
  //   HttpHeaders.contentTypeHeader: 'application/json',
  //   HttpHeaders.acceptHeader: 'application/json',
  // };


    @override
  void onInit() {
    super.onInit();
    // Future.delayed(Duration(seconds: 3), () =>  Get.offAllNamed(Routes.WELCOME) );
   
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

  void getColors() {
    zipCodeVaild.value  = true;
  }
  void getColorsFalse(){
    zipCodeVaild.value = false;
  }


  // Delivey Zip Code Api 
   DeliveryZipCodeApi(context) async{
    OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
       var map = <String, dynamic>{};
      map['zipcode'] = zipcode.text.trim();
      
      http.Response response = await http.post(
      Uri.parse(ApiUrls.deliveryZipCodeVerify),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
    // Helpers.hideLoader(loader);
    
    log("Delivey ZipCode  Api Response=>> " +
        json.decode(response.body).toString());
        // if()
      hideLoader(loader);
     
      
    DeliveryZipcodeModel res = DeliveryZipcodeModel.fromJson(json.decode(response.body));
     ToastUi(res.message.toString(),);
    if(res.data == true){
      Get.toNamed(Routes.SIGNUP);
    }
    else{
       Get.toNamed(Routes.NOTAVAILABLEAREA);
    }
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  } catch (e) {
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
   }


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
  String? _currentAddress;
  Position? currentPositionForAddress;
  final isLoading = true.obs;
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
      zipcode.text = place.postalCode.toString();
      zipCodeVaild.value  = true;
      isLoading.value = false;      
      update();
      log(_currentAddress.toString());
    }).catchError((e) {
      debugPrint(e);
      isLoading.value = false;

      update();
    });
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

}
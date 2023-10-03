

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DeliveryZipCodeController extends GetxController {
      final zipcode = TextEditingController();
      final zipCodeVaild = false.obs;

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
  

}
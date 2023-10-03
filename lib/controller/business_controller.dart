import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessController extends GetxController {
    final employerNameCtrl = TextEditingController();
    final deliveryAddressCtrl = TextEditingController();
    final cityCtrl = TextEditingController();
    final zipCodeCtrl = TextEditingController();
    final deliveryInstructionsCtrl = TextEditingController();
    final promoCodeCtrl = TextEditingController();
    final contactNameCtrl = TextEditingController();
    final contactEmailCtrl = TextEditingController();
    final contactNumberCtrl = TextEditingController();
    final billingAddressCtrl = TextEditingController();
    final billingCityCtrl = TextEditingController();
    final billingStateCtrl = TextEditingController();
    final billingZipCodeCtrl = TextEditingController();

    final dropdownvalue = 'State'.obs;  

    final deliveryAddSame = false.obs; 
  
  // List of items in our dropdown menu
    final tierList=['YN', 'SF', 'WDC'].obs;
    Rx<String>? selected; 
    // final bill=['first', 'second', 'third'].obs;
    Rx<String>? billingState;
    final zipCodeVaild = false.obs;

    // Add Vehicle Screen 

  void checkSameBillingAddress(bool val) {
    deliveryAddSame.value =  val;
    update();
  }





}
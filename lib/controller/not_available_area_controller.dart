

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotAvailableAreaController extends GetxController {

      final phoneNo = TextEditingController();
      final phoneFormKey = GlobalKey<FormState>();
      final promoCodeCtrl =TextEditingController();
      final promoCodeFormKey = GlobalKey<FormState>();
      final phoneVaild = false.obs;
      final otpVaild = false.obs;
      final promoCodeVaild = false.obs;
      final promodeYesOrNo = 0.obs;
      


    @override
  void onInit() {
    super.onInit();
    // getVaild();
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

  void getVaild() {
    phoneVaild.value = true;
}

  void getVaildFalse() {
     phoneVaild.value = false;
  }

  void getoptValid() {
     otpVaild.value = true;
     update();
  }

  void getotpNotVaild() {
      otpVaild.value = false;
      update();
  }
  
  void getVaildPromoCode(){
    promoCodeVaild.value = true;
    update();
  }
   void getNotVaildPromoCode(){
    promoCodeVaild.value = false;
    update();
  }

  void setYesOrNo(int? value) {
    promodeYesOrNo.value = value!;
    print(promodeYesOrNo.value);
    update();

  }

  

}
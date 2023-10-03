import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignUpController extends GetxController {
  final firstnameCrt = TextEditingController();
  final lastnameCrt = TextEditingController();
  final phoneNoCrt = TextEditingController();
  final emailCrt = TextEditingController();
  final signupkey = GlobalKey<FormState>();
  final acceptTeam = false.obs;
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
    zipCodeVaild.value = true;
  }

  void getColorsFalse() {
    zipCodeVaild.value = false;
  }

  void checkAcceptTeam(bool val) {
    acceptTeam.value = val;
  }

  updateProfile() {
    firstnameCrt.text = "Joe";
    lastnameCrt.text = "Smyth";
    phoneNoCrt.text = "303-867-5309";
    emailCrt.text = "";
    update();
  }
}

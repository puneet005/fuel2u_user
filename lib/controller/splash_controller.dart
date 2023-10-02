import 'dart:developer';

import 'package:fuel2u_user/resources/session_manager.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SplashController extends GetxController {

    @override
  void onInit() {
    super.onInit();
    moveScreen();
    // print("Get Ready");
    // Future.delayed(Duration(seconds: 3), () =>  Get.offAllNamed(Routes.WELCOME) );
   
  }

  @override
  void onReady() {
    // super.onReady();
    // Future.delayed(Duration(seconds: 3), (){
    //   Get.offAllNamed(Routes.WELCOME);
    //     print("Get Ready");
    // });
    
    // useAccessibilityService();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  void moveScreen() async{
     SessionManager pref = SessionManager();
      String? token = await pref.getAccessToken();    
    log(token.toString()); 
     await Future.delayed(Duration(seconds: 2), (){
    if(token == null || token == ""){
      Get.offAllNamed(Routes.WELCOME);
    }
    else{
      // Get.offAllNamed(Routes.BUSINESSFORM);
       Get.offAllNamed(Routes.HOME);
    }
     });
    //  await Future.delayed(Duration(seconds: 3), (){
      // if(token != null || token != ""){
      //    Get.offAllNamed(Routes.HOME);
      // }
      // else{
      //   Get.offAllNamed(Routes.WELCOME);
      // }
    // });
  }
} 
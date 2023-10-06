import 'dart:developer';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:fuel2u_user/resources/session_manager.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../utils/ui_hepler.dart';

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
    if(await ConnectivityWrapper.instance.isConnected){
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
  }else{
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
    ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    
  }
  }
} 
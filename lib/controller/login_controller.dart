import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/main.dart';
import 'package:fuel2u_user/model/logig_otp_model.dart';
import 'package:fuel2u_user/resources/session_manager.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../model/sign_in_model.dart';
String? oneTimeToken;
class LoginController extends GetxController {

      final phoneNo = TextEditingController();
      final phoneFormKey = GlobalKey<FormState>();
      // final promoCodeCtrl =TextEditingController();
      // final promoCodeFormKey = GlobalKey<FormState>();
      final phoneVaild = false.obs;
      final otpVaild = false.obs;
      final reminderMe = false.obs;
      final onlyNumber = false.obs;
      // final promodeYesOrNo = 0.obs;
      SessionManager pref = SessionManager();
      SignInModelData loginUserDetail =  SignInModelData();
      LogigOtpModelData loginUserVerfityDetail = LogigOtpModelData();


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
  
  void getReminderMe(bool value){
    reminderMe.value = value;
    update();
  }
   
//  Sign In Api
Future<void> SignInApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
      
     
       var map = <String, dynamic>{};
       if(onlyNumber.value){
       var mobileNo =  phoneNo.text.trim().replaceAll("-"," ");
         map['phone_number'] = "${mobileNo.removeAllWhitespace}";
       }
       else{
         map['phone_number'] = phoneNo.text.trim();
       }      
      log(ApiUrls.signIn);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.signIn),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
        log("SignIn Api Response=>> " +
        json.decode(response.body).toString());
      var data = json.decode(response.body);
      if (response.statusCode == 200) {     
      hideLoader(loader);              
     SignInModel res = SignInModel.fromJson(json.decode(response.body));
     
      if(res.status == true){
      // Get.toNamed(Routes.LOGINOTP);
       if(res.data != null){
      // pref.setAccessToken(userVerftyDetail.accessToken);
      loginUserDetail = res.data!;
      ToastUi(res.data!.otpText.toString(),);
      Get.toNamed(Routes.LOGINOTP);
    }
    }
    else{
      hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );
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





   //  SignUp Verify
   Future<void> SignInVerifyApi(BuildContext context, String otp) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
      
      // var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['token']= loginUserDetail.token;
      map['otp'] = otp;
      map['device_token'] = fcmToken;
      // map['phone_number'] = "+1${mobileNo.removeAllWhitespace}";
      log(ApiUrls.signInVerify);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.signInVerify),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      // log(json.decode(response.body)); 
      log(response.body.toString());
      log("SignIn Verify Api Response=>> " +
        json.decode(response.body).toString());    
         LogigOtpModel result = LogigOtpModel.fromJson(json.decode(response.body));  
      if (response.statusCode == 200) {
        if(result.status == true){
         loginUserVerfityDetail = result.data!;
      if(reminderMe.value){
        pref.setAccessToken(loginUserVerfityDetail.accessToken);
      }      
      else{
        oneTimeToken = loginUserVerfityDetail.accessToken;
      }
      log(loginUserVerfityDetail.accessToken.toString());
      hideLoader(loader);   
      Get.offAllNamed(Routes.HOME);
      ToastUi(data['message'].toString(), 
      bgColor: Colors.green,
      textColor: ColorCode.white,
     );}
     else{      
    log(response.body.toString());
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     ); 
     }
    }
    else{
      log(response.body.toString());
      hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );
    } 
  } catch (e) {
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
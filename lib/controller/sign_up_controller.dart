import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/main.dart';
import 'package:fuel2u_user/model/profile_model.dart';
import 'package:fuel2u_user/model/sign_up_model/no_fuel.dart';
import 'package:fuel2u_user/model/sign_up_model/sign_up_model.dart';
import 'package:fuel2u_user/model/sign_up_model/sign_up_verify_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;


import '../model/sign_up_model/promocode_model.dart';
import '../resources/session_manager.dart';
import 'login_controller.dart';

class SignUpController extends GetxController {
  


      //  final phoneNo = TextEditingController();
  final phoneFormKey = GlobalKey<FormState>();
  final promoCodeCtrl =TextEditingController();
  final promoCodeFormKey = GlobalKey<FormState>();
  final phoneVaild = false.obs;
  final otpVaild = false.obs;
  final promoCodeVaild = false.obs;
  final promodeYesOrNo = 0.obs;
  final firstnameCrt = TextEditingController();
  final lastnameCrt = TextEditingController();
  final phoneNoCrt = TextEditingController();
  final emailCrt = TextEditingController();
  final signupkey = GlobalKey<FormState>();
  final acceptTeam = false.obs;
  final zipCodeVaild = false.obs;

  final isSignUp = false.obs;

  bool emailValid = false;
  SessionManager pref = SessionManager();


  //User Details
  SignUpModelData userDetail =  SignUpModelData();
  SignUpVerifyModelData userVerftyDetail =  SignUpVerifyModelData();
  PromocodeModelData promoCodeDetail =  PromocodeModelData();

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
void IsSignUpAllField(){
  // log(firstnameCrt.text.toString());

  // if(firstnameCrt.text.isNotEmpty && phoneNoCrt.text.isNotEmpty  && acceptTeam.value ){
  //   isSignUp.value = true;
  //   update(); 
  // }
  // else{
  //    isSignUp.value = false;
  //    update();
    
  // }
  // update(); 
}
  void getColors() {
    zipCodeVaild.value = true;
  }

  void getColorsFalse() {
    zipCodeVaild.value = false;
  }

  void checkAcceptTeam(bool val) {
    acceptTeam.value = val;
    update();
  }

  // updateProfile() {
  //   firstnameCrt.text = "Joe";
  //   lastnameCrt.text = "Smyth";
  //   phoneNoCrt.text = "303-867-5309";
  //   emailCrt.text = "";
  //   update();
  // }
  void getVaild() {
    phoneVaild.value = true;
    update();
}

  void getVaildFalse() {
     phoneVaild.value = false;
     update();
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
// NoFuel
  Future<void> NoFuelApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {      
      Overlay.of(context).insert(loader);
      var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['phone_number'] = "${mobileNo.removeAllWhitespace}";
      log(ApiUrls.noFuel);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.noFuel),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
    // Helpers.hideLoader(loader);
    log("No Fuel  Api Response=>> " +
        json.decode(response.body).toString());
        // if()
      hideLoader(loader);          
    NoFuelModel res = NoFuelModel.fromJson(json.decode(response.body));
     ToastUi(res.message.toString(),);
    if(res.status == true){
      Get.toNamed(Routes.SIGNUP);
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
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
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
//  Sign Up Api
Future<void> SignUpApi(BuildContext context) async {

    OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
      
      var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['first_name']= firstnameCrt.text.tr;
      map['last_name'] = lastnameCrt.text.tr;
      map['email'] = emailCrt.text.tr;
      map['phone_number'] = "${mobileNo.removeAllWhitespace}";
      log(ApiUrls.signup);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.signup),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
        log("SignUp Api Response=>> " +
        json.decode(response.body).toString());
      var data = json.decode(response.body);
     

      if (response.statusCode == 200) {
   
  
      hideLoader(loader);          
     SignUpModel res = SignUpModel.fromJson(json.decode(response.body));
      if(res.status == true){

      Get.toNamed(Routes.VERIFICATION);
       if(res.data != null){
    userDetail = res.data!;
    ToastUi(res.data!.otpText.toString(),);
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
    if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    // log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
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
}

  //  SignUp Verify
   Future<void> SignUpVerifyApi(BuildContext context, String otp) async {
    OverlayEntry loader = overlayLoader(context);
    try {      
      Overlay.of(context).insert(loader);      
      // var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['token']= userDetail.token;
      map['otp'] = otp;
      map['device_token'] = fcmToken;
      // map['phone_number'] = "+1${mobileNo.removeAllWhitespace}";
      log(ApiUrls.signupVerify);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.signupVerify),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      // log(json.decode(response.body)); 
      log(response.body.toString());
      log("SignUp Verify Api Response=>> " +
        json.decode(response.body).toString());    
         SignUpVerifyModel result = SignUpVerifyModel.fromJson(json.decode(response.body));  
      if (response.statusCode == 200) {
        if(result.status == true){
         userVerftyDetail = result.data!;
      pref.setAccessToken(userVerftyDetail.accessToken);
      hideLoader(loader);   
       Get.toNamed(Routes.PROMOCODE);
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
   if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    // log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
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
  
   }
   
   
   
   //  Promo code Par
  Future<void> PromoCodeAPi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
  try {
       String? token = await pref.getAccessToken();  
       if(token == null || token == ""){
       token = oneTimeToken;
      }    
      Overlay.of(context).insert(loader);
      var map = <String, dynamic>{};
      map['promocode']= promoCodeCtrl.text.trim();
      log(ApiUrls.updatePromocode);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.updatePromocode),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      var data = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
         PromocodeModel res = PromocodeModel.fromJson(data);
          hideLoader(loader);  
      log("Promo code Api Response=>> " +
        response.body);
      hideLoader(loader);       
      if(res.status ==  true){
        promoCodeDetail = res.data!;
        update();
        Get.toNamed(Routes.ADDVEHICLE);
      }
      else{
        // hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );        
    }
      //
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  } 
  catch (e) {
    if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    // log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
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
  } 
    




  // Get Profile Api
  final isLoading = false.obs;
  ProfileModelData? profileData;
  
  Future<void> ProfileApi(BuildContext context) async{
      // try {
     isLoading.value = true;
      // update();
       String? token = await pref.getAccessToken();  
       if(token == null || token == ""){
       token = oneTimeToken;
      }    
      log(ApiUrls.profile);
      http.Response response = await http.get(
      Uri.parse(ApiUrls.profile),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("profile Response=>> " + (response.body).toString());
        ProfileModel res = ProfileModel.fromJson(json.decode(response.body));
        profileData = res.data;

        if(res.data != null){
          // var number = res.data!.phoneNumber!.split("+1");
          // String no = getFormattedPhoneNumber(number[1]);
          firstnameCrt.text = res.data!.firstName.toString();
          lastnameCrt.text = res.data!.lastName.toString();
          phoneNoCrt.text =  getFormattedPhoneNumber(res.data!.phoneNumber!);
          emailCrt.text = res.data!.email ?? "";
        }
        isLoading.value = false;         
         update();
      } 
      else{
          isLoading.value = false;
          update();  
          // return false;    
      }
  // } catch (e) {
  //    isLoading.value = false;
  //        update();
  //    log(e.toString());
    
  //   // hideLoader(loader);
  //    ToastUi(e.toString(), 
  //    bgColor: ColorCode.red,
  //    textColor: ColorCode.white,
  //    );  
  //   //  return false;
  //   }
  }




String getFormattedPhoneNumber(
  String _phoneNumber) {
  if (_phoneNumber.isEmpty) {
    return "";
  }

  String phoneNumber = _phoneNumber;
  // bool addPlus = phoneNumber.startsWith("1");
  // if (addPlus) phoneNumber = phoneNumber.substring(1);
  // bool addParents = phoneNumber.length >= 3;
  // bool addDash = phoneNumber.length >= 8;

  // +1
  String updatedNumber = "";
  for(int i =0 ; i< _phoneNumber.length; i++){
    updatedNumber += _phoneNumber[i];
    if(i == 2){
      updatedNumber += "-";

    }
     if(i == 5){
      updatedNumber += "-";
    }

  }
  return updatedNumber;
 
}

// Sign Out Api 
 Future<void> SignOutApi(BuildContext context) async {
  
    OverlayEntry loader = overlayLoader(context);
  try {
    //  pref.logOut();
       String? token = await pref.getAccessToken();  
       if(token == null || token == ""){
       token = oneTimeToken;
      }    
      Overlay.of(context).insert(loader);
      log(ApiUrls.signout);
      log("Bearer $token");
      http.Response response = await http.post(
      Uri.parse(ApiUrls.signout),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      var data = json.decode(response.body);      
      log(response.body);
      if (response.statusCode == 200) {
      pref.logOut();
      Get.offAllNamed(Routes.WELCOME);
      } 
  else{
    pref.logOut();
     Get.offAllNamed(Routes.WELCOME);
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  } 
  catch (e) {
    if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    // log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
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
   }

  
// Delete Account Api 
Future<void> deleteAccount(BuildContext context) async {
   OverlayEntry loader = overlayLoader(context);
  try {
    //  pref.logOut();
       String? token = await pref.getAccessToken();   
       if(token == null || token == ""){
       token = oneTimeToken;
      }   
      Overlay.of(context).insert(loader);
      log(ApiUrls.deleteAccount);
      http.Response response = await http.post(
      Uri.parse(ApiUrls.deleteAccount),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      var data = json.decode(response.body);      
      log(response.body);
      if (response.statusCode == 200) {
      pref.logOut();
      Get.offAllNamed(Routes.WELCOME);
      } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  } 
  catch (e) {
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
    }

}

// Save Profile
Future<void> SaveProfile(BuildContext context) async {

    OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
       String? token = await pref.getAccessToken();   
       if(token == null || token == ""){
       token = oneTimeToken;
      }   
      var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['first_name']= firstnameCrt.text.tr;
      map['last_name'] = lastnameCrt.text.tr;
      map['email'] = emailCrt.text.tr;
      map['phone_number'] = "${mobileNo.removeAllWhitespace}";
      log(ApiUrls.signup);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.profile),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
         HttpHeaders.authorizationHeader: 'Bearer $token',

      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
        log("Profile Api Response=>> " +
        json.decode(response.body).toString());
      var data = json.decode(response.body);
     

      if (response.statusCode == 200) {
      hideLoader(loader);    
       hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: Colors.green,
     textColor: ColorCode.white,
     ); 
      Navigator.pop(context);

    //  SignUpModel res = SignUpModel.fromJson(json.decode(response.body));
    //   if(res.status == true){

    //   Get.toNamed(Routes.VERIFICATION);
    //    if(res.data != null){
    // userDetail = res.data!;
    // ToastUi(res.data!.otpText.toString(),);
    // }
    // }
    // else{
    //   hideLoader(loader);
    //  ToastUi(data['message'].toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );
    // }
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  } catch (e) {
    if (e is SocketException) {
        if ((e as SocketException).osError!.errorCode == 8)
          hideLoader(loader);
     ToastUi("No Internet Please Try After Sometime", 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      }
      else{
    // log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
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
}


  }

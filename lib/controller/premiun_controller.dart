import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/model/add_location_model.dart';
import 'package:fuel2u_user/model/plan_list_model.dart';
import 'package:fuel2u_user/model/sign_up_model/promocode_model.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../resources/session_manager.dart';
import '../routes/app_pages.dart';
import 'login_controller.dart';

class PremiunController extends GetxController {
  final selectPlan = 0.obs;
  final showPlanIndex = 0.obs;
  final promoCodeCtrl = TextEditingController();
  final promoCodeFormKey = GlobalKey<FormState>();
  final isLoading = true.obs;
  SessionManager pref = SessionManager();
  List<PlanListModelData>? plansList;
  @override
  void onInit() {
    super.onInit();
    GetPlanListAPi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePlan(int index) {
    selectPlan.value = index;
    update(); 
  } 
  void viewPlan(int index){
    showPlanIndex.value = index;
    update();

  }
  Future<void> GetPlanListAPi() async {
  try {
       String? token = await pref.getAccessToken();    
       if(token == null || token == ""){
       token = oneTimeToken;
      }  
      var map = <String, dynamic>{};
      map['promocode']= promoCodeCtrl.text.trim();
      log(ApiUrls.plans);
      log(map.toString());
      http.Response response = await http.get(
      Uri.parse(ApiUrls.plans),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("Promo code Api Response=>> " +
        (response.body).toString());

         PlanListModel res = PlanListModel.fromJson(json.decode(response.body));
         plansList = res.data!;
         isLoading.value = false;
         update();
        // plansList = PlanListModelData.fromJson(data.data);
      // hideLoader(loader);            
      } 
      else{
          isLoading.value = false;
         update();
        // hideLoader(loader);

      }
  } catch (e) {
     isLoading.value = false;
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
    log(e.toString());
    // hideLoader(loader);
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    } 
    //  log(e.toString());
    
    // // hideLoader(loader);
    //  ToastUi(e.toString(), 
    //  bgColor: ColorCode.red,
    //  textColor: ColorCode.white,
    //  );  
    }
   }




   //  Get Plan
  Future<void> GetPlan(BuildContext context) async {
  
    OverlayEntry loader = overlayLoader(context);
  // try {
       String? token = await pref.getAccessToken();  
       if(token == null || token == ""){
       token = oneTimeToken;
      }    
      Overlay.of(context).insert(loader);
      var map = <String, dynamic>{};
      map['plan_id']= plansList![selectPlan.value].id;
      log(ApiUrls.plans);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.plans),
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
      // log("Promo code Api Response=>> " +
      //   (response.body).toString());
      hideLoader(loader);       
      if(data['status'] ==  true){
        if(plansList![selectPlan.value].name == "Business")
        {
            Get.toNamed(Routes.BUSINESSFORM);
        }
        else{
          if(plansList![selectPlan.value].monthlyFee != 0){
          Get.toNamed(Routes.MAKEPAYMENT);
          }
          else{
           Get.toNamed(Routes.ADDVEHICLE);
          }
        }
     

      }
    
      //
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  // } catch (e) {
  //    log(e.toString());
  //   hideLoader(loader);
  //   hideLoader(loader);
  //    ToastUi(e.toString(), 
  //    bgColor: ColorCode.red,
  //    textColor: ColorCode.white,
  //    );  
  //   }
   }

 //  Update PromoCode Api 
  PromocodeModelData promoCodeDetail =  PromocodeModelData();
  Future<bool> UploadPromoCodeAPi(BuildContext context) async {
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
         ToastUi(data['message'].toString(), 
     bgColor: Colors.green,
     textColor: ColorCode.white,
     );  
        return true;
       
      }
      else{

     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
      return false;      
    }
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );
     return false;      
     }  
        
  } 
  catch (e) {
    //  log(e.toString());
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
     return false;       
    }
   }

  //  Update Plan
  Future<void> UpdatePlan(BuildContext context) async {
  OverlayEntry loader = overlayLoader(context);
  try {
       String? token = await pref.getAccessToken();   
       if(token == null || token == ""){
       token = oneTimeToken;
      }   
      Overlay.of(context).insert(loader);
      var map = <String, dynamic>{};
      map['plan_id']= plansList![showPlanIndex.value].id;
      log(ApiUrls.plans);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.plans),
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
      // log("Promo code Api Response=>> " +
      //   (response.body).toString());
      hideLoader(loader);       
      if(data['status'] ==  true){
        
     ToastUi(data['message'].toString(), 
     bgColor: Colors.green,
     textColor: ColorCode.white,
     );
       Navigator.pop(context);
      }
    
      //
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );}     
  } catch (e) {
    //  log(e.toString());
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



   // Make Payment Variable and Api
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cardNameCtrl = TextEditingController();
  final cardNumberCtrl = TextEditingController();
  final expDataCtrl = TextEditingController();
  final cvvCtrl = TextEditingController();
  final zipCodeCtrl  = TextEditingController();

  final addcardvaildvalue =false.obs;
void addCardVaild(){

  if(cardNumberCtrl.text.length == 19 && expDataCtrl.text.length == 5 && cvvCtrl.text.length == 3 && zipCodeCtrl.text.length == 5){
  addcardvaildvalue.value = true;
  update();
  }
  else{
    addcardvaildvalue.value = false;
    update();
  }
}
// Api Calling For Make Payment
Future<bool> SendCardDetailsApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    // try {
      
      Overlay.of(context).insert(loader);
        String? token = await pref.getAccessToken(); 
        if(token == null || token == ""){
       token = oneTimeToken;
      }
      // var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      var date = expDataCtrl.text.split("/");
      map['card_name'] = cardNameCtrl.text;
      map['card_number'] = cardNumberCtrl.text.replaceAll("-", " ").removeAllWhitespace;
      map['exp_month'] = date[0];
      map['exp_year'] = date[1];
      map['cvc'] = cvvCtrl.text.trim();
      map['zip'] = zipCodeCtrl.text.trim();
      log(ApiUrls.makePayment);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.makePayment),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      log("paymentMethods Api Response=>> " +
      json.decode(response.body).toString());
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
      hideLoader(loader);          
     AddLocationModel res = AddLocationModel.fromJson(json.decode(response.body));
    if(res.status == true){   
      return true;
    }
    else{      
     hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );
     return false;
    }
  } 
  else{
    hideLoader(loader);
     ToastUi(data['message'].toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );
     return false;
     }     
  // } catch (e) {
  //   hideLoader(loader);
  //   hideLoader(loader);
  //    ToastUi(e.toString(), 
  //    bgColor: ColorCode.red,
  //    textColor: ColorCode.white,
  //    );  
  //    return false;
  //   }

  }
}



import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/model/plan_list_model.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../resources/session_manager.dart';
import '../routes/app_pages.dart';

class PremiunController extends GetxController {
  final selectPlan = 0.obs;
  final showPlanIndex = 0.obs;
  final promoCodeCtrl = TextEditingController();
  final promoCodeFormKey = GlobalKey<FormState>();
  final isLoading = true.obs;

  SessionManager pref = SessionManager();
  List<PlanListModelData>? plansList;

  List<Map<String, dynamic>> planList = [
    {
      "name": "Pay as you go",
      "price": "25",
      "duration": "Delivery Fee",
      "featureList": [
        "No Monthly Fee",
        "Selected Location based on Availability Only",
      ]
    },
    {
      "name": "Individual & Family",
      "price": "25",
      "duration": "per month",
      "featureList": [
        "No Delivery Fee",
        "Weekly Gas Delivery",
        "You Choose the Location"
      ]
    },
    {
      "name": "Business",
      "price": "50",
      "duration": "per month",
      "featureList": [
        "No Delivery Fee",
        "Weekly Gas Delivery",
        "Delivered Directly to Your Company Location",
        "Unlimited Employees",
        "Flexible Schedule"
      ]
    }
  ];

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
     log(e.toString());
    
    // hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }
   }




   //  Get Plan
  Future<void> GetPlan(BuildContext context) async {
  
    OverlayEntry loader = overlayLoader(context);
  try {
       String? token = await pref.getAccessToken();      
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
           Get.toNamed(Routes.ADDVEHICLE);
        }
         // calling profile Api
        //  1
        // PromocodeModel  res = PromocodeModel.fromJson(data);

        // promoCodeDetail = res.data!;
        // update();
        // Get.toNamed(Routes.SELECTPLAN);

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



import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/model/business_model.dart';
import 'package:fuel2u_user/model/state_list_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../resources/session_manager.dart';
import 'login_controller.dart';

class BusinessController extends GetxController {
  final bussinessFormKey = GlobalKey<FormState>();
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
  // final billingStateCtrl = TextEditingController();
  final billingZipCodeCtrl = TextEditingController();
  final dropdownvalue = 'State'.obs;
  final deliveryAddSame = false.obs;
  final formvalid = false.obs;

  // List of items in our dropdown menu
  // final tierList=['YN', 'SF', 'WDC'].obs;
  // Rx<String>? selectedother;
  // String? selected;
  // String? selectedIndex;
  // String? billingStateId;
  // Rx<String>? selected;
  // StateListModelData?  selected;
  // final bill=['first', 'second', 'third'].obs;
  Rx<String>? billingState;

  StateListModelData? billStateValue;
  StateListModelData? stateValue;
  // StateListModelData? billStateValue;
  final zipCodeVaild = false.obs;

  // Add Vehicle Screen

  //  Pref
  final isLoading = true.obs;
  SessionManager pref = SessionManager();
  List<StateListModelData>? stateList;
  BusinessModelData businessData = BusinessModelData();

  double stateAndZipCodeHeight = 55;
  double stateAndZipCodeHeight2 = 50;

  void checkSameBillingAddress(bool val) {
    deliveryAddSame.value = val;
    
    update();
  }


void formClean(){
deliveryAddressCtrl.clear();
cityCtrl.clear();
zipCodeCtrl.clear();
deliveryInstructionsCtrl.clear();
promoCodeCtrl.clear();
billingAddressCtrl.clear();
billingCityCtrl.clear();
billingZipCodeCtrl.clear();
deliveryAddSame.value = false;
billStateValue = null;
stateValue = null;
update();
  }

  void checkFormValied() {
    // log({
    //   employerNameCtrl.text,
    //   employerNameCtrl.text,
    //   deliveryAddressCtrl.text,
    //   cityCtrl.text,
    //   zipCodeCtrl.text,
    //   promoCodeCtrl.text,
    //   contactNameCtrl.text,
    //   contactEmailCtrl.text,
    //   contactNumberCtrl.text,
    //   stateValue!.name.toString()
    //   // selectedIndex
    // }.toString());

    if (employerNameCtrl.text.isEmpty ||
        deliveryAddressCtrl.text.isEmpty ||
        cityCtrl.text.isEmpty ||
        zipCodeCtrl.text.length < 5 ||
        promoCodeCtrl.text.isEmpty ||
        contactNameCtrl.text.isEmpty ||
        contactEmailCtrl.text.isEmpty ||
        contactNumberCtrl.text.length < 12 ||
        stateValue == null) {
      formvalid.value = false;
      update();
    } else {
      
      formvalid.value = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    GetStateList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

// State List Api
  Future<void> GetStateList() async {
    try {
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      log(ApiUrls.states);

      http.Response response =
          await http.get(Uri.parse(ApiUrls.states), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        log("states Api Response=>> " + (response.body).toString());
        StateListModel res =
            StateListModel.fromJson(json.decode(response.body));
        stateList = res.data!;
        isLoading.value = false;
        update();
      } else {
        isLoading.value = false;
        update();
        // hideLoader(loader);
      }
    } catch (e) {
      isLoading.value = false;
      update();
      log(e.toString());

      // hideLoader(loader);
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
    }
  }

// Business Form Api
  Future<void> BusinessFormApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      var mobileNo = contactNumberCtrl.text.trim().replaceAll("-", " ");
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      var map = <String, dynamic>{};
      map['employer_name'] = employerNameCtrl.text.tr;
      map['delivery_address'] = deliveryAddressCtrl.text.tr;
      map['delivery_city'] = cityCtrl.text.tr;
      map['delivery_state_id'] = stateValue!.id;
      map['delivery_zipcode'] = zipCodeCtrl.text.tr;
      map['delivery_instructions'] = deliveryInstructionsCtrl.text.tr;
      map['promocode'] = promoCodeCtrl.text.tr;
      // map['delivery_day']= .text.tr;
      map['contact_name'] = contactNameCtrl.text.tr;
      map['contact_email'] = contactEmailCtrl.text.tr;
      map['contact_phone_number'] = "${mobileNo.removeAllWhitespace}";
      map['same_as_delivery'] = deliveryAddSame.value ? 1 : 0;
      map['billing_city'] = billingCityCtrl.text.tr;
      map['billing_address'] = billingAddressCtrl.text.tr;
      map['billing_state_id'] = billStateValue!.id;
      map['billing_zipcode'] = billingZipCodeCtrl.text.tr;
      log(ApiUrls.business);
      log(map.toString());
      http.Response response = await http
          .post(Uri.parse(ApiUrls.business), body: jsonEncode(map), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      log("Business Response=>> " + json.decode(response.body).toString());
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        hideLoader(loader);
        BusinessModel res = BusinessModel.fromJson(json.decode(response.body));
        if (res.status == true) {
          businessData = res.data!;
          Get.toNamed(Routes.MAKEPAYMENT);
        } else {
          hideLoader(loader);
          ToastUi(
            data['message'].toString(), 
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
        }
      } else {
        hideLoader(loader);
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      hideLoader(loader);
      hideLoader(loader);
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
    }
  }

// Business Details fatch Api
BusinessModelData? editBusinessData;
  Future<void> BusinessInfoApi(BusinessController controller) async {
    // try {
      isLoading.value = true;
      // update();
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      log(ApiUrls.business);
      http.Response response =
          await http.get(Uri.parse(ApiUrls.business), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        log("Business Api Response=>> \n" + (response.body).toString());
        BusinessModel res = BusinessModel.fromJson(json.decode(response.body));
        editBusinessData = res.data;
        update();
        if (res.data != null) {
          http.Response response =
              await http.get(Uri.parse(ApiUrls.states), headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }).timeout(Duration(seconds: 30));
          log(response.body);
          if (response.statusCode == 200) {
            // log("State Api Response=>> " + (response.body).toString());
            StateListModel res1 =
                StateListModel.fromJson(json.decode(response.body));
            stateList = res1.data!;
            for (var ele in res1.data!) {
              if (ele.id.toString() == res.data!.deliveryStateId!.toString()) {
                stateValue = ele;
              
              }
              if(res.data!.billingStateId != null){
                if(ele.id.toString() == res.data!.billingStateId.toString()){
                  billStateValue = ele;
                }
              }
            }
          
            employerNameCtrl.text = res.data!.employerName!;
            deliveryAddressCtrl.text = res.data!.deliveryAddress!;
            cityCtrl.text = res.data!.deliveryCity!;
            zipCodeCtrl.text = res.data!.deliveryZipcode!;
            deliveryInstructionsCtrl.text = res.data!.deliveryInstructions ?? "";
         
            promoCodeCtrl.text = res.data!.promocode!;
            contactNameCtrl.text =  res.data!.contactName!;
            contactEmailCtrl.text = res.data!.contactEmail!;
            contactNumberCtrl.text = getFormattedPhoneNumber(res.data!.contactPhoneNumber!);
            update();
            billingAddressCtrl.text = res.data!.billingAddress ?? "";
            billingCityCtrl.text = res.data!.billingCity!;
// billingStateCtrl
            billingZipCodeCtrl.text = res.data!.billingZipcode!;
            // log("${promoCodeCtrl.text} = ${editBusinessData!.promocode!}");

            // log("${contactNameCtrl.text} = ${editBusinessData!.contactName!}");

            if (res.data!.sameAsDelivery == "1") {
              // log()
              deliveryAddSame.value = true;
              update();
            }
            isLoading.value = false;
            update();
          } else {
            
            isLoading.value = false;
            update();

            // hideLoader(loader);
          }
        }
      } else {
        GetStateList().then((value) {
  isLoading.value = false;
        update();
        });
      
        // return false;
      }
    }
    //  catch (e) {
    //   isLoading.value = false;
    //   update();
    //   log(e.toString());

    //   // // hideLoader(loader);
    //   // ToastUi(
    //   //   e.toString(),
    //   //   bgColor: ColorCode.red,
    //   //   textColor: ColorCode.white,
    //   // );
    //   //  return false;
    // }
  // }

  // Update Business Api
  Future<void> UpdateBusinessFormApi(BuildContext context, String id) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      var mobileNo = contactNumberCtrl.text.trim().replaceAll("-", " ");
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      var map = <String, dynamic>{};
      map['id'] = id;
      map['employer_name'] = employerNameCtrl.text.tr;
      map['delivery_address'] = deliveryAddressCtrl.text.tr;
      map['delivery_city'] = cityCtrl.text.tr;
      map['delivery_state_id'] = stateValue!.id;
      map['delivery_zipcode'] = zipCodeCtrl.text.tr;
      map['delivery_instructions'] = deliveryInstructionsCtrl.text.tr;
      map['promocode'] = promoCodeCtrl.text.tr;    
      map['contact_name'] = contactNameCtrl.text.tr;
      map['contact_email'] = contactEmailCtrl.text.tr;
      map['contact_phone_number'] = "${mobileNo.removeAllWhitespace}";
      map['same_as_delivery'] = deliveryAddSame.value ? 1 : 0;
      map['billing_address'] = billingAddressCtrl.text.tr;
      map['billing_city'] = billingCityCtrl.text.tr;
      map['billing_state_id'] = billStateValue!.id;
      map['billing_zipcode'] = billingZipCodeCtrl.text.tr;
      log(ApiUrls.updateBusiness);
      log(map.toString());
      http.Response response = await http
          .post(Uri.parse(ApiUrls.updateBusiness), body: jsonEncode(map), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      log("Update Business Response=>> " + json.decode(response.body).toString());
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        hideLoader(loader);
        BusinessModel res = BusinessModel.fromJson(json.decode(response.body));
        if (res.status == true) {
          businessData = res.data!;
          ToastUi(
            data['message'].toString(), 
            bgColor: Colors.green,
            textColor: ColorCode.white,
          );
         Navigator.of(context).pop();
        } else {
          hideLoader(loader);
          ToastUi(
            data['message'].toString(), 
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
        }
      } else {
        hideLoader(loader);
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      hideLoader(loader);
      hideLoader(loader);
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
    }
  }


  // Other Add Business Form
   Future<void> SaveBusinessFormApi(BuildContext context) async {
    OverlayEntry loader = overlayLoader(context);
    try {
      Overlay.of(context).insert(loader);
      var mobileNo = contactNumberCtrl.text.trim().replaceAll("-", " ");
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      var map = <String, dynamic>{};
      map['employer_name'] = employerNameCtrl.text.tr;
      map['delivery_address'] = deliveryAddressCtrl.text.tr;
      map['delivery_city'] = cityCtrl.text.tr;
      map['delivery_state_id'] = stateValue!.id;
      map['delivery_zipcode'] = zipCodeCtrl.text.tr;
      map['delivery_instructions'] = deliveryInstructionsCtrl.text.tr;
      map['promocode'] = promoCodeCtrl.text.tr;
      // map['delivery_day']= .text.tr;
      map['contact_name'] = contactNameCtrl.text.tr;
      map['contact_email'] = contactEmailCtrl.text.tr;
      map['contact_phone_number'] = "${mobileNo.removeAllWhitespace}";
      map['same_as_delivery'] = deliveryAddSame.value ? 1 : 0;
      map['billing_address'] = billingAddressCtrl.text.tr;
      map['billing_city'] = billingCityCtrl.text.tr;
      map['billing_state_id'] = billStateValue!.id;
      map['billing_zipcode'] = billingZipCodeCtrl.text.tr;
      log(ApiUrls.business);
      log(map.toString());
      http.Response response = await http
          .post(Uri.parse(ApiUrls.business), body: jsonEncode(map), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      log("Business Response=>> " + json.decode(response.body).toString());
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        hideLoader(loader);
        BusinessModel res = BusinessModel.fromJson(json.decode(response.body));
        if (res.status == true) {
          businessData = res.data!;
           ToastUi(
            data['message'].toString(), 
            bgColor: Colors.green,
            textColor: ColorCode.white,
          );
         Navigator.of(context).pop();
        } else {
          hideLoader(loader);
          ToastUi(
            data['message'].toString(), 
            bgColor: ColorCode.red,
            textColor: ColorCode.white,
          );
        }
      } else {
        hideLoader(loader);
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
    } catch (e) {
      hideLoader(loader);
      hideLoader(loader);
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
    }
  }
}

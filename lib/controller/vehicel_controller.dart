import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/model/add_location_model.dart';
import 'package:fuel2u_user/model/location_list_model.dart';
import 'package:fuel2u_user/model/order/card_detail_model.dart';
import 'package:fuel2u_user/model/state_list_model.dart';
import 'package:fuel2u_user/model/vehicle/vehicle_list_model.dart';
import 'package:fuel2u_user/resources/session_manager.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'login_controller.dart';


class VehicleController extends GetxController {
  final emptyVehicleList = true.obs;
  final locationList = true.obs;
  //  List addressType = ["Home", "Work"];

   List cardList = ["Card Name","Credit/Debit Card"];
     final paymentdataloading = true.obs;

    final homename = TextEditingController();
    final streetAddressCtrl = TextEditingController();
    final cityCtrl = TextEditingController();
    final zipCodeCtrl = TextEditingController();
    final addressFormValid = false.obs;

    // Card Variable
  final cardNumber = ''.obs;
  final expiryDate = ''.obs;
  final cardHolderName = ''.obs;
  final cardNameCtrl = TextEditingController();
  final cardNumberCtrl = TextEditingController();
  final expDataCtrl = TextEditingController();
  final cvvCtrl = TextEditingController();
  final cardzipCodeCtrl = TextEditingController();
  final cvvCode = ''.obs;
  final zipCode = ''.obs;
  final isCvvFocused = false.obs;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetVehicleList();
    // Future.delayed(Duration(seconds: 3), (
    //   emptyVehicleList.value = !emptyVehicleList.value;
    //   locationList.value = false;
    //    paymentdataloading.value = false;
    //   update();
    // });
     border = const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: ColorCode.orange,
      ),
    ); 
    GetStateList();
  }

  addressFormCheck(){
    log({
      cityCtrl.text.toString(),
      streetAddressCtrl.text.toString(),
      stateCodeValue.toString(), 
      zipCodeCtrl.text.toString()
    }.toString());
    if(cityCtrl.text.isNotEmpty && streetAddressCtrl.text.isNotEmpty && stateCodeValue != null && zipCodeCtrl.text.isNotEmpty){
      addressFormValid.value = true;
      update();
    }
    else{
      addressFormValid.value = false;
      update();
    }
  }

//  void setEditData(LocationListModelData locationDetails) {
 
//  }

//   void setCardDetails() {
//     cardNumber.value = "4222222222222222";
// expiryDate.value = "12/24";
// cardHolderName.value = "Card Name";
//   cvvCode.value = "123";


//   }
   void cleanAllData() {
    homename.clear();
cityCtrl.clear();
streetAddressCtrl.clear();
zipCodeCtrl.clear();
// addressFormValid.clear();
// update();

  }

// Api Calling Block
SessionManager pref = SessionManager();
final vehicleListLoading = true.obs;
List<VehicleListModelData>? vehicleList;
var selectVehicleId;
Future<void> GetVehicleList() async{
  //  try {
      String? token = await pref.getAccessToken(); 
      if(token == null || token == ""){
       token = oneTimeToken;
      }     
      log(ApiUrls.vehicles);     
      http.Response response = await http.get(
      Uri.parse(ApiUrls.vehicles),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
        vehicleListLoading.value = false;
        update();
      log("vehicles Response=>> " +
        (response.body).toString());
          vehicleListLoading.value = false;
         VehicleListModel res = VehicleListModel.fromJson(json.decode(response.body));
         vehicleList = res.data;
         update();
              
      } 
      else{
        vehicleListLoading.value = false;
        update();       
      }
  // } catch (e) {
  //    vehicleListLoading.value = false;
  //       update();
  //    log(e.toString());
    
  //   // hideLoader(loader);
  //    ToastUi(e.toString(), 
  //    bgColor: ColorCode.red,
  //    textColor: ColorCode.white,
  //    );  
  //   }
   }


// Add Location 
Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
     permission = await Geolocator.requestPermission();
      return false;
    }
    return true;
  }
  String? _currentAddress;
  Position? currentPosition;
  final  usecurrentLoading = false.obs;
   Future<void> getCurrentPosition(bool userLive) async {
    
    // update();
    log("Get Location Permission");
    final hasPermission = await _handleLocationPermission();
    // log(hasPermission.toString());
    if (!hasPermission) {
        // permission = await Geolocator.requestPermission();
       await _handleLocationPermission();
    }
    else{

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
           currentPosition = position;
           update();
           log(position.toString());
            if(userLive){
            getAddressFromLatLng(position);
        }
        
      // _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
    }
  }
   Future<void> getAddressFromLatLng(Position position) async {
    usecurrentLoading.value =  true;
    update();
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
          // log(placemarks.toString());
      Placemark place = placemarks[0];
      _currentAddress = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}, ${place.administrativeArea}';
      streetAddressCtrl.text = place.street.toString();
      cityCtrl.text = place.locality.toString();
      zipCodeCtrl.text = place.postalCode.toString();
      usecurrentLoading.value = false;
      update();
      log(_currentAddress.toString());

    }).catchError((e) {
      debugPrint(e);
    });
  }

final isLoading = false.obs;
List<StateListModelData>? stateList;
StateListModelData? stateCodeValue;
Future<bool> GetStateList() async {
  try {
     isLoading.value = true;
      // update();
       String? token = await pref.getAccessToken(); 
       if(token == null || token == ""){
       token = oneTimeToken;
      }
    
      log(ApiUrls.states);
      http.Response response = await http.get(
      Uri.parse(ApiUrls.states),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      stateList =  null;
      stateCodeValue = null;
      log("states Api Response=>> \n" + (response.body).toString());
         StateListModel res = StateListModel.fromJson(json.decode(response.body));
        
         stateList = res.data!;
         isLoading.value = false;
         update();
         return true;
      } 
      else{
          isLoading.value = false;
          update();  
          return false;    
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
     return false;
    }
   }
// Add Location Api
  Future<bool> AddLocationApi(BuildContext context) async{
     OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
        String? token = await pref.getAccessToken(); 
        if(token == null || token == ""){
       token = oneTimeToken;
      }
      // var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['name']= homename.text.trim();
      map['address'] = streetAddressCtrl.text.trim();
      map['city'] = cityCtrl.text.trim();
      map['state_id'] = stateCodeValue!.id;
      map['zipcode'] =  zipCodeCtrl.text.trim();
      map['latitude'] = currentPosition!.latitude;
      map['longitude'] = currentPosition!.longitude;
      log(ApiUrls.locations);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.locations),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      log("locations Api Response=>> " +
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
  } catch (e) {
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
     return false;
    }
  }


  // Location List Api 
  List<LocationListModelData>? locationListData;
  final isLocationLoading = false.obs;

  Future<bool> GetLocationListApi() async {
  try {
     isLocationLoading.value = true;
      update();
       String? token = await pref.getAccessToken(); 
       if(token == null || token == ""){
       token = oneTimeToken;
      }     
      log(ApiUrls.locations);
      http.Response response = await http.get(
      Uri.parse(ApiUrls.locations),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("Location List Response =>>" + (response.body).toString());
         LocationListModel res = LocationListModel.fromJson(json.decode(response.body));
         locationListData = res.data!;
         
         isLocationLoading.value = false;
         update();
         return true;
      } 
      else{
          isLocationLoading.value = false;
          update();  
          return false;    
      }
  } catch (e) {
     isLocationLoading.value = false;
    //  update();
     log(e.toString());
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
     return false;
    }
   }

 
// edit State
Future<bool> EditStateList(LocationListModelData locationDetails) async {
  try {
     isLoading.value = true;
      // update();
       String? token = await pref.getAccessToken();  
       if(token == null || token == ""){
       token = oneTimeToken;
      }    
      log(ApiUrls.states);
      http.Response response = await http.get(
      Uri.parse(ApiUrls.states),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("states Api Response=>> " + (response.body).toString());
         StateListModel res = StateListModel.fromJson(json.decode(response.body));
         stateList = res.data!;
        
          for (var val in res.data!) {
  if(val.id == locationDetails.state!.id){
    stateCodeValue = val;
    update();
     isLoading.value = false;
  }  
}
   homename.text =  locationDetails.name.toString();
   cityCtrl.text = locationDetails.city.toString();
    streetAddressCtrl.text= locationDetails.address.toString();
zipCodeCtrl.text = locationDetails.zipcode.toString();

addressFormValid.value = true;
    update();
         update();
         return true;

      } 
      else{
          isLoading.value = false;
          update();  
          return false;    
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
     return false;
    }
   }
 

//  Edit Location Api 
 Future<bool> EditLocationApi(BuildContext context, int id) async{
     OverlayEntry loader = overlayLoader(context);
    try {
      
      Overlay.of(context).insert(loader);
        String? token = await pref.getAccessToken(); 
        if(token == null || token == ""){
       token = oneTimeToken;
      }
      // var mobileNo =  phoneNoCrt.text.trim().replaceAll("-"," ");
       var map = <String, dynamic>{};
      map['id'] = id;
      map['name']= homename.text.trim();
      map['address'] = streetAddressCtrl.text.trim();
      map['city'] = cityCtrl.text.trim();
      map['state_id'] = stateCodeValue!.id;
      map['zipcode'] =  zipCodeCtrl.text.trim();
      map['latitude'] = currentPosition!.latitude;
      map['longitude'] = currentPosition!.longitude;
      log(ApiUrls.locations);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.locations),
      body: jsonEncode(map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // ignore: unused_local_variable
      log("locations Api Response=>> " +
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
  } catch (e) {
    hideLoader(loader);
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
     return false;
    }
  }
// Delete Location Api 
Future<bool> DeleteLocationApi(BuildContext context, int id) async {
   OverlayEntry loader = overlayLoader(context);
  try{
  Overlay.of(context).insert(loader);
  String? token = await pref.getAccessToken(); 
  if(token == null || token == ""){
       token = oneTimeToken;
      }  
    http.Response response = await http.delete(
      Uri.parse("${ApiUrls.locations}/$id"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("Delete Vehicle Api Response=>> " +
        (response.body).toString());
         hideLoader(loader);        
           ToastUi("Vehicle deleted successfully.", );  
         update();     
         return true;
      } 
      else{         
         hideLoader(loader);
         return false;
        
      }
  } catch (e) {  
    hideLoader(loader);
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
     return false;
    }
   }
// var stoken ="sk_test_51NYiLjSGeTgiAIfwBMCJTK9pg8LeZ7OgppVpAifsEnRsArJ0xeatTbWzefXZkSVUf4PCOWR3aXSBnAGv8zzRJeHY00jHJUxChD";

// check Card Button Ui Color 
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
//  Add Card Api
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
      log(ApiUrls.paymentMethods);
      log(map.toString());
      http.Response response = await http.post(
      Uri.parse(ApiUrls.paymentMethods),
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
       GetCardList();
     
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

// Clear add Card Form text 
cleanAddCardData(){
  cardNameCtrl.clear();
  cardNumberCtrl.clear();
  expDataCtrl.clear();
  cvvCtrl.clear();
  zipCodeCtrl.clear();
  update();
}
// Set Data in Edit Card Filed

void setCardDataInEdit(){
  expDataCtrl.text = "${editCardData?.card!.expMonth}/${editCardData?.card!.expYear}";
  zipCodeCtrl.text = "${editCardData?.billingDetails!.address!.postalCode}";
  cardNameCtrl.text = "${editCardData?.metadata!.name}";
  update();
}


  // Get Card Details
  List<CardDetailModelData>? cardDetails;
  CardDetailModelData? editCardData;
  CardDetailModelData? selectedCardDetails;
  final cardLoading = true.obs;
  Future<void> GetCardList() async {
    try {
      cardLoading.value = true;
      update();
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      log(ApiUrls.paymentMethods);
      http.Response response =
          await http.get(Uri.parse(ApiUrls.paymentMethods), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      var data = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        log("payment-methods Api Response=>> " + (response.body).toString());
        CardDetailModel res = CardDetailModel.fromJson(data);
        if (data['status'] == true) {
          cardDetails = res.data!;
        }
        cardLoading.value = false;
        update();
      } else {
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
      cardLoading.value = false;
      update();
    } catch (e) {
      log(e.toString());
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
      cardLoading.value = false;
      update();
    }
  }

  // Delete Card Detail APi

  Future<void> DeleteCardDetailsApi(BuildContext context, String id) async {
    OverlayEntry loader = overlayLoader(context);
    try {
   
       Overlay.of(context).insert(loader);

      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      log(ApiUrls.paymentMethods);
      http.Response response =
          await http.delete(Uri.parse("${ApiUrls.paymentMethods}/$id"), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      var data = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        log("payment-methods Api Response=>> " + (response.body).toString());
        if (data['status'] == true) {
          GetCardList();
          hideLoader(loader);          
          Navigator.of(context).pop();
        }
        hideLoader(loader);
        // cardLoading.value = false;
        // update();
      } else {
        hideLoader(loader);
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
      // cardLoading.value = false;
      update();
    } catch (e) {
      hideLoader(loader);
      log(e.toString());
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
      // cardLoading.value = false;
      // update();
    }
  }


// update Card Name Api
  Future<void> updateCardName(BuildContext context) async {
     OverlayEntry loader = overlayLoader(context);
    try {
       Overlay.of(context).insert(loader);
      String? token = await pref.getAccessToken();
      if(token == null || token == ""){
       token = oneTimeToken;
      }
      var map = <String, dynamic>{};
      map['card_name'] = cardNameCtrl.text;
      log(ApiUrls.paymentMethods + "/${editCardData?.id}");
      http.Response response =
          await http.post(Uri.parse("${ApiUrls.paymentMethods}/${editCardData?.id}"), 
          body: map,
        headers: {
        // HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      var data = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        log("payment-methods Api Response=>> " + (response.body).toString());
        if (data['status'] == true) {
          GetCardList();
          hideLoader(loader);          
          Navigator.of(context).pop();
        }
        hideLoader(loader);
        // cardLoading.value = false;
        // update();
      } else {
        hideLoader(loader);
        ToastUi(
          data['message'].toString(),
          bgColor: ColorCode.red,
          textColor: ColorCode.white,
        );
      }
      // cardLoading.value = false;
      update();
    } catch (e) {
      hideLoader(loader);
      log(e.toString());
      ToastUi(
        e.toString(),
        bgColor: ColorCode.red,
        textColor: ColorCode.white,
      );
    }
  }

  void clearLocationData() {
    homename.clear();
    streetAddressCtrl.clear();
    cityCtrl.clear();
    stateCodeValue = null;
    zipCodeCtrl.clear();
    update();

    }
}

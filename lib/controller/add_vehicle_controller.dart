


import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/model/vehicle/add_vehicle_model.dart';
import 'package:fuel2u_user/model/vehicle/car_model.dart';
import 'package:fuel2u_user/model/vehicle/color_model.dart';
import 'package:fuel2u_user/model/vehicle/make_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../model/state_list_model.dart';
import '../model/vehicle/vehicle_list_model.dart';
import '../resources/session_manager.dart';
import '../utils/api_constant.dart';
import 'package:http/http.dart' as http;

class AddVehicleController extends GetxController {
  final nameCtrl = TextEditingController();
  final licensePlateNoCtrl = TextEditingController();
  final allFiledTrue = false.obs;
  final isLoading = true.obs;
      SessionManager pref = SessionManager();
      List<MakeModelData>? makeList;
      //  makeValue;
      MakeModelData? makeValue;

  List<StateListModelData>? stateCodeList;
 var stateCodeValue;
  AddVehicleModelData? addVehicleModelData;
   @override  
  void onInit() { 
    super.onInit();
   
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }


void CleanAllData(){
  licensePlateNoCtrl.clear();
stateCodeValue = null;
makeValue = null;
carModelValue = null;
colorsModelValue = null;
imagePath = "";
update();
}
 void checkAllFieldDone(){
    if(
      licensePlateNoCtrl.value.text.isEmpty || 
      stateCodeValue == null || 
      makeValue == null  || 
      carModelValue == null ||
      colorsModelValue == null ){
      allFiledTrue.value = false;
       update();
    }
    else{
       allFiledTrue.value = true;
        update();
    }
   
  }

late File image;
String imagePath = "";
final _picker = ImagePicker();

Future<void> getImage(bool camerabool) async {
final pickedFile = camerabool ? await _picker.pickImage(source: ImageSource.camera): await _picker.pickImage(source: ImageSource.gallery);

if (pickedFile != null) {
  image = File(pickedFile.path);
  imagePath = pickedFile.path;
  print(imagePath);
  update();
  Get.toNamed(Routes.VIEWCARIMAGE);
 } else {
  print('No image selected.');
 }
}


Future<void> AddVehicleImage(bool camerabool) async {
imagePath = "";
final pickedFile = camerabool ? await _picker.pickImage(source: ImageSource.camera): await _picker.pickImage(source: ImageSource.gallery);

if (pickedFile != null) {
  image = File(pickedFile.path);
  imagePath = pickedFile.path;
  print(imagePath);
  update();
  Get.back();
 } else {
  print('No image selected.');
 }}
  
  
  void updateData() {
  nameCtrl.text = "Mary’s Car";
  licensePlateNoCtrl.text = "KJH 234";
  // selectedState.value = "YN";
  // selectedBrand.value = "KIA";
  // selectedModel.value = "Sante Fe";
  // selectedColor.value = "Red";
   allFiledTrue.value = true;
  update();
  // checkAllFieldDone();

  }
final editLoading = false.obs;


  
   Future<void>  MakeApi() async{
   try {
       String? token = await pref.getAccessToken();      
      // var map = <String, dynamic>{};
      log(ApiUrls.make);
      // log(map.toString());
      http.Response response = await http.get(
      Uri.parse(ApiUrls.make),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("Make Api Response=>> " +
        (response.body).toString());
          isLoading.value = false;
         MakeModel res = MakeModel.fromJson(json.decode(response.body));
         makeList = res.data;
         update();     
      } 
      // else{
          isLoading.value = false;
          update();
      //   // hideLoader(loader);

      // }
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



// Model Api

  // Model  Variable
  List<CarModelData>? carmodelList ;
  CarModelData? carModelValue;
  final  loadingmodel = false.obs;


   Future<bool>  ModelApi() async{
   try {

     carModelValue = null;
    carmodelList = null;
    loadingmodel.value = true;
      
       update();
       String? token = await pref.getAccessToken();      
      // var map = <String, dynamic>{};
      log("${ApiUrls.models}${makeValue!.id}");
      // log(map.toString());
      http.Response response = await http.get(
      Uri.parse("${ApiUrls.models}${makeValue!.id}"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("models Api Response=>> " +
        (response.body).toString());
          // isLoading.value = false;
         CarModel res = CarModel.fromJson(json.decode(response.body));
         carmodelList = res.data;
          loadingmodel.value = false;
         update(); 
         return true;    
      } 
      else{
         return false;
      }
      // else{
          // isLoading.value = false;
        //  update();
      //   // hideLoader(loader);

      // }
  } catch (e) {
       loadingmodel.value = false;
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

  //  Color Api 

  List<ColorModelData>? colorsList;
  ColorModelData? colorsModelValue;
   Future<bool> ColorApi() async{
   try {    
      isLoading.value = true;
       update();
       String? token = await pref.getAccessToken();      
      // var map = <String, dynamic>{};
      log("${ApiUrls.colors}");
      // log(map.toString());
      http.Response response = await http.get(
      Uri.parse("${ApiUrls.colors}"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      log(response.body);
      if (response.statusCode == 200) {
      log("colors Api Response=>> " +
        (response.body).toString());
         
         ColorModel res = ColorModel.fromJson(json.decode(response.body));
         colorsList = res.data!;
         isLoading.value = false;
         update(); 
         return true;    
      } 
      else{
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
  // State List Api
Future<bool> GetStateList() async {
  try {
       String? token = await pref.getAccessToken();      
      // var map = <String, dynamic>{};
      
      log(ApiUrls.states);
      // log(map.toString());
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
         stateCodeList = res.data!;
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

  //  Add Vehicle Api

  Future<bool> AddVehicleApi(BuildContext context) async {
  try {
     OverlayEntry loader = overlayLoader(context);
     Overlay.of(context).insert(loader);
       String? token = await pref.getAccessToken();      
      var map = <String, String>{};
      map['name']= nameCtrl.text.trim();
      map['make_id'] = makeValue!.id.toString();
      map['model_id'] = carModelValue!.id.toString();
      map['color_id'] = colorsModelValue!.id.toString();
      map['license_plate']= licensePlateNoCtrl.text.trim();
      map['state_id'] = stateCodeValue!.id.toString();
     
      // log(imagePath);
      log("Bearer $token");
      log(ApiUrls.vehicles);
      log(map.toString());
      var uri = Uri.parse(ApiUrls.vehicles);
      var request = http.MultipartRequest('POST', uri);
      if(imagePath != "" || imagePath.isNotEmpty){
      var multipartFile = http.MultipartFile.fromBytes(
        "image",
        File(imagePath).readAsBytesSync(),
        filename: DateTime.now().toString());
         request.files.add(multipartFile);
         print(":::vehicles::images::=> "+multipartFile.toString());} 
      request.headers['Authorization'] = "Bearer $token";
      request.headers["Content-Type"] = "application/json";
    
      request.fields.addAll(map);
hideLoader(loader);
    print(":vehicles::::::=> "+request.fields.toString());
    
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    log(respStr.toString());
   
    if (response.statusCode == 200) {
       isLoading.value = false;
    hideLoader(loader);
     update();
     log("vehicles Api Response=>> "+json.decode(respStr).toString());
     var data = json.decode(respStr);
     AddVehicleModel res = AddVehicleModel.fromJson(data);
      addVehicleModelData = res.data;

     return true;
    } 
  else {
     isLoading.value = false;
    var data = json.decode(respStr);
     update();
   hideLoader(loader);
   ToastUi(data['message'].toString(), 
   bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    
    // throw Exception(respStr.toString());
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

  

// Update Vehicle Api a
Future<void> updateVehicleApi(VehicleListModelData vehicledata) async{
  try{
    editLoading.value = true;
    
    String? token = await pref.getAccessToken();   
    log("Edit vehicle Api Calling") ;  
    makeList = null;

    update();
      http.Response response = await http.get(
      Uri.parse(ApiUrls.make),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }).timeout(Duration(seconds: 30));
      // log(response.body);
      if (response.statusCode == 200) {       
         MakeModel res = MakeModel.fromJson(json.decode(response.body));
         makeList = res.data;
         update();
        //  bool? ischeck;
         for (var val in res.data!) {
        if(val.id == vehicledata.make!.id){
        makeValue = val;
       
        update();
         bool ischeck = await ModelApi();
         log(ischeck.toString());
         if(ischeck){    
          log(vehicledata.model!.name.toString());     
          log("__________________");
           for (var val2 in carmodelList!) {
            if(val2.id == vehicledata.model!.id){
            
            carModelValue = val2;
            log(carModelValue!.name.toString());
            licensePlateNoCtrl.text = vehicledata.licensePlate.toString();
            nameCtrl.text =  vehicledata.name.toString();
             editLoading.value = false;
             update();
             GetColorOrState(vehicledata);
             

            
           }}
          // c
          //
         }

        }
           
         }
        //  
        //  if(ischeck == true && colorcheck && stateCheck){
        //     editLoading.value = false;
        //   update();
        //  }
        

        
        // update();

         
      } 
      // else{
      //    editLoading.value = false;
      //     update();
      
      // }
  } catch (e) {
    editLoading.value = false;
         update();
     log(e.toString());
     ToastUi(e.toString(), 
     bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
    }

}

Future<void> GetColorOrState(VehicleListModelData vehicledata) async {
    editLoading.value = true;
    update();
    bool colorcheck =  await ColorApi();
         bool stateCheck = await GetStateList();
          if(colorcheck){
         for (var color in colorsList!) {
          if(color.id == vehicledata.color!.id ){
            colorsModelValue = color;
            update();
             if(stateCheck){
         
         for (var state in stateCodeList!) {
          if(state.id == vehicledata.state!.id ){
            stateCodeValue = state;
            editLoading.value = false;
            update();                      
         }}}
          }
           
         }
         }
        

   
  }



//  Edit Vehicle Api
Future<bool> EditVehicleApi(BuildContext context, String id) async {
  try {
     OverlayEntry loader = overlayLoader(context);
     Overlay.of(context).insert(loader);
       String? token = await pref.getAccessToken();      
      var map = <String, String>{};
      map['id']= id;
      map['name']= nameCtrl.text.trim();
      map['make_id'] = makeValue!.id.toString();
      map['model_id'] = carModelValue!.id.toString();
      map['color_id'] = colorsModelValue!.id.toString();
      map['license_plate']= licensePlateNoCtrl.text.trim();
      map['state_id'] = stateCodeValue!.id.toString();
     
      // log(imagePath);
      log("Bearer $token");
      log(ApiUrls.vehicles);
      log(map.toString());
      var uri = Uri.parse(ApiUrls.vehicles);
      var request = http.MultipartRequest('POST', uri);
      if(imagePath != "" || imagePath.isNotEmpty){
      var multipartFile = http.MultipartFile.fromBytes(
        "image",
        File(imagePath).readAsBytesSync(),
        filename: DateTime.now().toString());
         request.files.add(multipartFile);
         print(":::vehicles::images::=> "+multipartFile.toString());} 
      request.headers['Authorization'] = "Bearer $token";
      request.headers["Content-Type"] = "application/json";
    
      request.fields.addAll(map);
hideLoader(loader);
    print(":vehicles::::::=> "+request.fields.toString());
    
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    log(respStr.toString());
   
    if (response.statusCode == 200) {
       isLoading.value = false;
    hideLoader(loader);
     update();
     log("vehicles Api Response=>> "+json.decode(respStr).toString());
     var data = json.decode(respStr);
     AddVehicleModel res = AddVehicleModel.fromJson(data);
      addVehicleModelData = res.data;

     return true;
    } 
  else {
     isLoading.value = false;
    var data = json.decode(respStr);
     update();
   hideLoader(loader);
   ToastUi(data['message'].toString(), 
   bgColor: ColorCode.red,
     textColor: ColorCode.white,
     );  
  
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


// Delete Vehicle Api 

Future<bool> DeleteVehicleApi(BuildContext context, String id) async {
   OverlayEntry loader = overlayLoader(context);
  try{
  Overlay.of(context).insert(loader);
  String? token = await pref.getAccessToken();   
    http.Response response = await http.delete(
      Uri.parse("${ApiUrls.vehicles}/$id"),
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

  
}

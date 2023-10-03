


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicleController extends GetxController {
  final nameCtrl = TextEditingController();
  final licensePlateNoCtrl = TextEditingController();
  

    final stateList=['YN', 'SF', 'WDC'].obs;
    final selectedState = "".obs; 
    final makeList=['KIA', 'Hyundai', 'Honda'].obs;
    final  selectedBrand = "".obs; 
    //  final selectedBrand = Rxn<String>();
    final modelList=['Sante Fe', 'Sante Fe 2', 'Sante Fe 3'].obs;
    final selectedModel = "".obs; 
    final colorList=['White', 'Red', 'Black'].obs;
    final selectedColor = "".obs;
    final allFiledTrue = false.obs;
  
  // final cityCtrl = TextEditingController();

   @override
  void onInit() {
    super.onInit();
    // Future.delayed(Duration(seconds: 3),(){
     
    //   update();
    // });
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }

  updateBrand(String newValue){
    selectedBrand.value;
     update();
  } 

 void checkAllFieldDone(){
    if(licensePlateNoCtrl.value.text.isEmpty || selectedState == "" || selectedBrand == ""  || selectedColor == "" && selectedModel == "" ){
      allFiledTrue.value = false;
    }
    else{
       allFiledTrue.value = true;
    }
    update();
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
  selectedState.value = "YN";
  selectedBrand.value = "KIA";
  selectedModel.value = "Sante Fe";
  selectedColor.value = "Red";
   allFiledTrue.value = true;
  update();
  // checkAllFieldDone();

  }
}

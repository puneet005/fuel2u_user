import 'package:flutter/material.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';


class VehicleController extends GetxController {
  final emptyVehicleList = true.obs;
  final locationList = true.obs;
   List addressType = ["Home", "Work"];

   List cardList = ["Card Name","Credit/Debit Card"];
     final paymentdataloading = true.obs;

    final homename = TextEditingController();
    final streetAddressCtrl = TextEditingController();
    final cityCtrl = TextEditingController();
    final stateCtrl = TextEditingController();
    final zipCodeCtrl = TextEditingController();
    final addressFormValid = false.obs;

    // Card Variable
  final cardNumber = ''.obs;
  final expiryDate = ''.obs;
  final cardHolderName = ''.obs;
  final cvvCode = ''.obs;
  final zipCode = ''.obs;
  final isCvvFocused = false.obs;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    

  final List<Map> vehicleList = [
    {
      "image": "",
      "vehicleName": "Name of Vehicle",
      "plate": "License Plate",
      "make": "Make",
      "model": "Model",
      "color": "Color",
      "state": "License State",
      "seemore": false,
    },
     {
      "image": "",
      "vehicleName": "Name of Vehicle",
      "plate": "License Plate",
      "make": "Make",
      "model": "Model",
      "color": "Color",
      "state": "License State",
      "seemore": false,
    }
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      emptyVehicleList.value = !emptyVehicleList.value;
      locationList.value = false;
       paymentdataloading.value = false;
      update();
    });
     border = const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: ColorCode.orange,
      ),
    ); 
  }

  addressFormCheck(){
    if(cityCtrl.text.isNotEmpty && streetAddressCtrl.text.isNotEmpty && stateCtrl.text.isNotEmpty && zipCodeCtrl.text.isNotEmpty){
      addressFormValid.value = true;
      update();
    }
    else{
      addressFormValid.value = false;
      update();
    }
  }

  void editLoactionUpdate() {
    homename.text = "Home";
    cityCtrl.text = "711 Pearl Street";
    streetAddressCtrl.text= "Denver";
    stateCtrl.text = "CO";
    zipCodeCtrl.text = "802226";
    addressFormValid.value = true;
    update();
  }

  void setCardDetails() {
    cardNumber.value = "4222222222222222";
expiryDate.value = "12/24";
cardHolderName.value = "Card Name";
cvvCode.value = "123";


  }
}

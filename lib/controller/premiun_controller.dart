import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiunController extends GetxController {
  final selectPlan = 0.obs;
  final showPlanIndex = 0.obs;
  final promoCodeCtrl = TextEditingController();
  final promoCodeFormKey = GlobalKey<FormState>();
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
  
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';



class EditCardDetails extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    VehicleController controller = Get.find<VehicleController>();
    Future.delayed(Duration.zero, (){
       log("calling initstate function");
     controller.setCardDetails();
     controller.update();
    });
 return GetBuilder(
      init: VehicleController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
            body: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 10.h
              ),
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                          child: SizedBox(
                        height: Get.height,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: ImageLogoWithRigthIcon(
                                    back: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        // Get.back();
                                      },
                                      child: SvgPicture.asset(
                                        "assets/icons/backarrow.svg",
                                        width: 30,
                                      ),
                                    ),
                                    icon: InkWell(
                                      onTap: () =>
                                          Get.offNamed(Routes.ALLTRUCKINMAP),
                                      child: Image.asset(
                                        "assets/icons/mytruck.png",
                                        width: 50,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Edit Payment Method",
                                    style: Heading1(color: ColorCode.darkGray),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CreditCardForm(
                                formKey: controller.formKey,
                                obscureCvv: true,
                                obscureNumber: true,
                                cardNumber: controller.cardNumber.value,
                                cvvCode: controller.cvvCode.value,
                                zipCode: controller.zipCode.value,
                                isHolderNameVisible: true,
                                isCardNumberVisible: true,
                                isExpiryDateVisible: true,
                                cardHolderName: controller.cardHolderName.value,
                                expiryDate: controller.expiryDate.value,
                                themeColor: ColorCode.orange,
                                textColor: ColorCode.darkGray,
                                
                                cardHolderDecoration: InputDecoration(
                                    hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCode.ligthGray),
                                
                                    // labelStyle: const TextStyle(color: ),
                                    focusedBorder: controller.border,
                                    enabledBorder: controller.border,
                                    // labelText: 'Card Holder',
                                    hintText: "Card Name (optional)"),
                                cardNumberDecoration: InputDecoration(
                                  
                                    // labelText: 'Number',
                                    hintText: 'Card Number',
                                    
                                    hintStyle:
                                       TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCode.ligthGray),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    focusedBorder: controller.border,
                                    enabledBorder: controller.border,
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ), 
                                    )
                                    ),
                                expiryDateDecoration: InputDecoration(
                                  
                                  // labelStyle: const TextStyle(color: ColorCode.orange),
                                  focusedBorder: controller.border,
                                  enabledBorder: controller.border,
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  // labelText: 'Expired Date',
                                  hintText: 'EXP',
                                   hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCode.ligthGray),
                                ),
                                cvvCodeDecoration: InputDecoration(
                                   hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCode.ligthGray),
                                  // labelStyle: const TextStyle(color: ColorCode.orange),
                                  focusedBorder: controller.border,
                                  enabledBorder: controller.border,
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  // labelText: 'CVV',
                                  hintText: 'CSV',
                                ),
                                zipCodeDecoration: 
                                InputDecoration(
                                  hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCode.ligthGray),
                                  // labelStyle: const TextStyle(color: ColorCode.orange),
                                  focusedBorder: controller.border,
                                  enabledBorder: controller.border,
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  // labelText: 'CVV',
                                  hintText: 'ZIP',
                                ),
            
                                onCreditCardModelChange: (v) {
                                  log(v.zipCode.toString());
                                  // controller.setCardValue(v);
                                },
                                // onCreditCardModelChange: () => onCreditCardModel,
                              ),
                              Spacer(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 10.h,
                                ),
                                child: FillBtn(
                                  ontap: () {
                                    if(controller.formKey.currentState!.validate()){
                                          //  Get.back();
                                          Navigator.pop(context);
                                          
                                    }
                                  },
                                  text: "SAVE",
                                  Bgcolor: ColorCode.ligthGray,
                                ),
                              ),
                              SizedBox(height: 20.h,),
                              Padding(
                               padding:  EdgeInsets.symmetric(
                                  horizontal: 10.h,
                                ),
                                child: BorderBtn(ontap: (){}, text: "DELETE PAYMENT METHOD", Bgcolor: ColorCode.ligthGray,
                                textColor: ColorCode.ligthGray,
                                 ),
                              ),
                               SizedBox(
                                height: 100.h,
                              ),
                              Padding(
                                  // this is new
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom))
                            ]),
                      )))),
            ));
      },
    );
    // return GetBuilder<VehicleController>(
    //   init: VehicleController(),
    //   initState: (_) {},
    //   builder: (_) {
    //     return Scaffold(
    //         body: Padding(
    //           padding:  EdgeInsets.symmetric(
    //             horizontal: 10.h
    //           ),
    //           child: SingleChildScrollView(
    //               child: Padding(
    //                   padding: EdgeInsets.only(
    //                       bottom: MediaQuery.of(context).viewInsets.bottom),
    //                   child: Container(
    //                       child: SizedBox(
    //                     height: Get.height,
    //                     child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         // mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           SizedBox(
    //                             height: 50.h,
    //                           ),
    //                           Padding(
    //                             padding: EdgeInsets.only(left: 10.h),
    //                             child: ImageLogoWithRigthIcon(
    //                                 back: InkWell(
    //                                   onTap: () {
    //                                     Get.back();
    //                                   },
    //                                   child: SvgPicture.asset(
    //                                     "assets/icons/backarrow.svg",
    //                                     width: 30,
    //                                   ),
    //                                 ),
    //                                 icon: InkWell(
    //                                   onTap: () =>
    //                                       Get.offNamed(Routes.ALLTRUCKINMAP),
    //                                   child: Image.asset(
    //                                     "assets/icons/mytruck.png",
    //                                     width: 50,
    //                                   ),
    //                                 )),
    //                           ),
    //                           SizedBox(
    //                             height: 50.h,
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Text(
    //                                 "Add Payment Method",
    //                                 style: Heading1(color: ColorCode.darkGray),
    //                               )
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             height: 15.h,
    //                           ),
    //                           CreditCardForm(
    //                             formKey: controller.formKey,
    //                             obscureCvv: true,
    //                             obscureNumber: true,
    //                             cardNumber: controller.cardNumber.value,
    //                             cvvCode: controller.cvvCode.value,
    //                             zipCode:  controller.zipCode.value,
    //                             isHolderNameVisible: true,
    //                             isCardNumberVisible: true,
    //                             isExpiryDateVisible: true,
    //                             cardHolderName: controller.cardHolderName.value,
    //                             expiryDate: controller.expiryDate.value,
    //                             themeColor: ColorCode.orange,
    //                             textColor: ColorCode.darkGray,
    //                             cardHolderDecoration: InputDecoration(
    //                                 hintStyle: const TextStyle(
    //                                   color: ColorCode.ligthGray,
    //                                 ),
    //                                 // labelStyle: const TextStyle(color: ),
    //                                 focusedBorder: controller.border,
    //                                 enabledBorder: controller.border,
    //                                 // labelText: 'Card Holder',
    //                                 hintText: "Card Name (optional)"),
    //                             cardNumberDecoration: InputDecoration(
    //                                 // labelText: 'Number',
    //                                 hintText: 'Card Number',
    //                                 hintStyle:
    //                                     const TextStyle(color: Colors.black),
    //                                 labelStyle:
    //                                     const TextStyle(color: Colors.black),
    //                                 focusedBorder: controller.border,
    //                                 enabledBorder: controller.border,
    //                                 errorBorder: const OutlineInputBorder(
    //                                   borderSide: BorderSide(
    //                                     color: Colors.red,
    //                                   ), 
    //                                 )
    //                                 ),
    //                             expiryDateDecoration: InputDecoration(
    //                               hintStyle:
    //                                   const TextStyle(color: ColorCode.darkGray),
    //                               // labelStyle: const TextStyle(color: ColorCode.orange),
    //                               focusedBorder: controller.border,
    //                               enabledBorder: controller.border,
    //                               errorBorder: const OutlineInputBorder(
    //                                 borderSide: BorderSide(
    //                                   color: Colors.red,
    //                                 ),
    //                               ),                               
    //                               hintText: 'EXP',
    //                             ),
    //                             cvvCodeDecoration: InputDecoration(
    //                               hintStyle:
    //                                   const TextStyle(color: ColorCode.darkGray),
    //                               // labelStyle: const TextStyle(color: ColorCode.orange),
    //                               focusedBorder: controller.border,
    //                               enabledBorder: controller.border,
    //                               errorBorder: const OutlineInputBorder(
    //                                 borderSide: BorderSide(
    //                                   color: Colors.red,
    //                                 ),
    //                               ),
    //                               // labelText: 'CVV',
    //                               hintText: 'CSV',
    //                             ),
    //                              zipCodeDecoration: 
    //                             InputDecoration(
    //                               hintStyle:
    //                                   const TextStyle(color: ColorCode.darkGray),
    //                               // labelStyle: const TextStyle(color: ColorCode.orange),
    //                               focusedBorder: controller.border,
    //                               enabledBorder: controller.border,
    //                               errorBorder: const OutlineInputBorder(
    //                                 borderSide: BorderSide(
    //                                   color: Colors.red,
    //                                 ),
    //                               ),
    //                               // labelText: 'CVV',
    //                               hintText: 'ZIP',
    //                             ),
            
    //                             onCreditCardModelChange: (v) {
    //                               // controller.setCardValue(v);
    //                             },
    //                             // onCreditCardModelChange: () => onCreditCardModel,
    //                           ),
    //                           Spacer(),
    //                           const SizedBox(
    //                             height: 10,
    //                           ),
    //                           FillBtn(
    //                             ontap: () {
    //                               if(controller.formKey.currentState!.validate()){
    //                                 Get.back();
    //                               }
    //                             },
    //                             text: "SAVE",
    //                             Bgcolor: ColorCode.ligthGray,
    //                           ),
    //                           SizedBox(height: 10.h,),
    //                           BorderBtn(ontap: (){}, text: "DELETE PAYMENT METHOD", Bgcolor: ColorCode.ligthGray,
    //                           textColor: ColorCode.ligthGray,
    //                            ),
            
    //                           const SizedBox(
    //                             height: 40,
    //                           ),
    //                           Padding(
    //                               // this is new
    //                               padding: EdgeInsets.only(
    //                                   bottom: MediaQuery.of(context)
    //                                       .viewInsets
    //                                       .bottom))
    //                         ]),
    //                   )))),
    //         ));
    //   },
    // );
  }
}

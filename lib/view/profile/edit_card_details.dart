import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
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
      controller.setCardDataInEdit();
      //  log("calling initstate function");
    //  controller.setCardDetails();
    //  controller.update();
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
                              Padding(
                                       padding:  EdgeInsets.symmetric(
                                        vertical: 10.r, 
                                        horizontal: 15.r
                                      ),
                                      child: TextFormField(
                                        style: TextFieldStyle(),
                                        controller: controller.cardNameCtrl,                  
                                        autocorrect: true,
                                        keyboardType: TextInputType.name,
                                      
                                        onChanged: (val){
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Card Name",
                         hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.w700
                                      ), 
                                          focusedBorder: MainBorder(),
                                          border: MainBorder(),
                                          enabledBorder: MainBorder(),
                                        ),
                                      ),
                                    ),
                                
                                Padding(
                                       padding:  EdgeInsets.symmetric(
                                        vertical: 10.r, 
                                        horizontal: 15.r
                                      ),
                                      child: TextFormField(
                                        readOnly: true,
                                        style: TextFieldStyle(),
                                        // controller: controller.cardNumberCtrl,                  
                                        autocorrect: true,
                                        keyboardType: TextInputType.number,
                                        // obscureText: true,
                                        // obscuringCharacter:  ,
                                         inputFormatters: [
                         MaskedInputFormatter('####-####-####-####')
                                          ],
                                        onChanged: (val){
                                          log(val.length.toString());
                                           controller.addCardVaild();
                                          if(val.length == 19){
                        FocusManager.instance.primaryFocus?.nextFocus();
                        
                                          }
                                         
                                        },
                                        validator: (val){
                                           if(val!.length == 19){
                                            return null;
                                          }
                                          else{
                                            return "Wrong Card Number";
                                          }

                                        },
                                        decoration: InputDecoration(
                                          hintText: "XXXX-XXXX-XXXX-XXXX",
                         hintStyle: TextStyle(
                                        color: ColorCode.darkGray,
                                        fontWeight: FontWeight.w700
                                      ), 
                                          focusedBorder: MainBorder(),
                                          border: MainBorder(),
                                          enabledBorder: MainBorder(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                       padding:  EdgeInsets.symmetric(
                                        vertical: 10.r, 
                                        horizontal: 15.r
                                      ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                            Expanded(
                               flex: 2,
                                child: TextFormField(
                                        style: TextFieldStyle(),
                                        controller: controller.expDataCtrl,  
                                    readOnly: true,
                                        autocorrect: true,
                                        keyboardType: TextInputType.number,
                                         inputFormatters: [
                         MaskedInputFormatter('##/####')
                                          ],
                                        onChanged: (value){
                                          if(value.length == 5){
                       FocusManager.instance.primaryFocus?.nextFocus();
                                          }  
                                          controller.addCardVaild();      
                                        },
                                           validator: (val){
                                           if(val!.length == 5){
                                            return null;
                                          }
                                          else{
                                            return "Exp Data";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "MM/YY",
                         hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.w700
                                      ), 
                                          focusedBorder: MainBorder(),
                                          border: MainBorder(),
                                          enabledBorder: MainBorder(),
                                        ),
                                      ),
                              ),
                                 SizedBox(width: 20.h,),
                              Expanded(
                                 flex: 2,
                                 
                                child: TextFormField(
                                        style: TextFieldStyle(),
                                        controller: controller.cvvCtrl,                  
                                        autocorrect: true,
                                        
                                        keyboardType: TextInputType.number,
                                        obscureText: true,
                                        obscuringCharacter: "X",
                                         inputFormatters: [
                         MaskedInputFormatter('###')
                                          ],
                                        onChanged: (val){
                                          if(val.length ==  3){
                         FocusManager.instance.primaryFocus?.nextFocus();
                                          }
                                          controller.addCardVaild();
                                        },
                                         validator: (val){
                                           if(val!.length == 3){
                                            return null;
                                          }
                                          else{
                                            return "CVV";
                                          }

                                        },
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintText: "XXX",
                         hintStyle: TextStyle(
                                        color: ColorCode.darkGray,
                                        fontWeight: FontWeight.w700
                                      ), 
                                          focusedBorder: MainBorder(),
                                          border: MainBorder(),
                                          enabledBorder: MainBorder(),
                                        ),
                                      ),
                              ),
                              SizedBox(width: 20.h,),
                              Expanded(
                                 flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                        style: TextFieldStyle(),
                                        controller: controller.zipCodeCtrl,                  
                                        autocorrect: true,
                                        obscureText: true,
                                        obscuringCharacter: "X",
                                        keyboardType: TextInputType.name,
                                         inputFormatters: [
                                            MaskedInputFormatter('#####')
                                          ],
                                        onChanged: (val){
                                           controller.addCardVaild();
                                           if(val.length == 5){

                                           FocusManager.instance.primaryFocus?.unfocus();
                                           }
                                          
                                        },
                                        validator: (val){
                                          if(val!.length == 5){
                                            return null;
                                          }
                                          else{
                                            return "Zip";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "XXXXX",
                                          hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.w700
                                      ), 
                                          focusedBorder: MainBorder(),
                                          border: MainBorder(),
                                          enabledBorder: MainBorder(),
                                        ),
                                      ),
                              ),
                            ],),
                                   ),
                              const SizedBox(
                                height: 20,
                              ),
                             Padding(
                                  // this is new
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom))
                            ]),
                      )))),
            ),
            bottomNavigationBar: Container(
              height: 140.h,
              child: Column(
                children: [
                   Padding(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 15.h,
                                ),
                                child: FillBtn(
                                  ontap: () {
                                    // if(controller.formKey.currentState!.validate()){
                                          //  Get.back();
                                          // Navigator.pop(context);     
                                      controller.updateCardName(context);                                     
                                    // }
                                  },
                                  text: "SAVE",
                                  Bgcolor: ColorCode.ligthGray,
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Padding(
                               padding:  EdgeInsets.symmetric(
                                  horizontal: 15.h,
                                  vertical: 5.h
                                ),
                                child: BorderBtn(ontap: (){
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text(
                                          "Delete Card",
                                          style: Heading1(),
                                        ),
                                        content: Text(
                                          "Are your sure to delete this card",
                                          style: Heading3Regular(),
                                        ),
                                        actions: <Widget>[
                                          Row(children: [
                                          
                                 Expanded(
                                              flex: 2,
                                            child: ElevatedButton(
                                              // FlatButton widget is used to make a text to work like a button
                                          
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              }, // function used to perform after pressing the button
                                              child: Text('CANCEL'),
                                            ),
                                          ),
                                          SizedBox(width:  20.h,),
                             Expanded(
                                              flex: 2,
                                            child: ElevatedButton(
                                                // textColor: Colors.black,
                                                onPressed: () async {
                                                  Navigator.of(ctx).pop();
                                                   controller.DeleteCardDetailsApi(context, controller.editCardData!.id.toString());
                                                },
                                                child: Text('DELETE')),
                                          ),
                                          ],)
                                        ],
                                      ),
                                    );
                                  // controller.DeleteCardDetailsApi(context, controller.editCardData!.id.toString());
                                }, text: "DELETE PAYMENT METHOD", Bgcolor: ColorCode.ligthGray,
                                textColor: ColorCode.ligthGray,
                                 ),
                              ),
                ],
              ),
            ),
            );
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

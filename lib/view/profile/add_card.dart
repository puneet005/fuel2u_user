import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/capitalization.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
// import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

class AddCard extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    VehicleController controller = Get.find<VehicleController>();

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
                      child: Form(
                        key: controller.formKey,
                        child: Container(
                            child: SizedBox(
                          height: Get.height,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              
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
                                            Get.toNamed(Routes.ALLTRUCKINMAP),
                                        child: Image.asset(
                                          "assets/icons/mytruck.png",
                                          width: 50,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add Payment Method",
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
                                        keyboardType: TextInputType.text,
                                      
                                        onChanged: (val){
                                        },
                                       inputFormatters: [
    TextCapitalizationFormatter(TextCapitalization.sentences),
  ],
                                        maxLength: 27,
                                        decoration: InputDecoration(
                                           counterText: "",
                                          hintText: "Card Name",
                         hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.w700
                                      ), 
                                          focusedBorder: MainBorder(),
                                          border: MainBorder(),
                                          enabledBorder: MainBorder(),
                                        ),
                                         validator: (val){
                                           if(val!.length >2){
                                            return null;
                                          }
                                          else{
                                            return "Enter Card Name";
                                          }

                                        },
                                      ),
                                    ),
                                
                                Padding(
                                       padding:  EdgeInsets.symmetric(
                                        vertical: 10.r, 
                                        horizontal: 15.r
                                      ),
                                      child: TextFormField(
                                        style: TextFieldStyle(),
                                        controller: controller.cardNumberCtrl,                  
                                        autocorrect: true,
                                        keyboardType: TextInputType.number,
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
                                            return "Enter Valid Card Number";
                                          }

                                        },
                                        decoration: InputDecoration(
                                          hintText: "Card Number",
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
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                            Expanded(
                               flex: 2,
                                child: TextFormField(
                                        style: TextFieldStyle(),
                                        controller: controller.expDataCtrl,  
                                    
                                        autocorrect: true,
                                        keyboardType: TextInputType.number,
                                         inputFormatters: [
                         MaskedInputFormatter('##/##')
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
                                            return "Enter Valid Exp Date";
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
                                            return "Enter Security Code";
                                          }

                                        },
                                        decoration: InputDecoration(
                                          hintText: "CSV",
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
                                        controller: controller.zipCodeCtrl,                  
                                        autocorrect: true,
                                        obscureText: true,
                                        obscuringCharacter: "X",
                                        keyboardType: TextInputType.phone,
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
                                            return "Enter Valid Zip Code";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "ZIP",
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
                      
                                Spacer(),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: 10.h,
                                  ),
                                  child: FillBtn(
                                    ontap: () async {
                                      if(controller.formKey.currentState!.validate()) {
                                           bool res = await controller.SendCardDetailsApi(context);
                                            if(res){
                                            OrderController ordCon = Get.find<OrderController>(); 
                                          if(ordCon.newOrderCretating.value){
                                            ordCon.GetCardList(context);
                                            ordCon.newOrderCretating.value = false;
                                            ordCon.update();
                                          }
                                            Navigator.pop(context);
                                          }
                                      }
                                    },
                                    text: "SAVE",
                                    Bgcolor: controller.addcardvaildvalue.value ? ColorCode.orange : ColorCode.ligthGray,
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
                        )),
                      ))),
            ));
      },
    );
  }
}

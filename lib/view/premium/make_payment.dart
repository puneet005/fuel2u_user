import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

import '../../controller/premiun_controller.dart';

class MakePayment extends GetView<PremiunController> {
  @override
  Widget build(BuildContext context) {
    PremiunController controller = Get.find<PremiunController>();

    return GetBuilder(
      init: PremiunController(),
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
                                SizedBox(height: 50.h,),
              ImageLogo(),
              SizedBox(height: 40.h,), 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Make Payment",
                  textAlign: TextAlign.center,
                  style: Heading1()
                    
                ),
              ),
              SizedBox(
                height: 5.h,
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
                                            return "Wrong Card Number";
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
                                            return "CSV";
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
                                            return "Zip";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Zip Code",
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
                                               Get.toNamed(Routes.ADDVEHICLE);                                              
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

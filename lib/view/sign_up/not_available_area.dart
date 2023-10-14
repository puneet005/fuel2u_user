import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';


class NotAvaiableArea extends GetView<SignUpController>{
  const NotAvaiableArea({super.key});

  @override
  Widget build(BuildContext context) {
    //  Get.lazyPut<SignUpController>(() => SignUpController());
    // TODO: implement build
    SignUpController controller = Get.put(SignUpController());
    Future.delayed(Duration.zero,(){
      controller.phoneNoCrt.clear();
      // controller.
    });
   return GetBuilder(
     init: SignUpController(),
     initState: (_) {},
     builder: (_) {
       return Scaffold(
       body: GestureDetector(
             onTap: (){
                 FocusManager.instance.primaryFocus?.unfocus();
               },
         child: SingleChildScrollView (
           child: Padding(
             padding:  EdgeInsets.symmetric(
                   horizontal: 15.h
                 ),
             child: Form(
               key: controller.phoneFormKey,
               child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(height: 50.h,),
                    ImageLogo(),
                   SizedBox(height: 40.h,), 
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Expanded(
                         child: Text("2U Fuel is not in your area yet",
                         textAlign: TextAlign.center, style: Heading1(
                           
                           color: ColorCode.darkGray
                      ),
                      maxLines: 2,),
                    )
                  ],
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 10.r, 
                    horizontal: 15.r
                  ),
                  child: Text("Enter your phone number to get notified when 2U Fuel is available in your area.", 
                      maxLines: 3,
                      textAlign: TextAlign.center,
          
                      overflow: TextOverflow.ellipsis,
                      style: HeadingSub2(
                        
                      ),),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
          
                    
                //   ],
                // ),
                SizedBox(height: 10.h,),
                Padding(
                   padding:  EdgeInsets.symmetric(
                    vertical: 10.r, 
                    horizontal: 15.r
                  ),
                  child: TextFormField(
                    controller: controller.phoneNoCrt,
                     style: TextFieldStyle(),       
                    
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                       MaskedInputFormatter('###-###-####')
                    ],
                    onChanged: (val){
                      if(val.length == 12){
                        controller.getVaild();
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                      else{
                          controller.getVaildFalse();
                      }
                    },
                    decoration:  InputDecoration(
                      
                      // prefixIcon: Icon(Icons.location_on, color: ColorCode.black,),
                      hintText: "Phone Number",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ), 
                      focusedBorder: MainBorder(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorCode.orange
                        ),
                      ),
                      enabledBorder: MainBorder(),
                    ),
                  ),
                ),
               
                // Spacer(),
                // FillBtn(ontap: (){}, text: "Confirm Address",
                // Bgcolor: ColorCode.darkGray,),
                
                
              ],
            ),
          ),
        ),
    
      ),
    ),
    bottomNavigationBar: Container(
          height: Get.height/4,
          child: Column(
            children: [
               Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20.h
              ),
                    child:  FillBtn(ontap: (){
                      if(controller.phoneVaild.value){
                        controller.NoFuelApi(context);

                      }
                    
                    },
                    Bgcolor:  controller.phoneVaild.value ? ColorCode.orange : ColorCode.ligthGray,
                     text: "Notify Me")
                    

                    
                  ),
                  SizedBox(height: 20.h,),
                   Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20.h
              ),
                    child: BorderBtn(ontap: (){                      
                       Get.toNamed(Routes.SIGNUP);
                    }, text: "No Thanks"),
                  ),
                 
                  // SizedBox(height: 40.h,),
                  //  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                  //   ),
              
            ],
          )
          ,
        )
  
    // ),
   );

     },
   );
  }

}


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

import '../../widgets/fill_button_ui.dart';

class SignUpView extends GetView<SignUpController>{
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    
      Get.lazyPut<SignUpController>(() => SignUpController());
    return Scaffold(
     
        body: SingleChildScrollView(
      child: GetBuilder<SignUpController>(
        init: SignUpController(),
        initState: (_) {},
        builder: (_) {
          return Padding(
             padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: controller.signupkey,
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 15.h
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.h,),
                      const ImageLogo(),
                      SizedBox(height: 40.h,), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign Up", style: Heading1(
                            // color: ColorCode.darkGray
                          ),)
                        ],
                      ),
                      SizedBox(height: 10.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 10.r, 
                    horizontal: 15.r
                  ),
                  child: Text("Choose your preference, phone or email.\n2U Fuel will send you a verification code.", 
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: HeadingSub2(),
                      // style: HeadingCustom(
                      //   size: 18,
                      //   color: ColorCode.darkGray,
                      // ),
                      ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                   padding:  EdgeInsets.symmetric(
                    vertical: 10.r, 
                    horizontal: 15.r
                  ),
                  child: TextFormField(
                    style: TextFieldStyle(),       
                    controller: controller.firstnameCrt,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter First Name";
                      }
                      if(val.length < 3){
                        return "Enter Valid Last Name";
                      }
                      return null;
                  
                    },
                    onChanged: (val){
                      controller.IsSignUpAllField();
                    },
                    decoration:  InputDecoration(
                      hintText: "First Name",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.w700
                  ), 
                      focusedBorder:  MainBorder(),
                      border:  MainBorder(),
                      enabledBorder:  MainBorder(),
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
                    controller: controller.lastnameCrt,
                      onChanged: (val){
                      controller.IsSignUpAllField();
                    },
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Last Name";
                      }
                       if(val.length < 3){
                        return "Enter Valid Last Name";
                      }
                      return null;
                  
                    },
                    decoration:  InputDecoration(
                      hintText: "Last Name",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.w700
                  ), 
                      focusedBorder:  MainBorder(),
                      border:  MainBorder(),
                      enabledBorder:  MainBorder(),
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
                    controller: controller.phoneNoCrt,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                       MaskedInputFormatter('###-###-####')
                    ],
                     onChanged: (val){
                  if(val.length == 12){
                    // controller.getVaild();
                    FocusManager.instance.primaryFocus?.nextFocus();
                    controller.IsSignUpAllField();
                  }
                  // else{
                  //     // controller.getVaildFalse();
                  // }
                },
                    validator: (val){
                      if(val!.length == 12){
                        
                        return null;
                      }
                      else if(val.isEmpty){
                        return "Enter Phone Number";
                      }
                      return "Enter Valid Number";
                  
                    },
                    decoration:  InputDecoration(
                      hintText: "Phone Number",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.w700
                  ), 
                      focusedBorder:  MainBorder(),
                      border:  MainBorder(),
                      enabledBorder:  MainBorder(),
                    ),
                  ),
                ),
                Padding(
                   padding:  EdgeInsets.symmetric(
                    vertical: 10.r, 
                    horizontal: 15.r
                  ),
                  child: TextFormField(
                    onChanged: (val){                                         
                    controller.emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val);
                    controller.update();
                    if(controller.emailValid){
                       controller.IsSignUpAllField();
                    }
                    },
                    style: TextFieldStyle(),       
                    controller: controller.emailCrt,
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (val){     
                    //   if(val == null || val.isEmpty){
                    //     return "Enter Last Name";
                    //   }
                    //   return null;
                    // },
                    decoration:  InputDecoration(
                      hintText: "Email",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.w700
                  ), 
                      focusedBorder:  MainBorder(),
                      border: MainBorder(),
                      enabledBorder:  MainBorder(),
                    ),
                  ),
                ),
                  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                  
                    children: [
                      SizedBox(width: 10.h,),
                       Obx(() => Checkbox(
                        activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(3)         
                        ),
                              value: controller.acceptTeam.value,
                              onChanged: (value) {
                              controller.IsSignUpAllField();
                                  controller.checkAcceptTeam(value!);
                              },
                              
                            ), ),
                             InkWell(
                              onTap: (){
                                GloballaunchUrl("${ApiUrls.domain}app/terms");
                              },
                               child: Text("Accept Terms of Use",  style:  TextStyle(
                                fontSize: 13.sp,
                                fontFamily: "RobotoRegular",
                                color: ColorCode.black,
                                                 decoration: TextDecoration.underline,
                                               ),),
                             )
                    ],
                  ),
                ),
                
                // const Spacer(),
                // FillBtn(ontap: (){}, text: "Confirm Address",
                // Bgcolor: ColorCode.darkGray,),
                
             
                 
                SizedBox(height: 40.h,),
      
                Padding(padding: EdgeInsets.symmetric(
                  horizontal: 15.h
                ),
                child: FillBtn(
                Bgcolor:   controller.acceptTeam.value? ColorCode.orange :  ColorCode.ligthGray,
                  ontap: (){

                  // if(controller.isSignUp.value){
                if(controller.signupkey.currentState!.validate()){
                        controller.SignUpApi(context);
                      }
                  // }
                  // else{
                  //   ToastUi("Please Enter Requried Field");
                  // }
                  // if(controller.phoneNoCrt.text.isEmpty && controller.emailCrt.text.isEmpty){
                  //   ToastUi("Please Enter Number Or Email");
      
                  // }
      
                  // if(controller.isSignUp.value){
      
                  // }
      
                }, text: "SIGN UP"),
                ),
      
      
            //          Obx(() => controller.acceptTeam.value ?
            //      Padding(
            // padding:  EdgeInsets.symmetric(
            //   horizontal: 15.h
            // ),
            //       child: FillBtn(ontap: (){
            //               Get.toNamed(Routes.VERIFICATION);
            //           }, text: "SIGN UP"
            //       ),
            //     ): Padding(
            //       padding:  EdgeInsets.symmetric(
            //         horizontal: 15.h
            //       ),
            //       child: FillBtn(ontap: (){
      
            //       }, text: "SIGN UP",
            //       Bgcolor: ColorCode.ligthGray,),
            //     )
            //     // {
            //     //   if(controller..value ){
            //     //     return FillBtn(ontap: (){
            //     //         Get.toNamed(Routes.SIGNUP) ;
            //     //     }, text: "Notify Me"
            //     // ) ;
            //     //   }
            //     //   else{
            //     //     return FillBtn(ontap: (){}, text: "Notify Me",
            //     // Bgcolor: ColorCode.ligthGray,);
            //     //   }
            //     // }
             
            //     ),
              SizedBox(height: 40.h,),
                
            
              ],
            ),
          ),
        ),
      )
      ; 
        },
      )
    ),
    // ),
   );
  }
}
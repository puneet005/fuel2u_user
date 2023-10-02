import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/login_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';

import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});
   
   @override
  Widget build(BuildContext context) {
     Get.lazyPut<LoginController>(() => LoginController());
    // TODO: implement build
   return Scaffold(
    body: SingleChildScrollView(
      child: GetBuilder(
        init: LoginController(),
        initState: (_) {},
        builder: (_) {
          return Container(
              height: Get.height,
              child: Form(
                key: controller.phoneFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h,),
                     ImageLogo(),
                    SizedBox(height: 40.h,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enter Your\nPhone Number or Email", 
                        textAlign: TextAlign.center,
                        style: Heading1(
                          color: ColorCode.darkGray
                        ),)
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                       vertical: 10.r, 
                  horizontal: 15.r
                ),
                child: Text("2U Fuel will send you a verification code.", 
                    maxLines: 3,
                    textAlign: TextAlign.center,
    
                    overflow: TextOverflow.ellipsis,
                    style: HeadingSub2(),),
              ),
              
              SizedBox(height: 10.h,),
               controller.onlyNumber.value ?
              Padding(
                 padding:  EdgeInsets.symmetric(
                  vertical: 10.r, 
                  horizontal: 15.r
                ),
                child: TextFormField(
                  style: TextFieldStyle(),
                  controller: controller.phoneNo,                  
                  autocorrect: true,
                  keyboardType: TextInputType.name,
                   inputFormatters: [
                       MaskedInputFormatter('###-###-####')
                    ],
                  onChanged: (val){
                       if(val.isNotEmpty){
                          controller.onlyNumber.value =  isNumber(val); 
                          if(controller.onlyNumber.value){

                          }                                               
                          controller.update();
                          controller.getVaild();
                          
                        }
                        else{
                            controller.getVaildFalse();
                        }
                      },
                   
                  decoration: InputDecoration(
                    
                    // prefixIcon: Icon(Icons.location_on, color: ColorCode.black,),
                    hintText: "Phone Number or Email",
                       hintStyle: TextStyle(
                  color: ColorCode.ligthGray,
                  fontWeight: FontWeight.w700
                ), 
                    focusedBorder: MainBorder(),
                    border: MainBorder(),
                    enabledBorder: MainBorder(),
                  ),
                ),
              ): 
              Padding(
                 padding:  EdgeInsets.symmetric(
                  vertical: 10.r, 
                  horizontal: 15.r
                ),
                child: TextFormField(
                  style: TextFieldStyle(),
                  controller: controller.phoneNo,                  
                  autocorrect: true,
                  keyboardType: TextInputType.name,
                
                  onChanged: (val){
                       if(val.isNotEmpty){
                          controller.onlyNumber.value =  isNumber(val); 
                          if(controller.onlyNumber.value){                              
                          }                                               
                          controller.update();
                          controller.getVaild();                          
                        }
                        else{
                            controller.getVaildFalse();
                        }
                      },                   
                  decoration: InputDecoration(                    
                    // prefixIcon: Icon(Icons.location_on, color: ColorCode.black,),
                    hintText: "Phone Number or Email",
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                     Obx(() => Checkbox(
                      activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                       shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(3)         
                      ),
                            splashRadius: 2.0,
                            value: controller.reminderMe.value,
                            onChanged: (value) {
                                controller.getReminderMe(value!);
                            },
                          ), ),
                          Text("Remember Me",  style:  HeadingCustomFamliy(
                            family: "RobotoRegular",
                            size: 12.sp,
                            
                          )
                )
                  ],
                ),
              ),
               Spacer(),
              Obx(()
              {
                if(controller.phoneVaild.value ){
                  return FillBtn(ontap: (){
                    controller.SignInApi(context);                  
                  }, text: "Log in"
              );
                }
                else{
                  return FillBtn(ontap: (){}, text: "Log in",
              Bgcolor: ColorCode.ligthGray,);
                }
              }             
              ),
              SizedBox(height: 40.h,)                        
            ],
          ),
        ),
      ) ; 
        },
      )
    ),
    
    // ),
   );

  }

bool isNumber(String input) {
  print(input);
  final pattern = r'^-?[0-9, -]+$';
  final regExp = RegExp(pattern);
  //  print(regExp.hasMatch(input));
  return regExp.hasMatch(input);
}
 
}
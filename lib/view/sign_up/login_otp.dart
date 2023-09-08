import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/login_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
class LoginOTP extends StatefulWidget {
  const LoginOTP({super.key});

  @override
  State<LoginOTP> createState() => _LoginOTPState();
}

class _LoginOTPState extends State<LoginOTP> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  LoginController controlller =  Get.put(LoginController());
  String otptext = "";
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder(
        init: LoginController(),
        initState: (_) {},
        builder: (_) {
          return SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  const ImageLogo(),
                  SizedBox(height: 40.h,), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enter Your Verification Code", style: Heading1(
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
                      child: Text("Sent to <XXX-XXX-XXXX or example@email.com>", 
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: HeadingSub2()),
                    ),
       SizedBox(height: 15.h,),
                    OtpPinField(
                    fieldHeight: 45,
                    fieldWidth: 45,
                    key: _otpPinFieldController,
              autoFillEnable: true,
              textInputAction: TextInputAction.done,
              onSubmit: (text) {              },
              onChange: (text) {
                if(text.length ==6){
                  controlller.getoptValid();
                  FocusManager.instance.primaryFocus?.unfocus();
                   otptext = text;
                     setState(() {});
                  }
                else{
controlller.getotpNotVaild();
                }
                

                
              },
              onCodeChanged: (code) {
                
              },  
              otpPinFieldStyle: const OtpPinFieldStyle(
                fieldBorderRadius: 0.0,     

                defaultFieldBorderColor: ColorCode.orange,
                activeFieldBorderColor: ColorCode.orange,
                activeFieldBackgroundColor: Colors.white,               
                filledFieldBackgroundColor: Colors.white,
                filledFieldBorderColor: ColorCode.orange,
              ),
              maxLength: 6,
              showCursor: true,          
              otpPinFieldDecoration: OtpPinFieldDecoration.custom),
 SizedBox(height: 15.h,),
 if(!controlller.otpVaild.value)
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Didn’t receive code? ", style: HeadingSub2()),
             Text("Send it again.", style: HeadingRobotoBold(),)
          ],
          ),

          Spacer(),
           Obx(() => controlller.otpVaild.value ?
              FillBtn(ontap: (){
                  controlller.SignInVerifyApi(context, otptext);
                      // Get.offAndToNamed(Routes.HOME);
                  }, text: "LOG IN"
              ): FillBtn(ontap: (){

              }, text: "LOG IN",
              Bgcolor: ColorCode.ligthGray,)),
            SizedBox(height: 40.h,),
          ],
        ),
      ); 
        },
      )
        ))
        
    );

  }
}
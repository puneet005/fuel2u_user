import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';

import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/backbtn_appbar.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';

import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';



class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  SignUpController controlller =  Get.put(SignUpController());
  String otptext = "";
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
      child:  GetBuilder(
        init: SignUpController(),
        initState: (_) {},
        builder: (_) {
          return Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 15.h
                  ),
              child: Container(
                height: Get.height,
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    BackBtnAppBar(),
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
                            style: 
                           HeadingSub2()
                       ),
                ),
                SizedBox(height: 15.h,),
                OtpPinField(
                  fieldWidth: 45,
                  fieldHeight: 45,
                    // fieldWidth: 45,
                  
                key: _otpPinFieldController,
                autoFillEnable: true,
                textInputAction: TextInputAction.done,
                
                onSubmit: (text) {
                  
      
                  /// return the entered pin
                },
                onChange: (text) {
                  if(text.length ==6){
                    controlller.getoptValid();
                     otptext = text;
                     setState(() {
                       
                     });

                  
                    FocusManager.instance.primaryFocus?.unfocus();

                    

                  }
                  else{
                  controlller.getotpNotVaild();
                  }
                  
      
                  /// return the entered pin
                },
                onCodeChanged: (code) {
                  
                },
                otpPinFieldStyle:  OtpPinFieldStyle(
                  fieldBorderRadius: 0.0,
                  textStyle: TextFieldStyle(),
                
                  defaultFieldBorderColor: ColorCode.orange,
                 
                  activeFieldBorderColor: ColorCode.orange,
                  activeFieldBackgroundColor: Colors.white,
      
                 
                  filledFieldBackgroundColor: Colors.white,
                  filledFieldBorderColor: ColorCode.orange,
                ),
                maxLength: 6,
      
                
                showCursor: true,          
                otpPinFieldDecoration: OtpPinFieldDecoration.custom),
              SizedBox(height: 25.h,),
              if(!controlller.otpVaild.value)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Didn’t receive code? ", style: HeadingSub2()),
               Text("Send it again.", style: HeadingRobotoBold(),)
            ],
            ),
      
            Spacer(),
            Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 15.h
            ),
               child: Obx(() => controlller.otpVaild.value ?
                  FillBtn(ontap: (){
                  controlller.SignUpVerifyApi(context, otptext);
                          //
                      }, text: "LOG IN"
                  ): FillBtn(ontap: (){}, text: "LOG IN",
                  Bgcolor: ColorCode.ligthGray,)),
             ),
              SizedBox(height: 40.h,),
            ],
          ),
        ),
      )   ; 
        },
      )  
        ))
        // child: Form(,
    );

  }
}


// class VerificationView extends GetView{
//   const VerificationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Scaffold(
//         body: SingleChildScrollView(
//       child: Container(
//         height: Get.height,
//         child: Column(
//           children: [
//             SizedBox(height: 40,),
//             BackBtnAppBar(),
//             SizedBox(height: 20.h,), 
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Enter Your Verification Code", style: Heading1(
//                     color: ColorCode.darkGray
//                   ),)
//                 ],
//               ),
//               SizedBox(height: 5.h,),
//               Padding(
//                 padding:  EdgeInsets.symmetric(
//                   vertical: 10.r, 
//                   horizontal: 15.r
//                 ),
//                 child: Text("Sent to <XXX-XXX-XXXX or example@email.com>", 
//                     maxLines: 3,
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                     style: HeadingCustom(
//                       size: 18,
//                       color: ColorCode.darkGray.withOpacity(0.7)
//                     ),),
//               ),

//                OtpPinField(
//               key: _otpPinFieldController,
//               autoFillEnable: false,

//               ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
//               textInputAction: TextInputAction.done,

//               ///in case you want to change the action of keyboard
//               /// to clear the Otp pin Controller
//               onSubmit: (text) {
//                 print('Entered pin is $text');

//                 /// return the entered pin
//               },
//               onChange: (text) {
//                 print('Enter on change pin is $text');

//                 /// return the entered pin
//               },
//               onCodeChanged: (code) {
//                 print('onCodeChanged  is $code');
//               },

//               /// to decorate your Otp_Pin_Field
//               otpPinFieldStyle: OtpPinFieldStyle(
//                 /// border color for inactive/unfocused Otp_Pin_Field
//                 defaultFieldBorderColor: Colors.red,

//                 /// border color for active/focused Otp_Pin_Field
//                 activeFieldBorderColor: Colors.indigo,

//                 /// Background Color for inactive/unfocused Otp_Pin_Field
//                 defaultFieldBackgroundColor: Colors.yellow,

//                 /// Background Color for active/focused Otp_Pin_Field
//                 activeFieldBackgroundColor: Colors.cyanAccent,

//                 /// Background Color for filled field pin box
//                 filledFieldBackgroundColor: Colors.green,

//                 /// border Color for filled field pin box
//                 filledFieldBorderColor: Colors.green,
//               ),
//               maxLength: 4,

//               /// no of pin field
//               showCursor: true,

//               /// bool to show cursor in pin field or not
//               cursorColor: Colors.indigo,

//               /// to choose cursor color
//               upperChild: Column(
//                 children: [
//                   SizedBox(height: 30),
//                   Icon(Icons.flutter_dash_outlined, size: 150),
//                   SizedBox(height: 20),
//                 ],
//               ),
//               middleChild: Column(
//                 children: [
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                       onPressed: () {
//                         _otpPinFieldController.currentState?.clearOtp(); // clear controller
//                       },
//                       child: Text('clear OTP')),
//                   SizedBox(height: 10),
//                   ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage())), child: Text('Next Class')),
//                   SizedBox(height: 30),
//                 ],
//               ),
//               showCustomKeyboard: true,

//               ///bool which manage to show custom keyboard
//               // customKeyboard: Container(),
//               /// Widget which help you to show your own custom keyboard in place if default custom keyboard
//               showDefaultKeyboard: true,

//               ///bool which manage to show default OS keyboard
//               cursorWidth: 3,

//               /// to select cursor width
//               mainAxisAlignment: MainAxisAlignment.center,

//               /// place otp pin field according to yourself

//               /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
//               ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
//               otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration),

//           ],
//         ),
//       )
//         ))
//         // child: Form(,
//     );
//   }

// }
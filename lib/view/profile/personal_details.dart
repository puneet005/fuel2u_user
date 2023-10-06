import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';

class PersonalDetails extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
       Future.delayed(Duration.zero, (){
     controller.ProfileApi(context);
   });
    return Scaffold(
        body: GetBuilder(
            init: SignUpController(),
            initState: (_) {},
            builder: (_) {
              return SafeArea(
                  child: controller.isLoading.value ? SizedBox(
                    height: Get.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ): SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: Form(
                            child: Column(children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: ImageLogoWithRigthIcon(
                                    back: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
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
                                    "Personal Details",
                                    style: Heading1(color: ColorCode.darkGray),
                                  ),
                                ]),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  // First Name
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.r, horizontal: 15.r),
                                    child: TextFormField(
                                      style: TextFieldStyle(),
                                      controller: controller.firstnameCrt,
                                      autocorrect: true,
                                      keyboardType: TextInputType.name,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Enter First Name";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "First Name",
                                         hintStyle: TextStyle(
                  color: ColorCode.ligthGray,
                  fontWeight: FontWeight.w700
                ), 

                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Last Name
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.r, horizontal: 15.r),
                                    child: TextFormField(
                                      style: TextFieldStyle(),
                                      controller: controller.lastnameCrt,
                                      autocorrect: true,
                                      keyboardType: TextInputType.name,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Enter Last Name";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Last Name",
                                         hintStyle: TextStyle(
                  color: ColorCode.ligthGray,
                  fontWeight: FontWeight.w700
                ), 
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Mobile Number
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.r, horizontal: 15.r),
                                    child: TextFormField(
                                      style: TextFieldStyle(),
                                      controller: controller.phoneNoCrt,
                                      autocorrect: true,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        MaskedInputFormatter('###-###-####')
                                      ],
                                      validator: (val) {
                                        if (val!.length == 12) {
                                          return null;
                                        } else if (val.isEmpty) {
                                          return "Enter Phone Number";
                                        }
                                        return "Enter Valid Number";
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Phone Number",
                                         hintStyle: TextStyle(
                  color: ColorCode.ligthGray,
                  fontWeight: FontWeight.w700
                ), 
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Email
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.r, horizontal: 15.r),
                                    child: TextFormField(
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
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                         hintStyle: TextStyle(
                  color: ColorCode.ligthGray,
                  fontWeight: FontWeight.w700
                ), 
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: ColorCode.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 50.h,),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                                    child: FillBtn(ontap: (){
                                      controller.SaveProfile(context);
                                      // controller.
                                    }, text: "SAVE CHANGES",
                                    Bgcolor: ColorCode.ligthGray,),
                                  ),
                                  SizedBox(height: 20.h,),
                                 Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                                    child: BorderBtn(ontap: (){
                                      showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text(
                                          "Delete Account",
                                          style: Heading1(),
                                        ),
                                        content: Text(
                                          "Are your sure to delete you account",
                                          style: Heading3Regular(),
                                        ),
                                        actions: <Widget>[
                                           Row(
                                            children: [
                                          
                                          Expanded(
                                            flex: 2,
                                            child: ElevatedButton(
                                              // FlatButton widget is used to make a text to work like a button
                                          
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              }, // function used to perform after pressing the button
                                              child: Text('NO'),
                                            ),
                                          ),
                                          SizedBox(width: 20.h,),
                                         Expanded(
                                            flex: 2,
                                            child: ElevatedButton(
                                                // textColor: Colors.black,
                                                onPressed: () async {
                                                  Navigator.of(ctx).pop();
                                                  controller.deleteAccount(context);
                                                  // logOutcontroller.SignOutApi(
                                                  //     context);
                                                },
                                                child: Text('CONFIRM'),
                                                
                                                ),
                                          ),
                                                  
                                            ],
                                          )
                                          // ElevatedButton(
                                          //   // FlatButton widget is used to make a text to work like a button

                                          //   onPressed: () {
                                          //     Navigator.of(ctx).pop();
                                          //   }, // function used to perform after pressing the button
                                          //   child: Text('NO'),
                                          // ),
                                          // ElevatedButton(
                                          //     // textColor: Colors.black,
                                          //     onPressed: () async {
                                          //       Navigator.of(ctx).pop();
                                          //       controller.deleteAccount(context);
                                          //       // logOutcontroller.SignOutApi(
                                          //       //     context);
                                          //     },
                                          //     child: Text('YES')),
                                        ],
                                      ),
                                    );
                                    }, text: "DELETE ACCOUNT",Bgcolor: ColorCode.ligthGray,textColor: ColorCode.ligthGray,),
                                  ),
                                  SizedBox(height: 20.h,)
                          
                          
                          
                          
                          
                                  
                                
                            ]),
                          ))));
            }));
  }
}

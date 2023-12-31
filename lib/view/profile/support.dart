

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';

import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          height: Get.height,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              children: [
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
                  SizedBox(height: 20.h,), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Support", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                  ),
                  SizedBox(height: 20.h,), 
                  Divider(
                    color: ColorCode.ligthGray,
                  ),
                 Row(
                  children: [
                    Container(
                      width: Get.height /8,
                      height: 70.h,
                      child: Image.asset("assets/images/email_icon.png"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email", style: Heading1(),),
                        // SizedBox(height: 10.h,),
                        Text("support@2Ufuel.com", style:  HeadingCustomFamliy(
                          family: "RobotoRegular",
                          size: 16.sp,
                          // fbold: 
                          
                        ),)
                      ],
                    )
                  ],
                 ),
                  Divider(
                    color: ColorCode.ligthGray,
                  ),
                   Row(
                  children: [
                    Container(
                      width: Get.height /8,
                      height: 70.h,
                      child: Image.asset("assets/images/phone_icon.png"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Call", style: Heading1(),),
                     
                        Text("XXX-XXX-XXXX", style: HeadingCustomFamliy(
                          family: "RobotoRegular",
                          size: 16.sp,
                          // fbold: 
                          
                        ),)
                      ],
                    )
                  ],
                 ),
                  const Divider(
                    color: ColorCode.ligthGray,
                  ),
              ],
            ),
          ),
        )),
    );
  }
}
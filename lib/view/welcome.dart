import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/routes/app_pages.dart';

import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';



class Welcome extends GetView{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:  Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 10.h
            ),
        child: Container(
          height: ScreenUtil().screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset("assets/images/logo.png", height: 100.h, width: 200.w,), 
              Spacer(),
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.r, 
                  horizontal: 20.r
                ),
                child: FillBtn(ontap: (){
                  Get.toNamed(Routes.DELIVERYPINCODE);
                }, text: "Create Account")
              ),
              SizedBox(height: 5.h,),
               Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.r, 
                  horizontal: 20.r
                ),
                child: BorderBtn(ontap: (){
                   Get.toNamed(Routes.LOGIN);
                }, text: "Log in")
              ),SizedBox(height: 20.h,),
            ],
          ),
        ),
      )
     );
  }

}
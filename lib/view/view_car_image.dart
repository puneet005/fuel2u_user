import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

import '../utils/ui_hepler.dart';

class ViewCarImage extends GetView{
  const ViewCarImage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     AddVehicleController controller = Get.find<AddVehicleController>(); 
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
       
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 25.h,
              vertical: 10.h
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                ImageLogo(),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Upload your profile photo",
                      style: Heading1(color: ColorCode.darkGray),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 150.h,
                  width: 300.w,
                  child: Image.file(File(controller.imagePath)),
          
                ),
                Spacer(),
                FillBtn(ontap: (){
                  Get.offAllNamed(Routes.HOME);
                }, text: "SAve",
                ),
                  
                  SizedBox(
                    height: 20.h,
                  ),
                  BorderBtn(ontap: () {}, text: "edit"),

                  SizedBox(
                    height: 20.h,
                  ),
          
              ]),
          )));
  }

}
// 00008130-001568AA3633C02E
import 'dart:io';

import 'package:flutter/cupertino.dart';
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
       
          child: GetBuilder(
            init: AddVehicleController(),
            initState: (_) {},
            builder: (_) {
              return Padding(
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
                                "Upload your vehicle photo",
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
                 Get.back();
                }, text: "SAve",
                ),
                  
                  SizedBox(
                    height: 20.h,
                  ),
                  BorderBtn(ontap: () {
                    _addPictureSheet(context);
                  }, text: "edit"),

                  SizedBox(
                    height: 20.h,
                  ),
          
              ]),
          ); 
            },
          )));
  }
void _addPictureSheet(BuildContext context) {
    AddVehicleController controller = Get.find<AddVehicleController>();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Add Picture', style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: HeadingCustom(color: Colors.blue),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
               Navigator.pop(context);
              controller.getImage(false);
              //
            },
            child: Text(
              'Choose Form Gallery',
              style: HeadingCustom(color: Colors.blue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
               Navigator.pop(context);
              controller.getImage(true);
              //
            },
            child: Text('Take a Picture',
                style: HeadingCustom(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
// 00008130-001568AA3633C02E
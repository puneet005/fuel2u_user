// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FillBtn extends StatelessWidget {
  String text;
  Function()  ontap;
  Color Bgcolor;
   FillBtn({super.key, required this.ontap, required this.text, this.Bgcolor = ColorCode.orange});
  @override
  Widget build(BuildContext context) {
  return InkWell(
    onTap: ontap,
    child: Container(
                  height: 47.sp,
                  width: Get.width -30,
                  decoration:  BoxDecoration(
                    color: Bgcolor,
                     borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20)
                     )
                  ),
                  child: Center(
                    child: Text(text.toUpperCase(),
                    style: TextStyle(
                      fontFamily: "RobotoMedium",
                      color: ColorCode.white,
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.w700 
                    ),
                    ),
                  ),
                ),
  );
  }


}
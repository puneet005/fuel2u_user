import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


// ignore: must_be_immutable
class BorderBtn extends StatelessWidget {
  String text;
  Function()  ontap;
  Color Bgcolor;
  Color textColor;
   BorderBtn({super.key, required this.ontap, required this.text, this.Bgcolor = ColorCode.orange, this.textColor = ColorCode.orange});

  @override
  Widget build(BuildContext context) {
  return InkWell(
    onTap: ontap,
    child: Container(
                  height: 47.sp,
                  width: Get.width -30,
                  decoration:  BoxDecoration(
                    // color: ColorCode.orange,
                    border:Border.all(
                      color: Bgcolor,
                      width: 2
                    ),
                     borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20)
                     )
                  ),
                  child: Center(
                    child: Text(text.toUpperCase(),
                    style: TextStyle(
                      fontFamily: "RobotoMedium",
                      color: Bgcolor,
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.w700
                    )
                    ),
                  ),
                ),
  );
  }


}

// class BorderBtn extends StatelessWidget {
//   String text;
//   Function()  ontap;
//    BorderBtn({super.key, required this.ontap, required this.text});

//   @override
//   Widget build(BuildContext context) {
//   return InkWell(
//     onTap: ontap,
//     child: Container(
//                   height: 50.h,
//                   width: Get.width -30,
//                   decoration:  BoxDecoration(
//                     // color: ColorCode.orange,
//                     border:Border.all(
//                       color: ColorCode.orange,
//                       width: 2
//                     ),
//                      borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(24)
//                      )
//                   ),
//                   child: Center(
//                     child: Text(text.toUpperCase(),
//                     style: TextStyle(
//                       color: ColorCode.orange, letterSpacing: 0.7.w,
//                       fontSize: 20, 
//                       fontWeight: FontWeight.bold
                      
//                     ),
//                     ),
//                   ),
//                 ),
//   );
//   }


// }
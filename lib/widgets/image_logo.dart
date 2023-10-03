
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset("assets/images/logo.png", height: 60.h, width: 100.w,),
             ],
           );
  }
}
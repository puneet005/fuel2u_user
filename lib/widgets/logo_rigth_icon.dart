
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ImageLogoWithRigthIcon extends StatelessWidget {
    Widget icon;
    Widget? back =  SizedBox(width: 50,);
   ImageLogoWithRigthIcon({super.key, required this.icon, this.back });

  @override
  Widget build(BuildContext context) {
    return Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                back ?? SizedBox(width: 50,),
                Spacer(),
                if(back != SizedBox(width: 50,))
                SizedBox(width: 5.h,), 
               Image.asset("assets/images/logo.png", height : 60.h, width: 90.w,),
               Spacer(),
               icon
             ],
           );
  }
}
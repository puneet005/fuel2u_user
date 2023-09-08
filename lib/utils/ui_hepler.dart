import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/widgets/circularLoading.dart';

TextStyle Heading1({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w600,
}) {
  return TextStyle(
    fontFamily: "RobotoMedium",
    fontSize: 22.sp,
    color: color,
    // fontWeight: fbold
  );
}

TextStyle Heading3Medium({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w600,
}) {
  return TextStyle(
    fontFamily: "RobotoMedium",
    fontSize: 18.sp,
    color: color,
    // fontWeight: fbold
  );
}

TextStyle Heading4Medium({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w600,
}) {
  return TextStyle(
    fontFamily: "RobotoMedium",
    fontSize: 16.sp,
    color: color,
    // fontWeight: fbold
  );
}

TextStyle Heading2({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w700,
}) {
  return TextStyle(fontSize: 20.sp, color: color, fontWeight: fbold);
}

TextStyle HeadingSub2({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w400,
}) {
  return TextStyle(
      fontFamily: "RobotoRagular",
      fontSize: 16.sp,
      color: color,
      fontWeight: fbold);
}

TextStyle HeadingCustomFamliy(
    {double size = 18,
    Color color = ColorCode.darkGray,
    FontWeight fbold = FontWeight.normal,
    TextDecoration? decoration,
    family = 'Robota'}) {
  return TextStyle(
      fontFamily: family,
      fontSize: size,
      color: color,
      fontWeight: fbold,
      decoration: decoration);
}

TextStyle Heading3Regular({
  family = 'RobotoRagular',
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,
}) {
  return TextStyle(
      fontFamily: family, fontSize: 14.sp, color: color, fontWeight: fbold);
}

TextStyle Heading5({
  family = 'RobotoRagular',
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,
}) {
  return TextStyle(
      fontFamily: family, fontSize: 13.sp, color: color, fontWeight: fbold);
}

TextStyle Heading5Medium({
  family = 'RobotoMedium',
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,
}) {
  return TextStyle(
      fontFamily: family, fontSize: 13.sp, color: color, fontWeight: fbold);
}

TextStyle HeadingCustom({
  double size = 18,
  Color color = ColorCode.black,
  FontWeight fbold = FontWeight.normal,
  TextDecoration? decoration,
}) {
  return TextStyle(
      fontSize: size, color: color, fontWeight: fbold, decoration: decoration);
}

TextStyle HeadingRobotoBold(
    {Color color = ColorCode.darkGray,
    FontWeight fbold = FontWeight.w600,
    double size = 16}) {
  return TextStyle(
    fontFamily: "Roboto",
    fontSize: size.sp,
    color: color,
    // fontWeight: fbold
  );
}

OutlineInputBorder MainBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: ColorCode.orange,
    ),
  );
}

TextStyle TextFieldStyle({
  double size = 16,
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.bold,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontFamily: "Roboto",
    fontSize: 16.sp,
    color: ColorCode.darkGray,
    // fontWeight: FontWeight.bold
  );
}




// Loading Ui 


 OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color:  ColorCode.darkGray.withOpacity(0.7),
          child: CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }

 hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 500), () {
      try {
        loader.remove();
      // ignore: empty_catches
      } catch (e) {}
    });
  }

ToastUi(
  String massage,
  {
  
  Color bgColor = ColorCode.white,
  Color textColor = ColorCode.darkGray,
  double size = 16,

}){
  return  Fluttertoast.showToast(
        msg: massage,        
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: size);
}



 
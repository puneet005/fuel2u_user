

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fuel2u_user/utils/color.dart';


TextStyle Heading1({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w600,
}){
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
}){
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
}){
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
}){
  return TextStyle(
    fontSize: 20.sp,
    color: color,
    fontWeight: fbold
  );
}


TextStyle HeadingSub2({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w400,
}){
  return TextStyle(
     fontFamily: "RobotoRagular",
    fontSize: 16.sp,

    color: color,
    fontWeight: fbold
  );
}

TextStyle HeadingCustomFamliy({
 double size  = 18,
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,
  TextDecoration? decoration,
  family = 'Robota'
}){
  return TextStyle(
    fontFamily: family,
    fontSize: size,
    color: color,
    fontWeight: fbold,
    decoration: decoration
  );
}







TextStyle Heading3({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w500,
}){
  return TextStyle(
    fontSize: 18,
    color: color,
    fontWeight: fbold
  );
} 


TextStyle Heading4({
  Color color = ColorCode.black,
  FontWeight fbold = FontWeight.w700,
}){
  return TextStyle(
    fontSize: 16,
    color: color, 
    fontWeight: fbold
  );
}
TextStyle Heading3Regular({
  family = 'RobotoRagular',
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,

}){
  return TextStyle(
    fontFamily: family,
    fontSize: 14.sp,
    color: color,
    fontWeight: fbold
  );
}
TextStyle Heading5({
  family = 'RobotoRagular',
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,
}){
  return TextStyle(
    fontFamily: family,
    fontSize: 13.sp,
    color: color,
    fontWeight: fbold
  );
}

TextStyle Heading5Medium({
  family = 'RobotoMedium',
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.normal,
}){
  return TextStyle(
    fontFamily: family,
    fontSize: 13.sp,
    color: color,
    fontWeight: fbold
  );
}

TextStyle HeadingCustom({
 double size  = 18,
  Color color = ColorCode.black,
  FontWeight fbold = FontWeight.normal,
  TextDecoration? decoration,
}){
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: fbold,
    decoration: decoration
  );
}

TextStyle HeadingRobotoBold({
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.w600,
  double size = 16
}){
  return TextStyle(
    fontFamily: "Roboto",
    fontSize: size.sp,
    color: color,
    // fontWeight: fbold
  );
}






OutlineInputBorder MainBorder(){
 return OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: ColorCode.orange,
      ),
    ); 
}

TextStyle TextFieldStyle({

 double size  = 16,
  Color color = ColorCode.darkGray,
  FontWeight fbold = FontWeight.bold,
  TextDecoration? decoration,
}){
  return  TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16.sp,
                          color: ColorCode.darkGray,
                          // fontWeight: FontWeight.bold
                      
                        );
} 

// Heading1(

//  ){
//   return TextStyle();
// }
// Text Heading(
//   String text, {
//   bool alignCenter = false,
//   double fontSize = 20,
//   FontWeight fontWeight = FontWeight.normal,
//   Color color = Colors.black,
//   TextDecoration decoration = TextDecoration.none,
  
// }) {
//   return Text(
//     text,
//     textAlign: alignCenter ? TextAlign.center : TextAlign.start,
//     style: TextStyle(
//       fontSize: fontSize,
//       fontWeight: fontWeight,
//       color: color,
//       decoration: decoration,
//     )
//   );
// }
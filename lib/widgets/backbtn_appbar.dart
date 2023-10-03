import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

class BackBtnAppBar extends StatelessWidget {
  const BackBtnAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:  EdgeInsets.symmetric(
                  vertical: 10.r, 
                  horizontal: 10.r
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                                "assets/icons/backarrow.svg",
                                // semanticsLabel: 'Acme Logo'
                              ),
                  ),
           
            ImageLogo(),
            SizedBox(width: 20,),
            
            
                ],
              ),
            );
  }
}
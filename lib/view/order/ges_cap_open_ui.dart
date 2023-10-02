import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
class GasCapOpen extends StatefulWidget {
  const GasCapOpen({super.key});

  @override
  State<GasCapOpen> createState() => _GasCapOpenState();
}

class _GasCapOpenState extends State<GasCapOpen> {
    OrderController controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/gas_cap_open.png"), 
            fit: BoxFit.cover
            ),
        ),
        child:Column(
          children: [
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height : 60.h, width: 100.w,),
              ],
            ),
            SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                            child: Text(
                              
                              "Don’t forget to leave your\n gas cap open.",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              
                              style: HeadingRobotoBold(color: ColorCode.darkGray, size: 26),
                                            ),
                          )
                ],
              ),
              Spacer(),
               Padding(
                 padding:  EdgeInsets.symmetric(
                  horizontal: 10.h
                 ),
                 child: FillBtn(ontap: (){
                  controller.getOrder();
                  Get.offAllNamed(Routes.HOME);
                             }, text: "GOT IT"),
               ),
              SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
}
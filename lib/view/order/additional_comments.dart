import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';

import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/review_order.dart';

import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class AdditionalComments extends GetView<OrderController>{
  const AdditionalComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child:GetBuilder<OrderController>(
      init: OrderController(),
      initState: (_) {},
      builder: (_) {
            return SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 10.h
                ),
                child: Column(
                  children: [
                    ImageLogoWithRigthIcon(
                      back: InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          // Get.back();
                        },
                      child: SvgPicture.asset("assets/icons/backarrow.svg", width: 30,),
                    ),
                      icon: InkWell(
                      child: Image.asset("assets/icons/mytruck.png", width: 50,),
                    )),
                    SizedBox(height: 40.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Additional Comments", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                    ),
                     SizedBox(height: 10.h,), 
                    Padding(
              padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
              child: TextFormField(
                style: TextFieldStyle(),
                controller: controller.commentCtrl,
                autocorrect: true,
                keyboardType: TextInputType.name,
                // validator: (val) {},
                decoration:  InputDecoration(
                  hintText: "Comments (optional)",
                  hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.bold
                  ),
                  focusedBorder: MainBorder(),
                  border: MainBorder(),
                  enabledBorder: MainBorder(),
                ),
              ),
              ), 
                    
                    
                  ]),
              ),
            );}
                  )),
                bottomNavigationBar: 
                
                   Padding(
                     padding:  EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20.h
                     ),
                     child: FillBtn(
                                Bgcolor: ColorCode.ligthGray,
                                 ontap: (){
                                   PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: ReviewOrder(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                                      //  Get.toNamed(Routes.REVIEWORDER); 
                                 }, text: "Next"),
                   )
                  
                
                  );

  }

} 

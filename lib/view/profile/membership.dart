

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/premiun_controller.dart';

import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/profile/membership_change.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Membership extends GetView<PremiunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder(
              init: PremiunController(),
              initState: (_) {},
              builder: (_) {
                return Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 10.h),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: ImageLogoWithRigthIcon(
                                back: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    // Get.back();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/backarrow.svg",
                                    width: 30,
                                  ),
                                ),
                                icon: InkWell(
                                  onTap: () =>
                                      Get.offNamed(Routes.ALLTRUCKINMAP),
                                  child: Image.asset(
                                    "assets/icons/mytruck.png",
                                    width: 50,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Select the Plan that’s right for you.",
                textAlign: TextAlign.center,
                style: Heading1()
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
             ListView(
                shrinkWrap: true,
                children: List.generate(controller.planList.length,
                    (index) => 
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 15.h
                      ),
                      child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                       
                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: 10.h,
                                          vertical: 10.h,
                                        ),
                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (){
                                                                controller.changePlan(index);
                                                              },
                                                              child: Container(
                                                                height: 20,
                                                                width: 20,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  border: Border.all(color: ColorCode.orange),
                                                                  color: controller.selectPlan.value == index ? ColorCode.orange : ColorCode.white,
                                                                ),
                                                              ),
                                                            ),
                                                            // Radio(
                                                            //     value: index,
                                                            //     groupValue: controller.selectPlan.value,
                                                            //     onChanged: (value) {
                                                            //         controller.changePlan(index);
                                                            //     }),
                                                            SizedBox(width: 10.h,),
                                                            Text(
                                                              controller.planList[index]['name'],
                                                              style: Heading2(color: ColorCode.darkGray),
                                                            ),
                                                            Spacer(),
                                                            GestureDetector(

                                                              onTap: (){
                                                                 controller.viewPlan(index);
                                                                PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: MemberShipDetail(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                                                              },
                                                              child: SvgPicture.asset("assets/icons/rightarrow.svg", width: 25.h,))
                                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                      height: 5.h,
                                    ),
                                    Divider(
                      thickness: 2,
                                    )
                                  ],
                                ),
                    )),
              ), 
            // ListView(
            //   shrinkWrap: true,
            //   children: List.generate(controller.planList.length,
            //       (index) => 
            //       Padding(
            //         padding:  EdgeInsets.symmetric(
            //           vertical: 6.h,
            //           horizontal: 15.h
            //         ),
            //         child: Column(
            //                     children: [
            //                       InkWell(
            //                         onTap: (){
            //                           controller.showPlanIndex.value = index;
            //                           // Get.toNamed(Routes.MEMBERSHIPETAILS);
                                       
            //                  PersistentNavBarNavigator
            //                                             .pushNewScreen(
            //                                           context,
            //                                           screen: MemberShipDetail(),
            //                                           withNavBar:
            //                                           true, // OPTIONAL VALUE. True by default.
            //                                           pageTransitionAnimation:
            //                                           PageTransitionAnimation
            //                                               .cupertino,
            //                                         );
            //                         },
            //                         child: Padding(
            //                           padding:  EdgeInsets.symmetric(
            //                             vertical: 10.h
            //                           ),
            //                           child: Row(
            //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                             children: [
            //                                               Container(
            //                                                     height: 20,
            //                                                     width: 20,
            //                                                     decoration: BoxDecoration(
            //                                                       shape: BoxShape.circle,
            //                                                       border: Border.all(color: ColorCode.orange),
            //                                                       color: controller.selectPlan.value == index ? ColorCode.orange : ColorCode.white,
            //                                                     ),
            //                                                   ),
            //                                                 // ),
            //                                                 // Radio(
            //                                                 //     value: index,
            //                                                 //     groupValue: controller.selectPlan.value,
            //                                                 //     onChanged: (value) {
            //                                                 //         controller.changePlan(index);
            //                                                 //     }),
            //                                                 SizedBox(width: 10.h,),
            //                                               // Radio(
            //                                               //     value: index,
            //                                               //     groupValue: controller.selectPlan.value,
            //                                               //     onChanged: (value) {
            //                                               //         controller.changePlan(index);
            //                                               //     }),
            //                                               Text(
            //                                                 controller.planList[index]['name'],
            //                                                 style: Heading1(color: ColorCode.darkGray,
            //                                                 fbold: FontWeight.w500),
            //                                               ),
            //                                               Spacer(),
            //                                               SvgPicture.asset("assets/icons/rightarrow.svg")
            //                                             ],
            //                           ),
            //                         ),
            //                       ),
            //                       SizedBox(
            //         height: 5.h,
            //                       ),
            //                       Divider(
            //         thickness: 2,
            //                       )
            //                     ],
            //                   ),
            //       )),
            // ), 
                        ])));
                        }),
      )
    );
  }
}


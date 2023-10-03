


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/premiun_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/profile/add_promo_code.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MemberShipDetail extends GetView{
  const MemberShipDetail({super.key});

  @override
  Widget build(BuildContext context) {
  PremiunController controller = Get.find<PremiunController>();
   return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.h),
        child: ListView(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
             Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: ImageLogoWithRigthIcon(
                                  back: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
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
            SizedBox(height: 40.h,),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${controller.planList[controller.showPlanIndex.value]['name']}",
                      style: Heading1()
                    )
                  ],
                ),
              ),
               SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("\$${controller.planList[controller.showPlanIndex.value]['price']}", style: HeadingCustomFamliy(
                  size: 75.sp,
                  color: ColorCode.darkGray,
                  fbold: FontWeight.bold
                 ),)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("${controller.planList[controller.showPlanIndex.value]['duration']}", style: HeadingCustomFamliy(
                  

                  size: 22.sp, 
                  family: "RobotoRagular"                
                 ),)
                ],
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.h
                ),
                child: ListView(
                  shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                 children : List.generate(controller.planList[controller.showPlanIndex.value]['featureList'].length, (index) => Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.h),
                        child: Icon(Icons.check, color: ColorCode.orange, size: 28,),
                      ),
                      Expanded(
                        child: Text(
                    controller.planList[controller.showPlanIndex.value]['featureList'][index],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style:HeadingCustomFamliy(
                  

                  size: 22.sp, 
                  family: "RobotoRagular"                
                 ),
                    ),
                      ),
                    ],
                   ),
                 ))
                ),
              ),  
            // Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           "${controller.planList[controller.showPlanIndex.value]['name']}",
            //           style: Heading1()
            //         )
            //       ],
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //        Text("\$${controller.planList[controller.showPlanIndex.value]['price']}", style: HeadingCustom(
            //         size: 84,
            //         color: ColorCode.darkGray,
            //         fbold: FontWeight.bold
            //        ),)
            //       ],
            //     ),
            //   ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //      Text("${controller.planList[controller.showPlanIndex.value]['duration']}", style: HeadingCustom(
            //       size: 24,
                 
            //      ),)
            //     ],
            //   ),
            //   SizedBox(height: 10.h,),
            //   Padding(
            //     padding:  EdgeInsets.symmetric(
            //       vertical: 10.h,
            //       horizontal: 20.h
            //     ),
            //     child: ListView(
            //       shrinkWrap: true,
            //        physics: const NeverScrollableScrollPhysics(),
            //      children : List.generate(controller.planList[controller.showPlanIndex.value]['featureList'].length, (index) => Padding(
            //        padding: const EdgeInsets.all(8.0),
            //        child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding:  EdgeInsets.symmetric(horizontal: 10.h),
            //             child: Icon(Icons.check, color: ColorCode.orange, size: 28,),
            //           ),
            //           Expanded(
            //             child: Text(
            //         controller.planList[controller.showPlanIndex.value]['featureList'][index],
            //         maxLines: 4,
            //         overflow: TextOverflow.ellipsis,
            //         style: Heading1(
            //           fbold: FontWeight.normal
            //         ),
            //         ),
            //           ),
            //         ],
            //        ),
            //      ))
            //     ),
            //   ),    
              
          ],
        ),
      ) ,
      bottomNavigationBar: SizedBox(
        height: controller.showPlanIndex.value  == 2? 150.h :100.h,
        child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),          child: Column(children: [
            if(controller.showPlanIndex.value == 0)
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
                      child: FillBtn(ontap: (){}, text: "CHANGE PLAN"),
                    ),    
              if(controller.showPlanIndex.value > 0)  
               Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
                      child: FillBtn(ontap: (){}, text: "GET STARTED"),
                    ),  
               if(controller.showPlanIndex.value  == 2)  
               Padding(
                 padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
                 child: BorderBtn(ontap: (){
                  // Get.toNamed(Routes.ADDPROMOCODE);    
                  PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: AddPromoCode(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );            
                 }, text: "ADD PROMO CODE"),
               )
          ]),
        ),
      ),
   );
    
  }

}
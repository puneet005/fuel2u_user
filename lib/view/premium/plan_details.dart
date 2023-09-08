import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/premiun_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/backbtn_appbar.dart';
import 'package:get/get.dart';

class PlanDetails extends GetView{
  const PlanDetails({super.key});

  @override
  Widget build(BuildContext context) {
  PremiunController controller = Get.find<PremiunController>();
   return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BackBtnAppBar(),
          SizedBox(height: 30.h,),
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${controller.plansList![controller.showPlanIndex.value].name}",
                      style: Heading1()
                    )
                  ],
                ),
              ),
               SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                controller.plansList![controller.showPlanIndex.value].monthlyFee != 0 ?
                 Text("\$${controller.plansList![controller.showPlanIndex.value].monthlyFee }", style: HeadingCustomFamliy(
                  size: 75.sp,
                  color: ColorCode.darkGray,
                  fbold: FontWeight.bold
                 ),):  Text("\$${controller.plansList![controller.showPlanIndex.value].deliveryFee }", style: HeadingCustomFamliy(
                  size: 75.sp,
                  color: ColorCode.darkGray,
                  fbold: FontWeight.bold
                 ),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text( controller.plansList![controller.showPlanIndex.value].monthlyFee == 0 ? "Delivery Fee" :"Per Month"
                   , style: HeadingCustomFamliy(                
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
                 children : List.generate(controller.plansList![controller.showPlanIndex.value].features!.length, (index) => Padding(
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
                    controller.plansList![controller.showPlanIndex.value].features![index].name.toString(),
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
          //           "Pay as you go",
          //           style: HeadingCustom(
          //               size: 20,
          //               fbold: FontWeight.bold,
          //               color: ColorCode.darkGray),
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
          //         size: 44,
          //         fbold: FontWeight.bold
          //        ),)
          //       ],
          //     ),
          //   ),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //      Text("${controller.planList[controller.showPlanIndex.value]['duration']}", style: HeadingCustom(
          //       size: 20,
          //       // fbold: FontWeight.bold
          //      ),)
          //     ],
          //   ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Pay as you go",
            //         style: HeadingCustom(
            //             size: 24,
            //             fbold: FontWeight.bold,
            //             color: ColorCode.darkGray),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //      Text("\$${controller.planList[controller.showPlanIndex.value]['price']}", style: HeadingCustom(
            //       size: 80,
            //       fbold: FontWeight.bold
            //      ),)
            //     ],
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //    Text("${controller.planList[controller.showPlanIndex.value]['duration']}", style: HeadingCustom(
            //     size: 24,
               
            //    ),)
            //   ],
            // ),
            // SizedBox(height: 10.h,),
            // Padding(
            //   padding:  EdgeInsets.symmetric(
            //     vertical: 10.h,
            //     horizontal: 20.h
            //   ),
            //   child: ListView(
            //     shrinkWrap: true,
            //    children : List.generate(controller.planList[controller.showPlanIndex.value]['featureList'].length, (index) => Padding(
            //      padding: const EdgeInsets.all(8.0),
            //      child: Row(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Padding(
            //           padding:  EdgeInsets.symmetric(horizontal: 10.h),
            //           child: Icon(Icons.check, color: ColorCode.orange, size: 28,),
            //         ),
            //         Expanded(
            //           child: Text(
            //       controller.planList[controller.showPlanIndex.value]['featureList'][index],
            //       maxLines: 4,
            //       overflow: TextOverflow.ellipsis,
            //       style: Heading3(
            //         fbold: FontWeight.normal
            //       ),
            //       ),
            //         )
            //       ],
            //      ),
            //    ))
            //   ),
            // )
            


        ],
      ) ,
   );
    
  }

}
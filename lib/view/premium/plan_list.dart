

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/premiun_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SelectPlan extends GetView {
  const SelectPlan({super.key});

  @override
  Widget build(BuildContext context) {
    PremiunController controller = Get.find<PremiunController>();

    // TODO: implement build
    return Scaffold(
      body: GetBuilder<PremiunController>(
      init: PremiunController(),
      initState: (_) {},
      builder: (_) {
        return 
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 10.h
          ),
          child: Container(
          height: Get.height,
          child: Column(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(height: 50.h,),
              ImageLogo(),
              SizedBox(height: 40.h,), 
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
              controller.isLoading.value ?  Container(
                
                child: CircularProgressIndicator(),
                color: Colors.transparent,
              ) :
              ListView(
                shrinkWrap: true,
                children: List.generate(controller.plansList!.length,
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
                                                              controller.plansList![index].name.toString(),
                                                              style: Heading2(color: ColorCode.darkGray),
                                                            ),
                                                            Spacer(),
                                                            GestureDetector(
                                                              onTap: (){
                                                                controller.showPlanIndex.value = index;
                                                                Get.toNamed(Routes.PLANDETAILS);
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
              Spacer(),
               Padding(
                 padding:  EdgeInsets.symmetric(
                  horizontal: 10.h
                 ),
                 child: FillBtn(ontap: (){
                  // print(controller.planList[controller.selectPlan.value]);
                      // if(controller.plansList![controller.selectPlan.value].name == "Business"){
                          controller.GetPlan(context);
                         
                      // }
                      // else{
                        
                      // }
                       
                         }, text: "Save"
                    ),
               ),
        
                  SizedBox(
                    height: 20.h,
                  ),
                 Padding(
                 padding:  EdgeInsets.symmetric(
                  horizontal: 10.h
                 ),
                    child: BorderBtn(ontap: () {    
                      Get.toNamed(Routes.ADDVEHICLE);
                    }, text: "SKIP FOR NOW"),
                  ),
        
                  SizedBox(
                    height: 40.h,
                  ),
            ],
          ),
          ),
        );
        }),
    );
  }

  ShowPlan(var data, int index) {
    Get.lazyPut<PremiunController>(()=>PremiunController());
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.h),
        child: GetBuilder<PremiunController>(
      init: PremiunController(),
      initState: (_) {},
      builder: (_) {
        return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio(
                        value: index,
                        groupValue: controller.selectPlan.value,
                        onChanged: (value) {
                          // controller.setYesOrNo(value);
                        }),
                    Text(
                      "Pay as you go",
                      style: Heading3Medium(color: ColorCode.darkGray),
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/icons/rightarrow.svg")
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  thickness: 2,
                )
              ],
            );
          },
        ),
      ),
      //   );
      // },
    );
  }
}

 /*
  Container(
        height: Get.height,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ImageLogo(),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select the Plan that’s right for you.",
                    style: HeadingCustom(
                        size: 20,
                        fbold: FontWeight.bold,
                        color: ColorCode.darkGray),
                  )
                ],
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                                children: [
                                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                          value: index,
                          groupValue: controller.selectPlan.value,
                          onChanged: (value) {
                              controller.changePlan(index);
                          }),
                      Text(
                        "Pay as you go",
                        style: Heading3(color: ColorCode.darkGray),
                      ),
                      Spacer(),
                      SvgPicture.asset("assets/icons/rightarrow.svg")
                    ],
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
            )
          ],
        ),
      ),
 */

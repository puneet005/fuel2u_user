import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/select_plan.dart';
import 'package:fuel2u_user/view/premium/plan_list.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../routes/app_pages.dart';

class FuelType extends  GetView<OrderController>{
  const FuelType({super.key});
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
          child:GetBuilder<OrderController>(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
              return Container(
                height: Get.height,
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 10.h
                  ),
                  child: ListView(
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
                        Text("Select Fuel Type", style: Heading1(
                          color: ColorCode.darkGray
                        ),)
                      ],
                      ),
                      SizedBox(height: 30.h,),
                    GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: controller.fuelTypeList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 180),
                    itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // height: 200,
                     

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectFuelType = index;
                            controller.update();
                          },
                          child: Container(
                            width: Get.width/4,
                            height: Get.height/6,
                             decoration:   BoxDecoration(   
                            color: controller.selectFuelType == index ? ColorCode.orange : Colors.transparent,                       
                          border: Border.all(
                            color: ColorCode.orange,
                            width: 2
                          ),
                           borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24)
                       )
                                      ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/fuel_icon.svg",
                                color : controller.selectFuelType == index ? ColorCode.white :  ColorCode.orange ),
                                SizedBox(height: 10.h,),
                                Text("${controller.fuelTypeList[index]}", style: Heading5Medium(
                                  
                                  color : controller.selectFuelType == index ? ColorCode.white :  ColorCode.black 
                                ),),
                                
                            ]),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text("\$X.XX / gal", style: Heading3Medium(),)
                      ],
                    ),
                    );
                    }),
                    SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Select Amount Needed", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                    ),
                     SizedBox(height: 10.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("There is a \$20 minimum charge for fuel amount", style: Heading5Medium(
                        color: ColorCode.black,
                        fbold: FontWeight.normal
                      ),)
                    ],
                    ),
                     SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                                                            onTap: (){
                                                              controller.changeFuelAmount(1);
                                                              // controller.changePlan(index);
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: ColorCode.orange),
                                                                color: controller.selectFuelAmount.value == 1 ? ColorCode.orange : ColorCode.white,
                                                              ),
                                                            ),
                                                          ),
                            SizedBox(width: 10.h,),
                                                            Text("I only want \$20 of fuel", style: Heading5(
                        color: ColorCode.black,
                        fbold: FontWeight.w600
                        
                      ),)
                      ],
                    ),
                     SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                                                            onTap: (){
                                                              controller.changeFuelAmount(2);
                                                              // controller.changePlan(index);
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: ColorCode.orange),
                                                                color: controller.selectFuelAmount.value == 2 ? ColorCode.orange : ColorCode.white,
                                                              ),
                                                            ),
                                                          ),
                                                           SizedBox(width: 10.h,),
                        
                                                            Text("Fill the tank                  ", 
                                                            style: Heading5(
                        color: ColorCode.black,
                        fbold:  FontWeight.w600
                      ),)
                      ],
                    ),
                      SizedBox(height: 20.h,), 
                    // Spacer(),                   
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                // vertical: 0.h
              ),
              child: FillBtn(
                Bgcolor:  controller.selectFuelType != -1 && controller.selectFuelAmount != 0 ?  ColorCode.orange : ColorCode.ligthGray,
                ontap: (){
                  if(controller.selectFuelType != -1 && controller.selectFuelAmount != 0){
                     PersistentNavBarNavigator
                                                      .pushNewScreen(
                                                    context,
                                                    screen: SelectPlanOnOrder(),
                                                    withNavBar:
                                                    true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                    PageTransitionAnimation
                                                        .cupertino,
                                                  );
                    // Get.toNamed(Routes.SELECTPLANONORDER);
                  }                 
                }, text: "Next"),
            ),
               SizedBox(height: 20.h,),

              
                  ])));
      }))

    );
  }

}

/*

child:GridView.count(  
                  shrinkWrap: true,
                crossAxisCount: 3, 
                // padding: EdgeInsets.zero, 
                mainAxisSpacing: 2,
                // childAspectRatio: 2,
                children: List.generate(3, (index) {  
                  return Center(  
                    child: Container(
                      
                      child: Column(
                        children: [
                          Container(
                            width: Get.width/4,
                            height: Get.height/7,
                             decoration:   BoxDecoration(                          
                          border: Border.all(
                            color: ColorCode.orange,
                            width: 2
                          ),
                           borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24)
                       )
                                      ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/fuel_icon.svg")
                                
                            ]),
                          ),
                          // SizedBox(height: 10.h,),
                          Text("\$X.XX / gal", style: Heading3(),)
                        ],
                      ),
                    ),  
                  );  
                }  
                )  
            ) */
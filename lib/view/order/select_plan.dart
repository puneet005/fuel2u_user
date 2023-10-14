import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/select_location.dart';
import 'package:fuel2u_user/view/order/select_payment_method.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class SelectPlanOnOrder extends GetView<OrderController> {
  const SelectPlanOnOrder({super.key});

  @override
  Widget build(BuildContext context) {  
    return GetBuilder(
                init: OrderController(),
                initState: (_) {},
                builder: (_) {
                  return  Scaffold(
        body: SafeArea(
            child: GestureDetector( 
                    onTap: ()
                    {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.h, vertical: 10.h),
                            child: ListView(children: [
                              ImageLogoWithRigthIcon(
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
                                     onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
                                    child: Image.asset(
                                      "assets/icons/mytruck.png",
                                      width: 50,
                                    ),
                                  )),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Select Plan",
                                    style: Heading1(color: ColorCode.darkGray),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              // Bussiness Plan
                              if(controller.profileData!.userType != "User")
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: Get.height /  9.5,
                                    decoration: BoxDecoration(
                                        // color: ColorCode.orange,
                                        border: Border.all(
                                            color: ColorCode.orange, width: 2),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(24))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              color: controller.selectPlan == 1
                                                  ? ColorCode.orange
                                                  : Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Checkbox(
                                                    activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                3)),
                                                    value:
                                                        controller.selectPlan == 1
                                                            ? true
                                                            : false,
                                                    onChanged: (newValue) {
                                                      controller.selectPlan = 1;
                                                      controller.payAsGo.value = false;
                                                      controller.update();
                                                      // controller.setVehicle(index);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 10.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Business",
                                                      style: Heading3Medium(
                                                        // fbold: FontWeight.w500
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      "Employer Promo Code: ${controller.profileData!.promocode ?? "XXXXXX"}",
                                                      style: Heading5(
                                                          fbold:
                                                              FontWeight.normal),
                                                    )
                                                  ],
                                                ),
                                              ))
                                        ])),
                              ),
                              // Pay as you go
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: Get.height / 9.5,
                                    decoration: BoxDecoration(
                                        // color: ColorCode.orange,
                                        border: Border.all(
                                            color: ColorCode.orange, width: 2),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(24))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              color: controller.selectPlan == 2
                                                  ? ColorCode.orange
                                                  : Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Checkbox(
                                                    activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                3)),
                                                    value:
                                                        controller.selectPlan == 2
                                                            ? true
                                                            : false,
                                                    onChanged: (newValue) {
                                                      controller.selectPlan = 2;
                                                      controller.payAsGo.value = true;
                                                      controller.update();
                                                      // controller.setVehicle(index);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 10.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Pay as you go",
                                                      style: Heading3Medium(),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      "Address",
                                                      style: Heading5(
                                                          fbold:
                                                              FontWeight.normal),
                                                    )
                                                  ],
                                                ),
                                              ))
                                        ])),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              // Promo code  Field
                  
                              if (controller.selectPlan == 1 && controller.profileData!.userType != "User" && controller.isPromoCodevalid.value == false)
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: 10.h, 
                                    vertical: 10.h
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Employer promo code has expired. Enter new promo code:",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: Heading4Medium(color: ColorCode.red),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              if (controller.selectPlan == 1 && controller.profileData!.userType != "User" && controller.isPromoCodevalid.value == false)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: Form(
                                    child: TextFormField(
                                      style: TextFieldStyle(),
                                      controller: controller.promoCodeCtrl,
                                      autocorrect: true,
                                      keyboardType: TextInputType.name,
                                      onChanged: (val) {
                                        if (val.isNotEmpty) {
                                          controller.promoCodeInPlanSelect.value = true;
                                          controller.update();
                                        }
                                        else{
                                           controller.promoCodeInPlanSelect.value = false;
                                            controller.update();
                                        }
                                        //   controller.getVaildPromoCode();
                                        // } 
                                        // else {
                                        //    controller.getNotVaildPromoCode();
                                        // }
                                      },
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Enter Promo Code";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Promo Code",
                                        hintStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: ColorCode.ligthGray),
                                        focusedBorder: MainBorder(),
                                        border: MainBorder(),
                                        enabledBorder: MainBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                              // Spacer(),
                               SizedBox(height: 30.h,),
                              
                              SizedBox(
                                height: 20.h,
                              )
                            ]))),
                  ), 
                ),
                bottomNavigationBar: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.h,
                                  vertical: 20.h
                                ),
                                child: 
                                controller.selectPlan == 1 ? 
                                FillBtn(
                                  ontap: () {
                                    // Business plan with promo code rigth
                                    if(controller.selectPlan == 1 &&  controller.isPromoCodevalid.value == true){
                                      if(controller.profileData!.subscription != null){
                                      controller.planId =  controller.profileData!.subscription?.planId ?? 3;
                                      }
                                      else{
                                        controller.planId = 3;
                                      }
                                      controller.update();
                                       PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SelectPaymentMethod(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
                                      // controller.GetPlan(context, 3);
                                    }
                                    else{
                                      // 
                                    controller.updatePromoCodeApi(context);                                
                                    }
                                  },
                                  text: "Next", 
                                  Bgcolor: controller.selectPlan == 1 &&  controller.isPromoCodevalid.value == true ?  ColorCode.orange : controller.selectPlan == 1  &&  controller.promoCodeInPlanSelect.value ?  ColorCode.orange: ColorCode.ligthGray ,
                                ):
                                FillBtn(
                                  ontap: () {
                                     if(controller.profileData!.subscription != null){
                                      controller.planId =  controller.profileData!.subscription?.planId ?? 1;
                                      }
                                      else{
                                        controller.planId = 1;
                                      }
                                    //  controller.GetPlan(context, 1);  
                                      // controller.planId =  controller.profileData!.subscription!.planId ?? 1;                               
                                      controller.update();
                                       PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SelectLocation(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
                                  },
                                  text: "Next",
                                  Bgcolor:controller.selectPlan == -1 ? ColorCode.ligthGray : ColorCode.orange,
                                ),
                              ),); });
  }
}
/*
 ListView(
          //             shrinkWrap: true,
          //             children: 
          //               List.generate(2, (index) => Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //             child:  Container(
          // height: Get.height / 9,
          // decoration:  BoxDecoration(
          //             // color: ColorCode.orange,
          //             border:Border.all(
          //               color: ColorCode.orange,
          //               width: 2
          //             ),
          //              borderRadius: BorderRadius.only(
          //               bottomRight: Radius.circular(24)
          //              )
          //           ),
          // child:  Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
              
          //     Expanded(
          //       flex: 1,
          //       child:  Container(
                  
          //         color: controller.selectPlan == index ?  ColorCode.orange : Colors.transparent,
          //         child: Column(children: [
          //           Checkbox(
          //                 value: controller.selectPlan == index ? true : false,
          //                 onChanged: (newValue) {
          //                   controller.selectPlan =  index;
          //                   controller.update();
          //                   // controller.setVehicle(index);                           
          //                 },
          //                 ),
          //         ],),
          //       ),),
          //       Expanded(
          //         flex: 4,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //               Text("Business", style: Heading3(),),
          //               Text("Business", style: Heading3(),)
          //           ],
          //                         ),
          //         ))
                            
          //         ])  ),
          //               ))
          //             ,
          //           )
 */

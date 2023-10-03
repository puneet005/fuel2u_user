import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/confirm_order.dart';
import 'package:fuel2u_user/view/order/edit_order.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../routes/app_pages.dart';

class ReviewOrder extends GetView {
  const ReviewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GetBuilder<OrderController>(
                init: OrderController(),
                initState: (_) {},
                builder: (_) {
                  return Container(
                    // height: Get.height,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 10.h),
                          child: ListView(children: [
                            ImageLogoWithRigthIcon(
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
                                  "Review Your Order",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                               padding: EdgeInsets.symmetric(horizontal: 5.h),
                              child: Container(
                                        decoration:  BoxDecoration(
                                                    // color: ColorCode.orange,
                                                    border:Border.all(
                                                      color: ColorCode.orange,
                                                      width: 2
                                                    ),
                                                     borderRadius: BorderRadius.only(
                                                      bottomRight: Radius.circular(24)
                                                     )
                                                  ),
                                        child:  Padding(
                                          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                          child: Column(
                                           
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                         PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: EditOrder(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                              // Get.toNamed(Routes.EDITORDER);
                                                    },  
                                                    child: Image.asset("assets/icons/edit_icon.png"),
                                                    // const Icon(Icons.edit_square, color: ColorCode.ligthGray,)
                                                    )
                                                ],
                                              ),
                                                SizedBox(height: 0.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Order Number: XXXXXX", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Order Date: YYYY-MM-DD", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Status: Out for Delivery", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                              Row(
                                                children: [
                                                  // SizedBox(width: 10,),
                                                   Image.asset("assets/images/car_img.png", height: 50.h, width: 50.h, fit:BoxFit.contain,)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Vehicle Name: Mary’s Car", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Fuel Type: Octane 87", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Cost per Gallon: \$X.XX", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Location: Address ", style: Heading5(),)
                                                ],
                                              ),
                                              SizedBox(height: 5.h,),
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Delivery Instructions: Parked near...", style: Heading5(),)
                                                ],
                                              ),
                                    
                                              Padding(
                                          padding:  EdgeInsets.symmetric(
                                            vertical: 10.r, 
                                            horizontal: 0.r
                                          ),
                                          child: Row(
                                            
                                          children: [
                                            SvgPicture.asset("assets/icons/location_icon.svg",height: 25.h,  color: ColorCode.orange),
                                            SizedBox(width: 10.h,),
                                            Text("Use Your Current Location", style: HeadingCustomFamliy(
                        family: "RobotoRegular",
                        color: ColorCode.orange,
                        size: 16.sp,
                        fbold: FontWeight.w700,
                        // decoration: TextDecoration.underline

                      ),)
                                          ],
                                          ),
                                        ),
                                              
                                          
                                        
                                        
                                        
                                            ],
                                          ),
                                        ),
                                      ),
                            ),
                          
                            // Spacer(),
                            SizedBox(height: 20.h,),
                                                                  
                          ])));
                })),
              bottomNavigationBar: Container(
                height: Get.height/5.4,
                child: 
                Column(
                  children: [
                     Padding(
                               padding: EdgeInsets.symmetric(horizontal: 5.h),
                               child: FillBtn(
                                           // Bgcolor:  controller.selectdata.isNotEmpty ?  ColorCode.orange : ColorCode.ligthGray,
                                ontap: () {
                                    PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: ComfirmOrder(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                                      // Get.toNamed(Routes.CONFIRMORDER);
                                      },
                                            text: "CONFIRM ORDER"),
                             ),
                            SizedBox(height: 10.h,),
                            Padding(
                               padding: EdgeInsets.symmetric(horizontal: 5.h),
                              child: BorderBtn(ontap: (){
                            
                              }, text: "CANCEL ORDER"),
                            )  
                  ],
                ),
              ),
                );
  }
}


  // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //         // color: ColorCode.orange,
                            //         border: Border.all(
                            //             color: ColorCode.orange, width: 2),
                            //         borderRadius: BorderRadius.only(
                            //             bottomRight: Radius.circular(24))),
                            //     child: Padding(
                            //       padding: EdgeInsets.all(6.0.h),
                            //       child: Column(
                            //         children: [
                            //           const Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.end,
                            //             children: [
                            //               Icon(
                            //                 Icons.edit_square,
                            //                 color: ColorCode.ligthGray,
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Order Number: XXXXXX",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Order Date: YYYY-MM-DD",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Status: Out for Delivery",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             children: [
                            //               SizedBox(
                            //                 width: 10,
                            //               ),
                            //               Image.asset(
                            //                 "assets/images/car_img.png",
                            //                 height: 50.h,
                            //                 width: 50.h,
                            //                 fit: BoxFit.contain,
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Vehicle Name: Mary’s Car",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Fuel Type: Octane 87 ",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Cost per Gallon: \$X.XX ",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Location: Address",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 5.h,
                            //           ),
                            //           Row(
                            //             // mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 "Delivery Instructions: Parked near…",
                            //                 style: Heading5(),
                            //               )
                            //             ],
                            //           ),
                            //           Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 vertical: 10.r, horizontal: 6.r),
                            //             child: Row(
                            //               children: [
                            //                 SvgPicture.asset(
                            //                     "assets/icons/location_icon.svg",
                            //                     height: 20.h,
                            //                     color: ColorCode.orange),
                            //                 SizedBox(
                            //                   width: 10.h,
                            //                 ),
                            //                 Text(
                            //                   "Use Current Location",
                            //                   style: Heading3(
                            //                       color: ColorCode.orange),
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //           // Spacer(),
                            //           SizedBox(
                            //             height: 30.h,
                            //           ),
                                     
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
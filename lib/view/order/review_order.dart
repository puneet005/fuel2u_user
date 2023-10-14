import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
// import 'package:fuel2u_user/view/order/confirm_order.dart';
import 'package:fuel2u_user/view/order/edit_order.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import '../../routes/app_pages.dart';

class ReviewOrder extends GetView<OrderController>{
  const ReviewOrder({super.key});

  @override
  Widget build(BuildContext context) {
     OrderController controller = Get.find<OrderController>();
    return Scaffold(
        body: SafeArea(
            child: GetBuilder(
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
                                           crossAxisAlignment: CrossAxisAlignment.start,
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
                                              //  Row(
                                              //   // mainAxisAlignment: MainAxisAlignment.end,
                                              //   children: [
                                              //     Text("Order Number: XXXXXX", style: Heading5(),)
                                              //   ],
                                              // ),
                                                // SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Order Date: ${controller.selectdata['date']}", style: Heading5(),)
                                                ],
                                              ),
                                                // SizedBox(height: 5.h,),
                                              //  Row(
                                              //   // mainAxisAlignment: MainAxisAlignment.end,
                                              //   children: [
                                              //     Text("Status: Review Order", style: Heading5(),)
                                              //   ],
                                              // ),
                                                SizedBox(height: 5.h,),
                                              Row(
                                                children: [
                                                  // SizedBox(width: 10,),
                                                controller.vehicleList! == null ? Image.asset(
                                                                            "assets/images/car_img.png",
                                                                             height:
                                                                                35.h,
                                                                            width:
                                                                                70.h,):
                                                 controller.vehicleList![controller.selectVehicleIndex].image == null ||    controller.vehicleList![controller.selectVehicleIndex].image ==
                                                                          ""
                                                                        ? Image.asset(
                                                                            "assets/images/car_img.png",
                                                                              height:
                                                                                35.h,
                                                                            width:
                                                                                70.h,)
                                                                        : Image
                                                                            .network(
                                                                            ApiUrls.domain +
                                                                                controller.vehicleList![controller.selectVehicleIndex].image.toString(),
                                                                            height:
                                                                                35.h,
                                                                            width:
                                                                                70.h,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                  //  Image.asset("assets/images/car_img.png", height: 50.h, width: 50.h, fit:BoxFit.contain,)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                    SizedBox(
                                      height: 15,
                                      width: Get.width -80,
                                      child: Text(
                                        "Vehicle Name: ${controller.vehicleList![controller.selectVehicleIndex].name ?? ""}",
                                        style: Heading5(
                                          
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                                  // Text("Vehicle Name: ${controller.vehicleList![controller.selectVehicleIndex].name ?? ""}", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Fuel Type: ${controller.fuelTypeList![controller.selectFuelType].type ?? ""}", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("Cost per Gallon: \$${controller.fuelTypeList![controller.selectFuelType].price ?? ""}", style: Heading5(),)
                                                ],
                                              ),
                                                SizedBox(height: 5.h,),
                                                if(controller.planId != 3)
                                               Container(                                            
                                                 child: Text("Location: ${controller.selectLocation!.address ?? ""}", 
                                                  overflow: TextOverflow.ellipsis, 
                                                maxLines: 1,
                                                 style: Heading5(),),
                                               ),
                                                  if(controller.planId != 3)
                                              SizedBox(height: 5.h,),
                                              Container(
                                                height: 20.h,
                                                child: Text("Delivery Instructions: ${controller.commentCtrl.text ?? ""}",
                                                overflow: TextOverflow.ellipsis, 
                                                maxLines: 1,
                                                style: Heading5(),),
                                              ),
                                    
                      //                         Padding(
                      //                     padding:  EdgeInsets.symmetric(
                      //                       vertical: 10.r, 
                      //                       horizontal: 0.r
                      //                     ),
                      //                     child: Row(
                                            
                      //                     children: [
                      //                       SvgPicture.asset("assets/icons/location_icon.svg",height: 25.h,  color: ColorCode.orange),
                      //                       SizedBox(width: 10.h,),
                      //                       Text("Use Your Current Location", style: HeadingCustomFamliy(
                      //   family: "RobotoRegular",
                      //   color: ColorCode.orange,
                      //   size: 16.sp,
                      //   fbold: FontWeight.w700,
                      //   // decoration: TextDecoration.underline

                      // ),)
                      //                     ],
                      //                     ),
                      //                   ),
                                              
                                          
                                        
                                        
                                        
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
                                    

                                      controller.CreateOrderApi(context);
                                      // Get.toNamed(Routes.CONFIRMORDER);
                                      },
                                            text: "CONFIRM ORDER"),
                             ),
                            SizedBox(height: 10.h,),
                            Padding(
                               padding: EdgeInsets.symmetric(horizontal: 5.h),
                              child: BorderBtn(ontap: (){
                                 showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title:  Text("Cancel Order", style: Heading1(),),
                content:  Text("Are your sure to cancel your order", style: Heading3Regular(),),
                actions: <Widget>[
                   ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
               
                onPressed: 
                
                () {
                  Navigator.of(ctx).pop(); 
                },             // function used to perform after pressing the button
                child: Text('NO'),
              ),
              ElevatedButton(
                // textColor: Colors.black,
                onPressed: ()
                async{
                   Navigator.of(ctx).pop(); 
                   controller.cleanAllData();
                   Get.offAllNamed(Routes.HOME);
                  // logOutcontroller.SignOutApi(context);
              

                },
                child: Text('YES')
              ),
                  
                ],
              ),
            );    
                            
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
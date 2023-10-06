import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';

import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/rateing_view.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';

import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import '../../routes/app_pages.dart';

class OrderReviewStatus extends GetView<OrderController> {
  const OrderReviewStatus({super.key});
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
                            decoration: BoxDecoration(
                                // color: ColorCode.orange,
                                border: Border.all(
                                    color: ColorCode.orange, width: 2),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(24))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Order Number: ${controller.orderDetailsData!.orderNumber}",
                                        style: Heading5(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Order Date: ${controller.orderDetailsData!.date}",
                                        style: Heading5(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Status: ${controller.orderDetailsData!.status}",
                                        style: Heading5(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      // SizedBox(width: 10,),
                                      controller.orderDetailsData!.vehicle!
                                                  .image == "" ||  controller.orderDetailsData!.vehicle!
                                                  .image == null
                                          ? Image.asset(
                                              "assets/images/car_img.png")
                                          : Image.network(
                                              ApiUrls.domain +
                                                  controller.orderDetailsData!
                                                      .vehicle!.image
                                                      .toString(),
                                              height: 35.h,
                                              width: 70.h,
                                              fit: BoxFit.fill,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Vehicle Name: ${controller.orderDetailsData!.vehicle!.name ?? ""}",
                                        style: Heading5(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Fuel Type: ${controller.orderDetailsData!.fuelType!.type}",
                                        style: Heading5(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Cost per Gallon: \$${controller.orderDetailsData!.fuelType!.price}",
                                        style: Heading5(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    child: Text(
                                      "Location: ${controller.orderDetailsData!.location!.address}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Heading5(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  if(controller.orderDetailsData!.instructions == null)
                                  Container(
                                    height: 20.h,
                                    child: Text(
                                      "Delivery Instructions: ${controller.orderDetailsData!.instructions ?? " "}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Heading5(),
                                    ),
                                  ),
                                  // Cancel Reason
                                  
                                   if(controller.orderDetailsData?.status ==  "Cancelled")
                                   SizedBox(
                                    height: 2.h,
                                  ),
                                   if(controller.orderDetailsData?.status ==  "Cancelled")
                               Container(
                                    height: 20.h,
                                    child: Text(
                                      "Reason: ${controller.orderDetailsData!.reason != null ? controller.orderDetailsData!.reason  :""}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Heading5(),
                                    ),
                                  ),

                                  // 
                                  // Text("${controller.orderDetailsData?.driver}"),
                                  if(controller.orderDetailsData?.driver !=  null)
                                   controller.orderDetailsData!.driver!.averageRating! > 0 ? SizedBox(
                                    height: 5.h,
                                  ):SizedBox(height: 0,),
                                   if(controller.orderDetailsData?.driver != null)
                                controller.orderDetailsData!.driver!.averageRating! > 0 ?    Row(
                                    children: List.generate(5, (index) => 
                                      Icon(index < controller.orderDetailsData!.driver!.averageRating!   ? Icons.star : Icons.star_border,
                              size: 20,
                              color: ColorCode.orange )),                                  
                                  ): SizedBox(height: 0,),
                            
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Spacer(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ])));
            }),
      ),
      // if()
      bottomNavigationBar: controller.orderDetailsData!.status == "Completed"  &&
      controller.orderDetailsData!.driver!.averageRating == 0
          
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
              child: FillBtn(
                  ontap: () {
                    controller.rateStar.value = 0;
                    controller.commentCtrl.clear();
                    controller.submitRateing.value = false;
                    controller.commentCtrl.clear();
                    controller.update();
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: DriveRating(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  text: "Rate This Order"),
            )
          : SizedBox(),
    );
  }
}

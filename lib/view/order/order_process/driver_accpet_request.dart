
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';

class DriverAccpetRequest extends GetView<OrderController> {
  const DriverAccpetRequest({super.key});
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
                           Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Order Confirmation",
              style: Heading1(color: ColorCode.darkGray),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Order number ${controller.orderDetailsData!.orderNumber ?? ""} has been scheduled for \n ${controller.orderDetailsData!.deliveryDate}",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Heading1(color: ColorCode.orange),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                child: 
                controller.orderDetailsData!.driver != "" ? controller.orderDetailsData!.driver!.image != "" ? Image.network(
                    "${ApiUrls.domain}${controller.orderDetailsData!.driver!.image}",
                     loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  },
                )  : Image.asset("assets/images/driver_img.png") :
                Image.asset("assets/images/driver_img.png"),
              )
            ],
          ),
        ),


                          SizedBox(
                            height: 20.h,
                          ),
                        ])));
              })),
     
    );
  }
}


 DriverDetails(BuildContext context) {
     OrderController controller = Get.find<OrderController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageLogoWithRigthIcon(
              icon: InkWell(
                 onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
            child: Image.asset(
              "assets/icons/mytruck.png",
              width: 50,
            ),
          )),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Order Confirmation",
              style: Heading1(color: ColorCode.darkGray),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Order number ${controller.orderCreatingData!.orderNumber} has been scheduled for \n ${controller.orderCreatingData!.deliveryDate}",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Heading1(color: ColorCode.orange),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                child: Image.asset("assets/images/driver_img.png"),
              )
            ],
          ),
        ),
        Spacer(),
      
      
      ],
    );
  }
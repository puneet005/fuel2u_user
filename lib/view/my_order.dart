import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/model/order_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/edit_order/edit_order.dart';
import 'package:fuel2u_user/view/order/add_live_location.dart';
// import 'package:fuel2u_user/view/order/edit_order.dart';
import 'package:fuel2u_user/view/order/new_order.dart';
import 'package:fuel2u_user/view/order/order_history.dart';

import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/loading_widget.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyOrder extends GetView<OrderController> {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.find<OrderController>();
    Future.delayed(Duration.zero, (){
      // controller.orderList = [];
      // controller.orderList!.clear();
      controller.update();
    });
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OrderController>(
            init: OrderController(),
            initState: (_) {},
            builder: (_) {
              return RefreshIndicator(
                            onRefresh: () async{
                              controller.getOrder();
                            },


                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                    child: ListView(
                      children: [
                        ImageLogoWithRigthIcon(
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
                              "My Orders",
                              style: Heading1(color: ColorCode.darkGray),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 15.r),
                              child: InkWell(
                                onTap: () =>
                                    PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: OrderHistory(),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                ),
                                child: Text(
                                  "View Order History",
                                  style: HeadingCustomFamliy(
                                      family: "RobotoRegular",
                                      color: ColorCode.orange,
                                      size: 12.sp,
                                      fbold: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
              
                        Container(
                            // height: Get.height * 0.49,
                            child: controller.orderLoading.value
                                ? ListView(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: List.generate(
                                        5, (index) => ShimmerLoading()))
                                : OrderList(context, controller.orderList ?? [])
                            //  controller.emptyOrder.value
                            //     ? EmptyOrder()
                            //     : OrderList(context)
                            // color: ,
                            ),
                        // Spacer(),
                      ],
                    ),  
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
        child: FillBtn(
          ontap: () {
            controller. selectVehicleIndex = -1;
            controller.update();
            controller.cleanAllData();
            controller.GetVehicleList();
            Future.delayed(Duration.zero, ()
            {
PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: NewOrder(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
            });
            
            // Get.toNamed(Routes.NEWORDER);
          },
          text: 'START NEW ORDER',
        ),
      ),
    );
  }

  EmptyOrder() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "You don’t have any orders yet. Get started by clicking on the button below.",
          textAlign: TextAlign.center,
          style: HeadingCustom(
              color: ColorCode.orange, size: 22, fbold: FontWeight.bold),
        ),
      ),
    );
  }

  OrderList(BuildContext context, List<OrderListModelData> orderList) {
    return orderList == null || orderList.isEmpty
        ? EmptyOrder()
        : ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
                orderList.length,
                (index) => 
                Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.h),
                      child: GestureDetector(
                        onTap: (){
                           controller.GetSingleOrderDetailsApi(context, orderList[index].id.toString());
                        },
                            // MangerScreenBaseOnStatus(context, orderList[index]),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: ColorCode.orange,
                              border:
                                  Border.all(color: ColorCode.orange, width: 2),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(24))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 15.h),
                            child: Column(
                              children: [
                                if(orderList[index].status == "Received" 
                                || orderList[index].status == "In Progress"
                                ||orderList[index].status == "Pre-Auth Successful" 
                                || orderList[index].status == "Out for Delivery"
                                || orderList[index].status == "Confirmed"

                                 )
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                      if(orderList[index].status == "Received" || 
                                      orderList[index].status == "In Progress" ||
                                      orderList[index].status == "Pre-Auth Successful" 
                                ||  orderList[index].status == "Out for Delivery" 
                                || orderList[index].status == "Confirmed")
                                      //  || orderList[index].status == ""
                                         controller.GetEditOrderDetailsApi(context,orderList[index].id.toString() ).then((value) {
                                        // Future.delayed(Duration.zero,  () => Navigator.of(context).pop());
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: OrderEditAfterCreate(),
                                          withNavBar:
                                              true, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                         });
                                        
                                        // Get.toNamed(Routes.EDITORDER);
                                      },
                                      child: Image.asset(
                                        "assets/icons/edit_icon.png",
                                        height: 30.h,
                                      ),
                                      // const Icon(Icons.edit_square, color: ColorCode.ligthGray,)
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Order Number: ${orderList[index].orderNumber}",
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
                                      "Order Date: ${orderList[index].date}",
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
                                      "Status: ${orderList[index].status}",
                                      style: Heading5(),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                if(orderList[index].vehicle != null)
                                Row(
                                  children: [
                                    // SizedBox(width: 10,),
                                    orderList[index].vehicle!.image != null
                                        ? Image.network(
                                            "${ApiUrls.domain}${orderList[index].vehicle!.image!}",
                                            height: 50.h,
                                            width: 80.h,
                                            fit: BoxFit.fill,
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
                                          )
                                        : Image.asset(
                                            "assets/images/car_img.png",
                                            height: 50.h,
                                            width: 50.h,
                                            fit: BoxFit.contain,
                                          )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                if(orderList[index].vehicle != null)
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      width: Get.width -80,
                                      child: Text(
                                        "Vehicle Name: ${orderList[index].vehicle!.name ?? ""}",
                                        style: Heading5(
                                          
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Text(
                                    //   "Vehicle Name: ${orderList[index].vehicle!.name ?? ""}",
                                    //   style: Heading5(),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Fuel Type: ${orderList[index].fuelType!.type}",
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
                                      "Cost per Gallon: \$${orderList[index].fuelType!.price}",
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
                                     SizedBox(
                                      height: 15,
                                      width: Get.width -80,
                                      child: Text(
                                        "Location : ${orderList[index].location!.address}",
                                        style: Heading5(
                                        
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Text(
                                    //   "Location: ${orderList[index].location!.address}",
                                    //   style: Heading5(),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                if(orderList[index].business != null && (orderList[index].business!.deliveryInstructions!= null))
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: Get.width -80,
                                      child: Text(
                                        "Delivery Instructions: ${orderList[index].business!.deliveryInstructions ?? ""}",
                                        style: Heading5(
                                          
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                // if(orderList[index].status == "Received" || orderList[index].status == "In Progress")
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 0.r),
                                  child: GestureDetector(
                                    onTap: (){
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen:AddLiveLocationonOrder(id: orderList[index].id.toString()),
                                          withNavBar:
                                              true, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icons/location_icon.svg",
                                            height: 25.h,
                                            color: ColorCode.orange),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("Use Your Current Location",
                                            style: HeadingRobotoBold(
                                                fbold: FontWeight.w500,
                                                color: ColorCode.orange)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          );
  }
// MangerScreenBaseOnStatus(BuildContext context, OrderListModelData data) {
//     OrderController controller = Get.find<OrderController>();
//     controller.orderDetailsData = data;
//     if (data.status == "Out for Delivery") {
//       controller.update();
//       PersistentNavBarNavigator.pushNewScreen(
//         context,
//         screen: SingleOrderViewMap(),
//         withNavBar: true, // OPTIONAL VALUE. True by default.
//         pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
//     } else if (data.status == "Pre-Auth Request")
//       PersistentNavBarNavigator.pushNewScreen(
//         context,
//         screen: DriverAccpetRequest(),
//         withNavBar: true, // OPTIONAL VALUE. True by default.
//         pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
//     else {
//       PersistentNavBarNavigator.pushNewScreen(
//         context,
//         screen: 
//         // DriverAccpetRequest(),
//         OrderReviewStatus(),
//         withNavBar: true, // OPTIONAL VALUE. True by default.
//         pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
//     }
//   }
}

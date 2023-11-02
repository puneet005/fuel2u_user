import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/model/order_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/edit_order/edit_order.dart';
import 'package:fuel2u_user/view/order/new_order.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../widgets/logo_rigth_icon.dart';

class OrderHistory extends GetView<OrderController>{
  const OrderHistory({super.key});
   @override
  Widget build(BuildContext context) {
     OrderController controller = Get.find<OrderController>(); 
    Future.delayed(Duration.zero,(){
      controller.orderHistory();
    });
    return Scaffold(
      body: SafeArea(
        child:GetBuilder(
      init: OrderController(),
      initState: (_) {},
      builder: (_) {
            return Container(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 10.h
                ),
                child: ListView(
                  shrinkWrap: true,
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
                         onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
                      child: Image.asset("assets/icons/mytruck.png", width: 50,),
                    )),
                    SizedBox(height: 40.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Order History", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                  ),
                 SizedBox(height: 20.h,),
                 controller.orderHistoryLoading.value ? 
                 Center(
                                  child: CircularProgressIndicator(
                                    color: ColorCode.orange,
                                  ),
                                )
                //  ListView(
                //             shrinkWrap: true,
                //             physics: const NeverScrollableScrollPhysics(),
                //             children: List.generate(5, (index) => ShimmerLoading())
                //           )
                          : 
                          controller.orderHistoryList!.isEmpty ?EmptyOrder():
                           OrderList(
                            controller.orderHistoryList!,
                            context
                          )
                    // controller.emptyOrder.value ? EmptyOrder():OrderList()                              
                  ],
                ),
              ),
            );
          }
        ),
      ),
      bottomNavigationBar:  
        Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
                    child: FillBtn(ontap: () {
                       PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: NewOrder(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
                      // PersistentNavBarNavigator
                      //                                   .pushNewScreen(
                      //                                 context,
                      //                                 screen: NewOrder(),
                      //                                 withNavBar:
                      //                                 true, // OPTIONAL VALUE. True by default.
                      //                                 pageTransitionAnimation:
                      //                                 PageTransitionAnimation
                      //                                     .cupertino,
                      //                               );
                      // Get.toNamed(Routes.NEWORDER);
                      }, text: 'START NEW ORDER',),
                  ),
        
    );
  }

  EmptyOrder(){
    return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("You don’t have any orders yet. Get started by clicking on the button below.",
                    textAlign: TextAlign.center,
                     style: HeadingCustom(
                      color: ColorCode.orange,
                      size: 22,
                      fbold: FontWeight.bold
                     ),),
                  ),
                );
  }
  
  OrderList(List<OrderListModelData> orderList, BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(orderList.length, (index) => 
      Padding(
        padding: const EdgeInsets.all(8.0),
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
            padding:  EdgeInsets.symmetric(
              vertical: 10.h, horizontal: 12.h
            ),
            child: Column(             
              children: [
              const  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Icon(Icons.edit_square, color: ColorCode.ligthGray,)
                  ],
                ),
                  SizedBox(height: 5.h,),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Order Number: ${orderList[index].orderNumber!.toString()}", style: Heading5(),),
                    Spacer(),
                    if(orderList[index].status == "Received" || orderList[index].status == "In Progress" ||orderList[index].status == "Pre-Auth Successful" 
                                || orderList[index].status == "Out for Delivery"
                                || orderList[index].status == "Confirmed"
                                )
                     InkWell(
                                      onTap: () {
                                      if(orderList[index].status == "Received" || orderList[index].status == "In Progress" ||
                                      orderList[index].status == "Pre-Auth Successful" 
                                      || orderList[index].status == "Out for Delivery"
                                || orderList[index].status == "Confirmed"
                                       )
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
                                      },child: Image.asset("assets/icons/edit_icon.png")),
                  ],
                ),
                  SizedBox(height: 5.h,),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Order Date: ${orderList[index].date!.toString()}", style: Heading5(),)
                  ],
                ),
                  SizedBox(height: 5.h,),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Status: ${orderList[index].status!.toString()}", style: Heading5(),)
                  ],
                ),
                SizedBox(height: 8.h,),
               Row(children: [
                 InkWell(
                   onTap: () => controller.GetSingleOrderDetailsApi(context, orderList[index].id.toString()),
                      // onTap: () => Get.toNamed(Routes.ORDERHISTORY),
                      child: Text("View details",
                      style: HeadingCustomFamliy(
                        family: "RobotaRegular",
                        color: ColorCode.orange,
                        size: 13.sp,
                        decoration: TextDecoration.underline,
                        fbold: FontWeight.w500
                      )),
                    )
               ],)

                    
              ],
            ),
          ),
        ),
      )),
    );
  }

}

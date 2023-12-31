import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/edit_order.dart';
import 'package:fuel2u_user/view/order/new_order.dart';
import 'package:fuel2u_user/view/order/order_history.dart';
import 'package:fuel2u_user/view/order/single_order_in_map.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class MyOrder extends GetView<OrderController>{
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    
     OrderController controller = Get.find<OrderController>(); 
    return Scaffold(
      body: SafeArea(
        child:GetBuilder<OrderController>(
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
                  children: [
                    ImageLogoWithRigthIcon(icon: InkWell(
                      onTap: ()=> Get.toNamed(Routes.ALLTRUCKINMAP),
                      child: Image.asset("assets/icons/mytruck.png", width: 50,),
                    )),
                    SizedBox(height: 40.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("My Orders", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                      child: InkWell(
                        onTap: () =>   PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: OrderHistory(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    ),
                                                    
                        // Get.toNamed(Routes.ORDERHISTORY),
                        child: Text("View Order History",
                        style: HeadingCustomFamliy(
                          family: "RobotoRegular",
                          color: ColorCode.orange,
                          size: 12.sp,
                          fbold: FontWeight.w500,
                          decoration: TextDecoration.underline
                  
                        ),),
                      )
                    ),
                  ),
                  SizedBox(height: 5.h,),

                  Container(
                    // height: Get.height * 0.49,
                    child: controller.emptyOrder.value ? EmptyOrder():OrderList(context)
                    // color: ,
                  ),
                  // Spacer(),
                 



                  ],
                ),
              ),
            );
          }
        ),
      ),
      bottomNavigationBar:  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.h),
                    child: FillBtn(ontap: () {
                      PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: NewOrder(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
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
  
  OrderList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(5, (index) => 
      Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 10.h
        ),
        child: GestureDetector(
          onTap: () {
             PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: SingleOrderViewMap(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
          
          // Get.toNamed(Routes.SINGLEORDERINMAP);
          },
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
                        child: Image.asset("assets/icons/edit_icon.png", height: 30.h,),
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
                      Text("Vehicle Name: ", style: Heading5(),)
                    ],
                  ),
                    SizedBox(height: 5.h,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Fuel Type:", style: Heading5(),)
                    ],
                  ),
                    SizedBox(height: 5.h,),
                   Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Cost per Gallon:", style: Heading5(),)
                    ],
                  ),
                    SizedBox(height: 5.h,),
                   Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Location: ", style: Heading5(),)
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Delivery Instructions:", style: Heading5(),)
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
                Text("Use Your Current Location", style: HeadingRobotoBold(
                  fbold: FontWeight.w500,
                  color: ColorCode.orange
                  
                ))
              ],
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

}
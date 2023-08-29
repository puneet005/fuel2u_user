import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:get/get.dart';

import '../../widgets/logo_rigth_icon.dart';

class OrderHistory extends GetView<OrderController>{
  const OrderHistory({super.key});
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
                  // Container(
                    // height: Get.height/2,
                    // child: 
                    controller.emptyOrder.value ? EmptyOrder():OrderList()
                    // color: ,
                  // ),
                  // Spacer(),
                 



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
  
  OrderList() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(5, (index) => 
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
                    Text("Order Number: XXXXXX", style: Heading5(),),

                    Spacer(),
                    Image.asset("assets/icons/edit_icon.png"),

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
                SizedBox(height: 8.h,),
               Row(children: [
                 InkWell(
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/ges_cap_open_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../controller/order_controller.dart';

class ComfirmOrder extends GetView<OrderController> {
  const ComfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OrderController>(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
              return SizedBox(
                  height: Get.height,
                  child:!controller.confirmNextBth.value ? ConfrimScreen() : DriverDetails(context)
                  ,
        ); 
          },
        ),
      ),
    );
  }
  
  ConfrimScreen() {
    return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageLogoWithRigthIcon(
                            icon: InkWell(
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
              SizedBox(height: 20.h,),
            Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "You’re order has been received.\nYour order number is XXXXXX",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Heading2(color: ColorCode.orange),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Your Driver will notify you with \nyour delivery confirmation",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Heading2(color: ColorCode.orange),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
             
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 15.h
                ),
                child: FillBtn(ontap: (){
                controller.confirmNextBth.value = true;
                controller.update();
                }, text: "NEXT"),
              ),
              SizedBox(height: 20.h,),
             
              



              
            ],
          );
  }
  
  DriverDetails(BuildContext context) {
    return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageLogoWithRigthIcon(
                            icon: InkWell(
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
              SizedBox(height: 20.h,),
            Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Order number <XXXXXX> has been scheduled for \n YYYY-MM-DD",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: Heading1(color: ColorCode.orange),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   CircleAvatar(
                    radius: 70,
                    child:Image.asset("assets/images/driver_img.png"),
                   )
                  ],
                ),
              ),
              Spacer(),
              
              FillBtn(ontap: (){
                 PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: GasCapOpen(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                // Get.toNamed(Routes.GASCAPOPEN);
              }, text: "VIEW ORDER DETAILS"),

              SizedBox(height: 20.h,),



              
            ],
          );
  }
}

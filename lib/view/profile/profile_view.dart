import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/controller/premiun_controller.dart';
import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/profile/business_details.dart';
import 'package:fuel2u_user/view/profile/membership.dart';
import 'package:fuel2u_user/view/profile/payment_details.dart';
import 'package:fuel2u_user/view/profile/personal_details.dart';
import 'package:fuel2u_user/view/profile/support.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../widgets/dialog_box_ui.dart';

class ProfileView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
      Future.delayed(Duration.zero, (){
     controller.ProfileApi(context).then((value){
        
     });
   });
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: RefreshIndicator(
                          onRefresh: () async{
                                 controller.ProfileApi(context);
                              },
              child: SingleChildScrollView(
                child: GetBuilder(
                    init: OrderController(),
                    initState: (_) {},
                    builder: (_) {
                      return  Container(
                          height: Get.height/1.12,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.h, vertical: 10.h),
                              child: Column(children: [
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
                                      "My Account Settings",
                                      style: Heading1(color: ColorCode.darkGray),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Container(
                                  height: 60.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 0.h),
                                    child: Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: PersonalDetails(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation.cupertino,
                                          );
                                          // Get.toNamed(Routes.PERSONALDETAILS);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Personal Details",
                                              style: Heading1(),
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/rightarrow.svg",
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        color: ColorCode.ligthGray,
                                      )
                                    ]),
                                  ),
                                ),
                                // Business Details
                                if(controller.profileData != null && (controller.profileData?.userType == "Employer" || controller.profileData!.userType == " Employer"))
                                Container(
                                  height: 60.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 0.h),
                                    child: Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: BusinessDetails(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Business Details",
                                              style: Heading1(),
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/rightarrow.svg",
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        color: ColorCode.ligthGray,
                                      )
                                    ]),
                                  ),
                                ),
                                // Payment Methods
                                Container(
                                  height: 60.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 0.h),
                                    child: Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          //  Get.toNamed(Routes.PAYMENTDETAILS);
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: PaymentDetails(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Payment Methods",
                                              style: Heading1(),
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/rightarrow.svg",
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        color: ColorCode.ligthGray,
                                      )
                                    ]),
                                  ),
                                ),
                                // Membership
                                Container(
                                  height: 60.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 0.h),
                                    child: Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          //  Get.toNamed(Routes.MEMBERSHIP);
                                           PremiunController pController = Get.find<PremiunController>();
                                          if(controller.profileData != null){
                                          if(controller.profileData!.subscription != null){    
                                            log( "${pController.selectPlan.value} = ${controller.profileData!.subscription!.planId!.toInt()}");
                                              pController.selectPlan.value = controller.profileData!.subscription!.planId!.toInt()-1;
                                              pController.update();   
                                               log( "${pController.selectPlan.value}"); 
                                               if(controller.profileData!.userType == "Employer"){
                                                  pController.promocodeShow.value = false;
                                                  
                                               }                                
                                              // pController.viewPlan(controller.profileData!.subscription!.planId!.toInt());                                      
                                            }
                                          }
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Membership(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Membership",
                                              style: Heading1(),
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/rightarrow.svg",
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        color: ColorCode.ligthGray,
                                      )
                                    ]),
                                  ),
                                ),
                                // support
                                Container(
                                  height: 60.h,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 0.h),
                                    child: Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(Routes.SUPPORT);
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Support(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Support",
                                              style: Heading1(),
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/rightarrow.svg",
                                              height: 20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        color: ColorCode.ligthGray,
                                      )
                                    ]),
                                  ),
                                ),
                                Spacer(),
                          
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.h,
                                  ),
                                  child: FillBtn(
                                      ontap: () {
                                      
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text(
                                              "Log Out",
                                              style: Heading1(),
                                            ),
                                            content: Text(
                                              "Are your sure to logout your account ?",
                                              style: Heading3Regular(),
                                            ),
                                            actions: <Widget>[
                                             Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                               Expanded(
                                                flex: 2,
                                                 child: ElevatedButton(
                                                  // FlatButton widget is used to make a text to work like a button
                                               
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  }, // function used to perform after pressing the button
                                                  child: Text('CANCEL'),
                                                                                         ),
                                               ),
                                               SizedBox(width: 20.h,),
                                            Expanded(
                                                flex: 2,
                                                child: ElevatedButton(
                                                    // textColor: Colors.black,
                                                    onPressed: () async {
                                                         SignUpController logOutcontroller =
                                            Get.find<SignUpController>();
                                                      Navigator.of(ctx).pop();
                                                      logOutcontroller.SignOutApi(
                                                          context);
                                                    },
                                                    child: Text('LOGOUT')),
                                              ),
                                             ],)
                                            ],
                                          ),
                                        );
                                       
                                      },
                                      text: "Log out"),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ])));
                    }),
              ),
            )));
  }
}

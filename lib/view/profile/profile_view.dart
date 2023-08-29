import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
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
class ProfileView extends GetView<OrderController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
      body: SafeArea(
        child:GetBuilder(
      init: OrderController(),
      initState: (_) {},
      builder: (_) {
            return Container(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 10.h
                ),
                child: Column(
                  children: [
                    ImageLogoWithRigthIcon(icon: InkWell(
                      onTap: ()=> Get.toNamed(Routes.ALLTRUCKINMAP),
                      child: Image.asset("assets/icons/mytruck.png", width: 50,),
                    )),
                    SizedBox(height: 40.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("My Account Settings", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                  ),
                  SizedBox(height: 40.h,),
                  Container(
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.h ),
                        child: Column(                          
                          children: [
                         GestureDetector(
                           onTap: () {
                            PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: PersonalDetails(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                            // Get.toNamed(Routes.PERSONALDETAILS);
                           },
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text("Personal Details", style: Heading1(),),
                            
                            SvgPicture.asset("assets/icons/rightarrow.svg", height: 20.h,),
                           ],),
                         ),
                         SizedBox(height: 10.h,),
                         Divider(
                          color: ColorCode.ligthGray,
                         )
                        ]),
                      )
                      ,
                    ),
                    // Business Details
                     Container(
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.h ),
                        child: Column(                          
                          children: [
                         GestureDetector(
                           onTap: () {
                             PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: BusinessDetails(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                            // Get.toNamed(Routes.BUSINESSDETAILS);
                            
                           },
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text("Business Details", style:Heading1(),),
                            
                            SvgPicture.asset("assets/icons/rightarrow.svg", height: 20.h,),
                           ],),
                         ),
                         SizedBox(height: 10.h,),
                         Divider(
                          color: ColorCode.ligthGray,
                         )
                        ]),
                      )
                      ,
                    ),
                    // Payment Methods 
                    Container(
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.h ),
                        child: Column(                          
                          children: [
                         GestureDetector(
                           onTap: () {
                            //  Get.toNamed(Routes.PAYMENTDETAILS);
                              PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: PaymentDetails(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                           },
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text("Payment Methods", style: Heading1(),),
                            
                            SvgPicture.asset("assets/icons/rightarrow.svg",  height: 20.h,),
                           ],),
                         ),
                         SizedBox(height: 10.h,),
                         Divider(
                          color: ColorCode.ligthGray,
                         )
                        ]),
                      )
                      ,
                    ),
  // Membership
                     Container(
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.h ),
                        child: Column(                          
                          children: [
                         GestureDetector(
                           onTap: () {
                            //  Get.toNamed(Routes.MEMBERSHIP);
                             PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: Membership(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                           },
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text("Membership", style: Heading1(),),
                            
                            SvgPicture.asset("assets/icons/rightarrow.svg",  height: 20.h,),
                           ],),
                         ),
                         SizedBox(height: 10.h,),
                         Divider(
                          color: ColorCode.ligthGray,
                         )
                        ]),
                      )
                      ,
                    ),
                  // support
                   Container(
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.h ),
                        child: Column(                          
                          children: [
                         GestureDetector(
                           onTap: () {
                            // Get.toNamed(Routes.SUPPORT);      
                            PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: Support(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );                   
                           },
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text("Support", style: Heading1(),),
                            
                            SvgPicture.asset("assets/icons/rightarrow.svg", height: 20.h,),
                           ],),
                         ),
                         SizedBox(height: 10.h,),
                         Divider(
                          color: ColorCode.ligthGray,
                         )
                        ]),
                      )
                      ,
                    ),
                    Spacer(),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.h, ),
                      child: FillBtn(ontap: (){
                        Get.offAndToNamed(Routes.WELCOME);
                      }, text: "Log out"),
                    ),
                    SizedBox(height: 10.h,)
                  ])));})));
  }

}


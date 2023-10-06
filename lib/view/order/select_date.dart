

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
// import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/additional_comments.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SelectDate extends GetView<OrderController>{
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.find<OrderController>();
    Future.delayed(Duration.zero,(){
      controller.selectdata.clear();      
      if(!controller.isEdit.value){
        log(controller.profileData!.userType!.toString());
        log("${controller.profileData!.userType} == Family User");
       if(controller.profileData!.userType == "User" || controller.profileData!.userType == "Family User"){
          log("if part");
          controller.mainDate();
      }
      else{
         log("else part");         
          log(controller.profileData!.deliveryDay.toString());  
          if(controller.planId == 3){
          controller.BusinessDate(controller.profileData!.deliveryDay);
          }
          else{
            controller.mainDate();
          }
       
      }    
      }
    });
     return Scaffold(
        body: SafeArea(
        child:GetBuilder(
      init: OrderController(),
      initState: (_) {},
      builder: (_) {
           return Container(
             child: RefreshIndicator(
               onRefresh: () async{
                 if(!controller.isEdit.value){
                controller.ProfileApi(context).then((val){
        log(controller.profileData!.userType!.toString());
        log("${controller.profileData!.userType} == Family User");
       if(controller.profileData!.userType == "User" || controller.profileData!.userType == "Family User"){
          log("if part");
          controller.mainDate();
      }
      else{
         log("else part");         
          log(controller.profileData!.deliveryDay.toString());  
          if(controller.planId == 3){
          controller.BusinessDate(controller.profileData!.deliveryDay);
          }
          else{
              controller.mainDate();
          }
       
      }   
      });
                 }
      

              },
               child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 10.h
                  ),
                  child: Column(
                    children: [
                      ImageLogoWithRigthIcon(
                        back: InkWell(
                          onTap: (){
                             controller.isEdit.value = false;
                                                            controller.update();
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
                        Text("Select Delivery Date", style: Heading1(
                          color: ColorCode.darkGray
                        ),)
                      ],
                      ),
                      SizedBox(height: 30.h,),
                      Expanded(
                        // flex: 2,
                        child:  Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 30.h
                          ),
                          child:
                          controller.dateListofdays.isEmpty ? Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text("Not Date Found!!", style: Heading3Medium(
                                    color: ColorCode.orange
                                  ),),
                                  
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: 20.h
                                  ),
                                  child: FillBtn(ontap: () {
                                     if(!controller.isEdit.value){
                controller.ProfileApi(context).then((val){
        log(controller.profileData!.userType!.toString());
        log("${controller.profileData!.userType} == Family User");
       if(controller.profileData!.userType == "User" || controller.profileData!.userType == "Family User"){
          log("if part");
          controller.mainDate();
      }
      else{
         log("else part");         
          log(controller.profileData!.deliveryDay.toString());  
          if(controller.planId == 3){
          controller.BusinessDate(controller.profileData!.deliveryDay);
          }
          else{
              controller.mainDate();
          }
       
      }   
      });
                 }
                                  }, text: "Refresh Dates"),
                                )
                              ],
                            ),
                          ) :  GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: controller.dateListofdays.length,
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 77),
                                            itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              controller.selectdata = controller.dateListofdays[index];
                              controller.update();
                            },
                            child: Container(
                              width: Get.width/4,
                              height: Get.height/7,
                               decoration:   BoxDecoration(   
                              color: controller.selectdata == controller.dateListofdays[index] ? ColorCode.orange : Colors.transparent,                       
                            border: Border.all(
                              color: ColorCode.orange,
                              width: 2
                            ),
                             borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24)
                         )
                                        ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(controller.dateListofdays[index]['day'].toString(),
                                  style: HeadingCustomFamliy(
                                    family:"RobotoRegular",
                                    size: 12.sp,
                                    color : controller.selectdata == controller.dateListofdays[index] ? ColorCode.white :  ColorCode.black 
                                  )),
                                  SizedBox(height: 10.h,),
                                  Text(controller.dateListofdays[index]['shortData'].toString(), style: Heading4Medium(
                                    color : controller.selectdata == controller.dateListofdays[index]? ColorCode.white :  ColorCode.black 
                                  ),),
                                  
                              ]),
                            ),
                          );
                                            }),
                        )
                    ),
                    SizedBox(height: 30.h,),                    
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 5.h
                  ),
                  child: FillBtn(
                    Bgcolor:  controller.selectdata.isNotEmpty ?  ColorCode.orange : ColorCode.ligthGray,
                    ontap: (){
                      if(controller.isEdit.value){
                          controller.isEdit.value = false;
                                                            controller.update();
                                                            Navigator.of(context).pop();
                      }
                      else{
                      if(controller.selectdata.isNotEmpty){
                          PersistentNavBarNavigator.pushNewScreen(
                                                        context,
                                                        screen: AdditionalComments(),
                                                        withNavBar:
                                                        true, // OPTIONAL VALUE. True by default.
                                                        pageTransitionAnimation:
                                                        PageTransitionAnimation
                                                            .cupertino,
                                                      );
                      
                      } 
                      }                
                    }, text: "Next"),
                ),
                SizedBox(height: 10.h,),                 
                    ])),
             ),
           );}))
                  );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/select_payment_method.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../controller/order_controller.dart';

class SelectLocation extends GetView<OrderController>{
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
      return Scaffold(
        body: SafeArea(
        child:GetBuilder<OrderController>(
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
                    ImageLogoWithRigthIcon(
                      back: InkWell(
                        onTap: (){
                          // Get.back();
                          Navigator.of(context).pop();
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
                      Text("Select Location", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 10.r, 
              horizontal: 10.r
            ),
            child: Row(              
            children: [
              SvgPicture.asset("assets/icons/location_icon.svg",height: 30.h,  color: ColorCode.orange),
              SizedBox(width: 10.h,),
              Text("Use Your Current Location", 
              style: HeadingRobotoBold(color: ColorCode.orange, fbold: FontWeight.w500),)
            ],
            ),
          ),
           SizedBox(height: 10.h,),
                    Expanded(child: 
                    ListView(
                      shrinkWrap: true,
                      children: List.generate(controller.addressType.length, (index) => 
                       Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 10.h
                          ),
                      child:  Container(
          height: Get.height / 10,
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
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Expanded(
                flex: 1,
                child:  Container(
                  
                  color: controller.selectAddress == index ?  ColorCode.orange : Colors.transparent,
                  child: Column(children: [
                    Checkbox(
                      activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                       shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(3)         
                      ),
                          value: controller.selectAddress == index ? true : false,
                          onChanged: (newValue) {
                            controller.selectAddress =  index;
                            controller.update();
                            // controller.setVehicle(index);                           
                          },
                          ),
                  ],),
                ),),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.addressType[index], style: Heading4Medium(),),
                            Image.asset("assets/icons/edit_icon.png"),
                            // Icon(Icons.edit_square, color: Colors.grey[400],)
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Text("Address", style: Heading5(fbold:  FontWeight.normal),)
                    ],
                                  ),
                  ))
                            
                  ])  ),
                        ),
                      ),
                    )
                    ),
                      Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                // vertical: 0.h
              ),
                        child: FillBtn(
                        Bgcolor:  controller.selectAddress == -1 ?  ColorCode.ligthGray :ColorCode.orange ,
                        ontap: () {
                        if(controller.selectVehicle != -1 ){
                            PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: SelectPaymentMethod(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
               
                        // Get.toNamed(Routes.SELECTPAYMETHOD);

                        }
                                          
                        }, text: 'Next',),
                      ) ,
                    SizedBox(height: 10.h, ),
                    Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                // vertical: 0.h
              ),
                      child: BorderBtn(ontap: () {
                      
                        }, text: '+ ADD A LOCATION',),
                    )   

                  ])));})
                  )

    );
  }
  
}
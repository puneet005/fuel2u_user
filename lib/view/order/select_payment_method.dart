import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
// import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/select_date.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SelectPaymentMethod extends GetView<OrderController>{
  const SelectPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Text("Select Payment Method", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                    ),
                    SizedBox(height: 30.h,),
                    // Payment Option Ui 
                     Padding(
                          padding: const EdgeInsets.all(8.0),
                      child:  Container(
          height: Get.height / 9,
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
                  
                  color: controller.selectPaymentMethod == 1 ?  ColorCode.orange : Colors.transparent,
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
                          value: controller.selectPaymentMethod == 1 ? true : false,
                          onChanged: (newValue) {
                            controller.selectPaymentMethod = 1;
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
                            Text("Credit/Debit Card", style: Heading4Medium(),),
                            Image.asset("assets/icons/edit_icon.png"),
                            // Icon(Icons.edit_square, color: Colors.grey[400],)
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Text("Card ending in XXXX", style: Heading5(fbold:  FontWeight.normal),)
                    ],
                                  ),
                  ))
                            
                  ])  ),
                        ),
                  Spacer(),
                  Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.h,
                // vertical: 0.h
              ),
                    child: FillBtn(
                      Bgcolor:  controller.selectPaymentMethod == -1 ?  ColorCode.ligthGray :ColorCode.orange ,
                      ontap: () {
                      if(controller.selectPaymentMethod != -1 ){
                      // Get.toNamed(Routes.SELECTDATE);
                       PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: SelectDate(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                      }
                    //  Get.toNamed(Routes.SELECTDATE);
                      }, text: 'Next',),
                  ) ,
                  SizedBox(height: 10.h, ),
                  Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.h,
                // vertical: 0.h
              ),
                    child: BorderBtn(ontap: () {
                     
                      }, text: '+ ADD A PAYMENT METHOD',),
                  )   ,SizedBox(height: 10.h, ),

                ])));}))


                );
 
  }

}
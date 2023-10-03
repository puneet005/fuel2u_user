import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class   EditLoaction extends GetView<VehicleController>{
  @override
  Widget build(BuildContext context) {
    VehicleController controller = Get.find<VehicleController>(); 
   
    Future.delayed(Duration.zero, () async {
  controller.editLoactionUpdate();
});
  return GetBuilder(
      init: VehicleController(),
      // initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30.h,),
                    ImageLogoWithRigthIcon(
                            back: InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                                // Get.back(); 
                              },
                            child: SvgPicture.asset("assets/icons/backarrow.svg", width: 30,),
                          ),
                            icon: InkWell(
                              onTap: () => Get.offNamed(Routes.ALLTRUCKINMAP),
                            child: Image.asset("assets/icons/mytruck.png", width: 50,),
                      )),
                      SizedBox(height: 20.h,),
                SizedBox(
                  height: 40.h,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Edit Location",
                      style: Heading1(color: ColorCode.darkGray),
                    )
                  ],
                ),
               

                 SizedBox(
                  height: 20.h,
                ),
                
                 Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 10.h, 
              horizontal: 10.h
            ),
            child: Row(  
              mainAxisAlignment: MainAxisAlignment.center,            
            children: [
              SvgPicture.asset("assets/icons/location_icon.svg",height: 30.h,  color: ColorCode.orange),
              SizedBox(width: 10.h,),
              Text("Use Your Current Location", style: HeadingRobotoBold(color: ColorCode.orange, size: 16.sp),)
            ],
            ),
          ),

                 SizedBox(
                  height: 5.h,
                ),

                // Add Home Name
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.homename,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    // validator: (val) {},
                    decoration: InputDecoration(
                      hintText: "Name (optional), ie Home",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.bold
                  ),
                      focusedBorder: MainBorder(),
                      border: MainBorder(),
                      enabledBorder: MainBorder(),
                    ),
                  ),
                ),
                // Add Street Address
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.streetAddressCtrl,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    onChanged: (val){
                      controller.addressFormCheck();

                    },
                    // validator: (val) {},
                    decoration: InputDecoration(
                      hintText: "Street Address",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.bold
                  ),
                      focusedBorder: MainBorder(),
                      border: MainBorder(),
                      enabledBorder: MainBorder(),
                    ),
                  ),
                ),
                // Add City
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.cityCtrl,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    // validator: (val) {},
                     onChanged: (val){
                      controller.addressFormCheck();

                    },
                    decoration: InputDecoration(
                      hintText: "City",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.bold
                  ),
                      focusedBorder: MainBorder(),
                      border: MainBorder(),
                      enabledBorder: MainBorder(),
                    ),
                  ),
                ),
                // Add State
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.stateCtrl,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    // validator: (val) {},
                     onChanged: (val){
                      controller.addressFormCheck();

                    },
                    decoration: InputDecoration(
                      hintText: "State",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.bold
                  ),
                      focusedBorder: MainBorder(),
                      border: MainBorder(),
                      enabledBorder: MainBorder(),
                    ),
                  ),
                ),
                 // Add Zip Code
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.zipCodeCtrl,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    // validator: (val) {},
                     onChanged: (val){
                      controller.addressFormCheck();

                    },
                    decoration: InputDecoration(
                      hintText: "Zip Code",
                       hintStyle: TextStyle(
                    color: ColorCode.ligthGray,
                    fontWeight: FontWeight.bold
                  ),
                      focusedBorder: MainBorder(),
                      border: MainBorder(),
                      enabledBorder: MainBorder(),
                    ),
                  ),
                ),
 SizedBox(height: 20.h,),
                 Padding(
                   padding:  EdgeInsets.symmetric(
                    horizontal: 15.h,
                   ),
                   child: FillBtn(ontap: (){}, text: "SAVE CHANGES",  Bgcolor:  controller.addressFormValid.value ? ColorCode.orange : ColorCode.ligthGray, ),
                 ),
                 SizedBox(height: 10.h,),
                 Padding(
                    padding:  EdgeInsets.symmetric(
                    horizontal: 15.h,
                   ),
                   child: BorderBtn(ontap: (){}, text:"DELETE LOCATION" ),
                 ),
                 SizedBox(height: 20.h,)
              ])))),
              
              );
              
      },
    );
  }
}
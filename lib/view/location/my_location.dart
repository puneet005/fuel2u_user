import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/location/add_location.dart';
import 'package:fuel2u_user/view/location/edit_location.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyLocation extends GetView<VehicleController>{
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body: SafeArea(
        child:GetBuilder<VehicleController>(
      init: VehicleController(),
      initState: (_) {},
      builder: (_) {
            return  Container(
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
                      Text("My Locations", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  //  EmptyUi()
                  controller.emptyVehicleList.value ? EmptyUi() : LocationList(context)
                  ])));}),
                  
                  ),
                  bottomNavigationBar: Container(
                    height: 70.h,
                    child: Column(                      
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.h
                          ),
                          child: FillBtn(ontap: (){
                              PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: AddLocation(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                            // Get.toNamed(Routes.ADDLOCATION);
                            
                          }, text: "+ ADD A LOCATION"),
                        )
                      ]),
                  ),
            );   
  }
  
 Container EmptyUi(){
    return Container(
      height: Get.height/2.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 20.h
            ),
            child: Text("2U Fuel requires a location that allows you to be parked during business hours (8-5).", style: HeadingCustomFamliy(
              family: "RobotoRegular",
              size: 16.sp,
              fbold: FontWeight.normal),
            textAlign: TextAlign.center,
            ),
          ),
          // Spacer(),\
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.h),
            child: Center(
              
              child: Text("You don’t have any locations saved. Add one by clicking on the button below.", 
              textAlign: TextAlign.center,
              style: Heading1(
          
                color: ColorCode.orange
              ),),
            ),
          ),
           Spacer(),
        ],
      ),
    );
  }

  LocationList(BuildContext context){
       VehicleController controller = Get.put(VehicleController());
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(controller.vehicleList.length, (index) {
        return  Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 15.h
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 10.h
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.addressType[index], style: Heading4Medium(),),
                            InkWell(
                              onTap: (){
                                 PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: EditLoaction(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                                                                                    // Get.toNamed(Routes.EDITLOCATION);
                              },
                               child: Image.asset("assets/icons/edit_icon.png"),
                              // child: 
                              // Icon(Icons.edit_square, color: Colors.grey[400],)
                              )
                          ],
                        ),
                        Text("Address", style: Heading5(fbold:  FontWeight.normal),)
                    ],
                                  ),
                  ))
                            
                  ])  ));
                        
      }));

  }


}
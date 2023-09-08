  import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/bottom_bar_controller.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/model/state_list_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  void initState() {
    super.initState();
       VehicleController controller = Get.find<VehicleController>(); 
     controller.GetStateList();
    controller.getCurrentPosition();
  }
   VehicleController controller = Get.find<VehicleController>(); 
     
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return GetBuilder<VehicleController>(
      init: VehicleController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                
                ),
                child: controller.isLoading.value ? SizedBox(
                  height: Get.height,
                  child: Center(
                    child:  CircularProgressIndicator(),
                  )
                       
                  
                ):Column(
                  children: [
                    SizedBox(height: 20.h,),
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
                      "Add a Location",
                      style: Heading1(color: ColorCode.darkGray),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2U Fuel requires a location that allows you to be parked during business hours (8-5).", style: HeadingSub2(),
                          textAlign: TextAlign.center,
                          ),
                ),

                 SizedBox(
                  height: 5.h,
                ),
                
                 Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 10.h, 
              horizontal: 10.h
            ),
            child: GestureDetector(
              onTap: (){
                controller.getAddressFromLatLng(controller.currentPosition!);
              },
              child: controller.usecurrentLoading.value ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator()
                ],
              ): Row(              
              children: [
                SvgPicture.asset("assets/icons/location_icon.svg",height: 30.h,  color: ColorCode.orange),
                SizedBox(width: 10.h,),
                Text("Use Your Current Location", style: HeadingRobotoBold(color: ColorCode.orange, size: 16),)
              ],
              ),
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
                  child: 
                  DropdownButtonFormField<StateListModelData>( 
                                padding: EdgeInsets.zero,
                                                      
                                                onChanged: (newValue){
                                              
                                                controller.stateCodeValue = newValue;
                                                controller.update();

                                                  controller.addressFormCheck();
                                               
                                                // controller.selectedIndex = newValue.toString(); 
                                                // log(newValue.toString());
                                                controller.update();     
                                                //  controller.checkFormValied();                                           
                                                },
                                                  validator: (value) {                                                     
                                                    if(value == null){                                                    
                                                        return  'Please Select State';
                                                    }
                                                    else{
                                                      //  controller.stateAndZipCodeHeight = 55;
                                                    // controller.update();
                                                        return  null;
                                                    } },
                                                value: controller.stateCodeValue ??  null,
                                                hint: Text("State",  style: TextStyle(
                                        fontSize: 16.sp,                                        
                                        fontWeight: FontWeight.bold,
                                        color: ColorCode.ligthGray),),
                                                isExpanded: true,
                                                items:controller.stateList!.isNotEmpty ? [
                            for(var value in controller.stateList! )
                              DropdownMenuItem(
                                  child: new Text(
                                    value.name!,
                                    style: TextStyle(
                                      color: ColorCode.darkGray,
                                       fontSize: 16.sp,
                                    ),
                                  ),
                              value: value,
                              ),
                                                ]: [],
                                                decoration:   InputDecoration(
                            fillColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      color: ColorCode.red
                                    ),
                                        border:MainBorder(),
                                         enabledBorder: MainBorder(),
                                      ),              
                                              ),    
                  // TextFormField(
                  //   style: TextFieldStyle(),
                  //   controller: controller.stateCtrl,
                  //   autocorrect: true,
                  //   keyboardType: TextInputType.name,
                  //   // validator: (val) {},
                  //    onChanged: (val){
                  //     controller.addressFormCheck();

                  //   },
                  //   decoration:  InputDecoration(
                  //     hintText: "State",
                  //      hintStyle: TextStyle(
                  //   color: ColorCode.ligthGray,
                  //   fontWeight: FontWeight.bold
                  // ),
                  //     focusedBorder: MainBorder(),
                  //     border: MainBorder(),
                  //     enabledBorder: MainBorder(),
                  //   ),
                  // ),
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
              ])))),
              bottomNavigationBar: Container(
                height: 90.h,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                  child: Column(
                    children: [
                      Padding(
                         padding:  EdgeInsets.symmetric(
                    horizontal: 10.h,
                   ),
                        child: FillBtn(ontap: () async{
                          if(controller.addressFormValid.value) {
                           bool res = await controller.AddLocationApi(context);
                            if(res){
                              Navigator.pop(context);
                            }

                            // Get.toNamed(Routes.HOME);
                            // Get.find<BottomBarController>().onItemTapped(1);
                          }                        
                        }, text: "Save",  Bgcolor:  controller.addressFormValid.value ? ColorCode.orange : ColorCode.ligthGray, ),
                      ),
                      SizedBox(height: 30.h,)
                
                    ],
                
                  ),
                ),
              ),
              );
              
      },
    );
  }
}


// class AddLocation extends GetView<VehicleController>{
//   @override
 

//   }

// }
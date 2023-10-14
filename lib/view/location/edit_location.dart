import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/main.dart';
import 'package:fuel2u_user/model/location_list_model.dart';
import 'package:fuel2u_user/model/state_list_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';

class EditLocation extends StatefulWidget {
  LocationListModelData locationDetails;
  EditLocation({super.key, required this.locationDetails});

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  VehicleController controller = Get.find<VehicleController>();
  @override
  void initState() {
    super.initState();
    // VehicleController controller = Get.find<VehicleController>();
    controller.cleanAllData();
    controller.EditStateList(widget.locationDetails);
    controller.getCurrentPosition(false);
    // controller.setEditData(widget.locationDetails);
  }

  @override
  Widget build(BuildContext context) {
//     Future.delayed(Duration.zero, () async {
//   controller.editLoactionUpdate();
// });
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
                      child: controller.isLoading.value
                          ? SizedBox(
                              height: Get.height,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))
                          : Column(children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              ImageLogoWithRigthIcon(
                                  back: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      // Get.back();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/backarrow.svg",
                                      width: 30,
                                    ),
                                  ),
                                  icon: InkWell(
                                    onTap: () =>
                                        Get.toNamed(Routes.ALLTRUCKINMAP),
                                    child: Image.asset(
                                      "assets/icons/mytruck.png",
                                      width: 50,
                                    ),
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.h),
                                child: controller.usecurrentLoading.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [CircularProgressIndicator()],
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          // controller.getAddressFromLatLng(
                                          //     controller.currentPosition!);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/location_icon.svg",
                                                height: 30.h,
                                                color: ColorCode.orange),
                                            SizedBox(
                                              width: 10.h,
                                            ),
                                            Text(
                                              "Use Your Current Location",
                                              style: HeadingRobotoBold(
                                                  color: ColorCode.orange,
                                                  size: 16.sp),
                                            )
                                          ],
                                        ),
                                      ),
                              ),

                              SizedBox(
                                height: 5.h,
                              ),

                              // Add Home Name
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 15.r),
                                child: TextFormField(
                                  style: TextFieldStyle(),
                                  controller: controller.homename,
                                  autocorrect: true,
                                  keyboardType: TextInputType.name,
                                  // validator: (val) {},
                                  maxLength: 27,
                                  decoration: InputDecoration(
                                     counterText: "",
                                    hintText: "Name (optional), ie Home",
                                    hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.bold),
                                    focusedBorder: MainBorder(),
                                    border: MainBorder(),
                                    enabledBorder: MainBorder(),
                                  ),
                                ),
                              ),
                              // Add Street Address
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 15.r),
                                child: TextFormField(
                                  style: TextFieldStyle(),
                                  controller: controller.streetAddressCtrl,
                                  autocorrect: true,
                                  keyboardType: TextInputType.name,
                                  onChanged: (val) {
                                    controller.addressFormCheck();
                                  },
                                  // validator: (val) {},
                                  decoration: InputDecoration(
                                    hintText: "Street Address",
                                    hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.bold),
                                    focusedBorder: MainBorder(),
                                    border: MainBorder(),
                                    enabledBorder: MainBorder(),
                                  ),
                                   onTap: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>    PlacePicker(
                                apiKey: googleMKey,              
                                onPlacePicked: (result) { 
                                  print(result.adrAddress.toString()); 
                                  print(result.addressComponents!.toString()); 
                                  print(result.formattedAddress);                                
                                  var add =  result.formattedAddress!.split(",");
                                  print(add.length);
                                  controller.streetAddressCtrl.text  =  add.length >= 4 ? add[0] : add[0]+","+add[1];
                                  controller.cityCtrl.text = add[add.length - 3];                                                 
                                  controller.update();
                                  Navigator.of(context).pop();
                                },
                                initialPosition: LatLng(controller.currentPosition!.latitude, controller.currentPosition!.longitude),
                                useCurrentLocation: true,
                                resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
                              )));
                    },
                                ),
                                
                              ),
                              // Add City
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 15.r),
                                child: TextFormField(
                                  
                                  style: TextFieldStyle(),
                                  controller: controller.cityCtrl,
                                  autocorrect: true,
                                  keyboardType: TextInputType.name,
                                  maxLength: 25,
                                  // validator: (val) {},
                                  onChanged: (val) {
                                    controller.addressFormCheck();
                                  },
                                  decoration: InputDecoration(
                                     counterText: "",
                                    hintText: "City",
                                    hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.bold),
                                    focusedBorder: MainBorder(),
                                    border: MainBorder(),
                                    enabledBorder: MainBorder(),
                                  ),
                                ),
                              ),
                              // Add State
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 15.r),
                                child:
                                    DropdownButtonFormField<StateListModelData>(
                                  padding: EdgeInsets.zero,
                                  onChanged: (newValue) {
                                    controller.stateCodeValue = newValue;
                                    controller.update();
                                    controller.addressFormCheck();
                                    controller.update();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select State';
                                    } else {
                                      return null;
                                    }
                                  },
                                  value: controller.stateCodeValue ?? null,
                                  hint: Text(
                                    "State",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorCode.ligthGray),
                                  ),
                                  isExpanded: true,
                                  items: controller.stateList!.isNotEmpty
                                      ? [
                                          for (var value
                                              in controller.stateList!)
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
                                        ]
                                      : [],
                                  decoration: InputDecoration(
                                    fillColor: Colors.transparent,
                                    labelStyle: TextStyle(color: ColorCode.red),
                                    border: MainBorder(),
                                    enabledBorder: MainBorder(),
                                  ),
                                ),
                              ),
                              // Add Zip Code
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 15.r),
                                child: TextFormField(
                                  style: TextFieldStyle(),
                                  controller: controller.zipCodeCtrl,
                                  autocorrect: true,
                                  keyboardType: TextInputType.name,
                                  // validator: (val) {},
                                  onChanged: (val) {
                                    controller.addressFormCheck();
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Zip Code",
                                    hintStyle: TextStyle(
                                        color: ColorCode.ligthGray,
                                        fontWeight: FontWeight.bold),
                                    focusedBorder: MainBorder(),
                                    border: MainBorder(),
                                    enabledBorder: MainBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.h,
                                ),
                                child: FillBtn(
                                  ontap: () async {
                                    bool res = await controller.EditLocationApi(
                                        context, widget.locationDetails.id!);
                                    if (res) {
                                      controller.GetLocationListApi();
                                      Navigator.pop(context);
                                    }
                                  },
                                  text: "SAVE CHANGES",
                                  Bgcolor: controller.addressFormValid.value
                                      ? ColorCode.orange
                                      : ColorCode.ligthGray,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.h,
                                ),
                                child: BorderBtn(
                                    ontap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text(
                                            "Delete Location",
                                            style: Heading1(),
                                          ),
                                          content: Text(
                                            "Are you sure to Delete this Location",
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
                                                // textColor: Colors.black,
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
                                                  Navigator.of(ctx).pop();
                                                  bool res = await controller
                                                      .DeleteLocationApi(
                                                          context,
                                                          widget.locationDetails
                                                              .id!);
                                                  if (res) {
                                                    controller
                                                        .GetLocationListApi();
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                child: Text('CONFIRM'),
                                              ),
                                            ),
                                            ],
                                            )
                                          ],
                                        ),
                                      );
                                      // controller.();
                                    },
                                    text: "DELETE LOCATION"),
                              ),
                              SizedBox(
                                height: 20.h,
                              )
                            ])))),
        );
      },
    );
  }
}

// class   EditLoaction extends GetView<VehicleController>{
//   LocationListModelData locationDetails;
//   EditLoaction({

//   });
//   @override
//   Widget build(BuildContext context) {
//     VehicleController controller = Get.find<VehicleController>();

//     Future.delayed(Duration.zero, () async {
//   controller.editLoactionUpdate();
// });
//   return GetBuilder(
//       init: VehicleController(),
//       // initState: (_) {},
//       builder: (_) {
//         return Scaffold(
//           body: SafeArea(
//             child: SingleChildScrollView(

//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 10.h,

//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 30.h,),
//                     ImageLogoWithRigthIcon(
//                             back: InkWell(
//                               onTap: (){
//                                 Navigator.of(context).pop();
//                                 // Get.back();
//                               },
//                             child: SvgPicture.asset("assets/icons/backarrow.svg", width: 30,),
//                           ),
//                             icon: InkWell(
//                               onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
//                             child: Image.asset("assets/icons/mytruck.png", width: 50,),
//                       )),
//                       SizedBox(height: 20.h,),
//                 SizedBox(
//                   height: 40.h,
//                 ),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Edit Location",
//                       style: Heading1(color: ColorCode.darkGray),
//                     )
//                   ],
//                 ),

//                  SizedBox(
//                   height: 20.h,
//                 ),

//                  Padding(
//             padding:  EdgeInsets.symmetric(
//               vertical: 10.h,
//               horizontal: 10.h
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset("assets/icons/location_icon.svg",height: 30.h,  color: ColorCode.orange),
//               SizedBox(width: 10.h,),
//               Text("Use Your Current Location", style: HeadingRobotoBold(color: ColorCode.orange, size: 16.sp),)
//             ],
//             ),
//           ),

//                  SizedBox(
//                   height: 5.h,
//                 ),

//                 // Add Home Name
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: TextFormField(
//                     style: TextFieldStyle(),
//                     controller: controller.homename,
//                     autocorrect: true,
//                     keyboardType: TextInputType.name,
//                     // validator: (val) {},
//                     decoration: InputDecoration(
//                       hintText: "Name (optional), ie Home",
//                        hintStyle: TextStyle(
//                     color: ColorCode.ligthGray,
//                     fontWeight: FontWeight.bold
//                   ),
//                       focusedBorder: MainBorder(),
//                       border: MainBorder(),
//                       enabledBorder: MainBorder(),
//                     ),
//                   ),
//                 ),
//                 // Add Street Address
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: TextFormField(
//                     style: TextFieldStyle(),
//                     controller: controller.streetAddressCtrl,
//                     autocorrect: true,
//                     keyboardType: TextInputType.name,
//                     onChanged: (val){
//                       controller.addressFormCheck();

//                     },
//                     // validator: (val) {},
//                     decoration: InputDecoration(
//                       hintText: "Street Address",
//                        hintStyle: TextStyle(
//                     color: ColorCode.ligthGray,
//                     fontWeight: FontWeight.bold
//                   ),
//                       focusedBorder: MainBorder(),
//                       border: MainBorder(),
//                       enabledBorder: MainBorder(),
//                     ),
//                   ),
//                 ),
//                 // Add City
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: TextFormField(
//                     style: TextFieldStyle(),
//                     controller: controller.cityCtrl,
//                     autocorrect: true,
//                     keyboardType: TextInputType.name,
//                     // validator: (val) {},
//                      onChanged: (val){
//                       controller.addressFormCheck();

//                     },
//                     decoration: InputDecoration(
//                       hintText: "City",
//                        hintStyle: TextStyle(
//                     color: ColorCode.ligthGray,
//                     fontWeight: FontWeight.bold
//                   ),
//                       focusedBorder: MainBorder(),
//                       border: MainBorder(),
//                       enabledBorder: MainBorder(),
//                     ),
//                   ),
//                 ),
//                 // Add State
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: TextFormField(
//                     style: TextFieldStyle(),
//                     // controller: controller.stateCtrl,
//                     autocorrect: true,
//                     keyboardType: TextInputType.name,
//                     // validator: (val) {},
//                      onChanged: (val){
//                       controller.addressFormCheck();

//                     },
//                     decoration: InputDecoration(
//                       hintText: "State",
//                        hintStyle: TextStyle(
//                     color: ColorCode.ligthGray,
//                     fontWeight: FontWeight.bold
//                   ),
//                       focusedBorder: MainBorder(),
//                       border: MainBorder(),
//                       enabledBorder: MainBorder(),
//                     ),
//                   ),
//                 ),
//                  // Add Zip Code
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: TextFormField(
//                     style: TextFieldStyle(),
//                     controller: controller.zipCodeCtrl,
//                     autocorrect: true,
//                     keyboardType: TextInputType.name,
//                     // validator: (val) {},
//                      onChanged: (val){
//                       controller.addressFormCheck();

//                     },
//                     decoration: InputDecoration(
//                       hintText: "Zip Code",
//                        hintStyle: TextStyle(
//                     color: ColorCode.ligthGray,
//                     fontWeight: FontWeight.bold
//                   ),
//                       focusedBorder: MainBorder(),
//                       border: MainBorder(),
//                       enabledBorder: MainBorder(),
//                     ),
//                   ),
//                 ),
//  SizedBox(height: 20.h,),
//                  Padding(
//                    padding:  EdgeInsets.symmetric(
//                     horizontal: 15.h,
//                    ),
//                    child: FillBtn(ontap: (){}, text: "SAVE CHANGES",  Bgcolor:  controller.addressFormValid.value ? ColorCode.orange : ColorCode.ligthGray, ),
//                  ),
//                  SizedBox(height: 10.h,),
//                  Padding(
//                     padding:  EdgeInsets.symmetric(
//                     horizontal: 15.h,
//                    ),
//                    child: BorderBtn(ontap: (){}, text:"DELETE LOCATION" ),
//                  ),
//                  SizedBox(height: 20.h,)
//               ])))),

//               );

//       },
//     );
//   }
// }

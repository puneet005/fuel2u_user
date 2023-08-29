
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/controller/bottom_bar_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';


class EditVehicleDetails extends GetView<AddVehicleController> {
  const EditVehicleDetails({super.key});
  @override
  Widget build(BuildContext context) {
    AddVehicleController controller = Get.find<AddVehicleController>(); 
    controller.updateData();
    return Scaffold(
      body: GetBuilder<AddVehicleController>(
        init: AddVehicleController(),
        initState: (_) {},
        builder: (_) {
          return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h
                  ),
                  child: Column(
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
                            SizedBox(height: 40.h,),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      "Edit Vehicle",
                      style: Heading1(color: ColorCode.darkGray),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 150.h,
                  width: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: controller.imagePath == ""? AssetImage("assets/images/car_img.png") : FileImage(File(controller.imagePath)) as ImageProvider,
                    fit: BoxFit.cover
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap:(){
                          _addPictureSheet(context);
                        },
                        child: Image.asset("assets/icons/edit_icon.png"),
                        // child: Icon(
                          
                        //   Icons.edit_square,
                        //   size: 28,
                        //   color: ColorCode.white,
                        // ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                // Add Name
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                    child: TextFormField(
                      style: TextFieldStyle(),
                      controller: controller.nameCtrl,
                      autocorrect: true,
                      keyboardType: TextInputType.name,
                      // validator: (val) {},
                      decoration:  InputDecoration(
                        hintText: "Name (optional), ie Frank’s Car",
                        hintStyle: TextStyle(
                            color: ColorCode.ligthGray,
                            fontWeight: FontWeight.bold),
                        focusedBorder: MainBorder(),
                        border: MainBorder(),
                        enabledBorder: MainBorder(),
                      ),
                    ),
                  ),

                  // Brand Name DropDown
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                    child: DropdownButtonFormField(
                      // iconSize: ,
                      onChanged: (newValue) {
                        controller.selectedBrand.value = newValue!.toString();

                        // print(controller.selectedBrand.value=newValue!.toString());
                        controller.updateBrand(newValue.toString());
                        controller.checkAllFieldDone();
                      },
                      value: controller.selectedBrand.value == ""
                          ? null
                          : controller.selectedBrand.value,
                      hint: Text(
                        "Make",
                        style: HeadingCustom(
                            color: ColorCode.ligthGray, fbold: FontWeight.bold),
                      ),
                      isExpanded: true,
                      items: [
                        for (var value in controller.makeList)
                          DropdownMenuItem(
                            child: Text(
                              value,
                            ),
                            value: value.obs,
                          ),
                      ],
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        border: MainBorder(),
                        enabledBorder: MainBorder(),
                      ),
                    ),
                  ),
                  // Model Name DropDown
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                    child: DropdownButtonFormField(
                      // iconSize: ,
                      onChanged: (newValue) {
                        controller.selectedModel.value = newValue.toString();
                        controller.update();
                        controller.checkAllFieldDone();
                        // controller.selectedModel?.value=newValue!.toString();
                      },
                      value: controller.selectedModel.value == ""
                          ? null
                          : controller.selectedModel.value,
                      hint: Text(
                        "Model ",
                        style: HeadingCustom(
                            color: ColorCode.ligthGray, fbold: FontWeight.bold),
                      ),
                      isExpanded: true,
                      items: [
                        for (var value in controller.modelList)
                          DropdownMenuItem(
                            child: new Text(
                              value,
                            ),
                            value: value.obs,
                          ),
                      ],
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        border: MainBorder(),
                        enabledBorder: MainBorder(),
                      ),
                    ),
                  ),
                  // Color Name DropDown
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                    child: DropdownButtonFormField(
                      // iconSize: ,
                      onChanged: (newValue) {
                        controller.selectedColor.value = newValue.toString();
                        controller.update();
                        controller.checkAllFieldDone();
                      },
                      value: controller.selectedColor.value == ""
                          ? null
                          : controller.selectedColor.value,
                      hint: Text(
                        "Color ",
                        style: HeadingCustom(
                            color: ColorCode.ligthGray, fbold: FontWeight.bold),
                      ),
                      isExpanded: true,
                      items: [
                        for (var value in controller.colorList)
                          DropdownMenuItem(
                            child: new Text(
                              value,
                            ),
                            value: value.obs,
                          ),
                      ],
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        border: MainBorder(),
                        enabledBorder: MainBorder(),
                      ),
                    ),
                  ),
                  // License Plate Number and State
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TextFormField(
                              style: TextFieldStyle(),
                              controller: controller.licensePlateNoCtrl,
                              autocorrect: true,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                }
                                return "Enter Number";
                              },
                              onChanged: (val) {
                                controller.checkAllFieldDone();
                              },
                              decoration: InputDecoration(
                                hintText: "License Plate Number",
                                hintStyle: TextStyle(
                                    color: ColorCode.ligthGray,
                                    fontWeight: FontWeight.bold),
                                focusedBorder: MainBorder(),
                                border: MainBorder(),
                                enabledBorder: MainBorder(),
                              ),
                            )),
                        SizedBox(
                          width: 15.h,
                        ),
                        Expanded(
                          flex: 2,
                          // width: Get.width/2.5,
                          child: SizedBox(
                             height: 56.h,
                            child: DropdownButtonFormField(
                              // iconSize: ,
                              onChanged: (newValue) {
                                controller.selectedState.value =
                                    newValue.toString();
                                controller.update();
                                controller.checkAllFieldDone();
                          
                                // controller.selected.value=newValue!;
                              },
                              value: controller.selectedState.value == ""
                                  ? null
                                  : controller.selectedState.value,
                              hint: Text(
                                "State",
                                style: HeadingCustom(
                                    color: ColorCode.ligthGray,
                                    fbold: FontWeight.bold),
                              ),
                              isExpanded: true,
                              items: [
                                for (var value in controller.stateList)
                                  DropdownMenuItem(
                                    child: new Text(
                                      value,
                                    ),
                                    value: value.obs,
                                  ),
                              ],
                              decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                border: MainBorder(),
                                enabledBorder: MainBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                // upload Phote Code
               
                // Spacer(),
                SizedBox(
                    height: 30.h,
                  ),
                
               Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h
                  ),
                  child: FillBtn(ontap: (){
                      Get.toNamed(Routes.HOME);
                      Get.find<BottomBarController>().onItemTapped(1);            
                      }, text: "SAVE CHANGES"
                    ),
                ),
                  SizedBox(height: 10.h,),
               Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h
                  ),child: BorderBtn(ontap: (){

                  }, text: "DELETE VEHICLE")),

                  
                 
          
                  SizedBox(
                    height: 20.h,
                  ),
              ],
            ),
          ),
        ),
      ); 
        },
      )    ,
    );
  }

  void _addPictureSheet(BuildContext context) {
    AddVehicleController controller = Get.find<AddVehicleController>(); 
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Add Picture'),
        cancelButton:  CupertinoActionSheetAction(
          
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: HeadingCustom(color: Colors.blue),),
          ), 
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            
            onPressed: () {
              controller.AddVehicleImage(false);
              // Navigator.pop(context);
            },
            child: Text('Choose Form Gallery', style: HeadingCustom(color: Colors.blue),),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              controller.AddVehicleImage(true);
              // Navigator.pop(context);
            },
            child:  Text('Take a Picture', style: HeadingCustom(color: Colors.blue)),
          ),
          
         
        ],
        
      ),
    );
  }
}

// class ActionSheetExample extends StatelessWidget {
//   const ActionSheetExample({super.key});

//   // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('CupertinoActionSheet Sample'),
//       ),
//       child: Center(
//         child: CupertinoButton(
//           onPressed: () => _showActionSheet(context),
//           child: const Text('CupertinoActionSheet'),
//         ),
//       ),
//     );
//   }
// }


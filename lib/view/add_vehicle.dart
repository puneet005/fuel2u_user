import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

import '../utils/ui_hepler.dart';

class AddVehicle extends GetView<AddVehicleController> {
  const AddVehicle({super.key});
  @override
  Widget build(BuildContext context) {
    AddVehicleController controller = Get.find<AddVehicleController>();
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Column(
              children: [
                ImageLogo(),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add a Vehicle",
                      style: Heading1(color: ColorCode.darkGray),
                    )
                  ],
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
                         fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorCode.ligthGray),
                      focusedBorder:  MainBorder(),
                      border:  MainBorder(),
                      enabledBorder:  MainBorder(),
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
                        size: 16.sp,
                        color: ColorCode.ligthGray,
                        fbold: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    items: [
                      for (var value in controller.makeList)
                        DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(),
                          ),
                          value: value.obs,
                        ),
                    ],
                    decoration:  InputDecoration(
                      fillColor: Colors.transparent,
                      border: MainBorder(),
                      enabledBorder:  MainBorder(),
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
                        size: 16.sp,
                        color: ColorCode.ligthGray,
                        fbold: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    items: [
                      for (var value in controller.modelList)
                        DropdownMenuItem(
                          child: new Text(
                            value,
                            style: TextStyle(),
                          ),
                          value: value.obs,
                        ),
                    ],
                    decoration:  InputDecoration(
                      fillColor: Colors.transparent,
                      border: MainBorder(),
                      enabledBorder:  MainBorder(),
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
                        size: 16.sp,
                        color: ColorCode.ligthGray,
                        fbold: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    items: [
                      for (var value in controller.colorList)
                        DropdownMenuItem(
                          child: new Text(
                            value,
                            style: TextStyle(),
                          ),
                          value: value.obs,
                        ),
                    ],
                    decoration:  InputDecoration(
                      fillColor: Colors.transparent,
                      border: MainBorder(),
                      enabledBorder: MainBorder()
                    ),
                  ),
                ),
                // License Plate Number and State
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: Container(
                    height: 55.h,
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
                                   fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorCode.ligthGray),
                                focusedBorder:   MainBorder(),
                                border:   MainBorder(),
                                enabledBorder:   MainBorder(),
                              ),
                            )),
                        SizedBox(
                          width: 15.h,
                        ),
                        Expanded(
                          flex: 2,
                          // width: Get.width/2.5,
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
                                size: 16.sp,
                                color: ColorCode.ligthGray,
                                fbold: FontWeight.bold,
                              ),
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
                            decoration:  InputDecoration(
                              
                              fillColor: Colors.transparent,
                              border:  MainBorder(),
                              enabledBorder:  MainBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // upload Phote Code
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    child: InkWell(
                      onTap: () => _addPictureSheet(context),
                      child: Text(
                        "+ Upload a photo of your vehicle (optional)",
                        textAlign: TextAlign.center,
                        style: HeadingCustomFamliy(
                          family: "RobotoMedium",
                          
                          size: 16.sp,
                          color: ColorCode.orange,
                          decoration: TextDecoration.underline
                        )
                    )),),
                // Spacer(),
                SizedBox(
                  height: 30.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Obx(
                    () => !controller.allFiledTrue.value
                        ? FillBtn(
                            ontap: () {},
                            text: "+ ADD VEHICLE",
                            Bgcolor: ColorCode.ligthGray,
                          )
                        : FillBtn(
                            ontap: () {
                              Get.toNamed(Routes.HOME);
                            },
                            text: "+ ADD VEHICLE"),
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: BorderBtn(ontap: () {}, text: "SKIP FOR NOW"),
                ),

                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addPictureSheet(BuildContext context) {
    AddVehicleController controller = Get.find<AddVehicleController>();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Add Picture', style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: HeadingCustom(color: Colors.blue),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              controller.getImage(false);
              // Navigator.pop(context);
            },
            child: Text(
              'Choose Form Gallery',
              style: HeadingCustom(color: Colors.blue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              controller.getImage(true);
              // Navigator.pop(context);
            },
            child: Text('Take a Picture',
                style: HeadingCustom(color: Colors.blue)),
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

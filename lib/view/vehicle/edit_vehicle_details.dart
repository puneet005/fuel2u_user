

import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/controller/bottom_bar_controller.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/model/vehicle/car_model.dart';
import 'package:fuel2u_user/model/vehicle/color_model.dart';

import 'package:fuel2u_user/model/vehicle/make_model.dart';
import 'package:fuel2u_user/model/vehicle/vehicle_list_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';

class EditVehicleDetails extends StatefulWidget {
  VehicleListModelData data;
   EditVehicleDetails({super.key, required this.data});

  @override
  State<EditVehicleDetails> createState() => _EditVehicleDetailsState();
}

class _EditVehicleDetailsState extends State<EditVehicleDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    controller.updateVehicleApi(widget.data);
  }

      AddVehicleController controller = Get.find<AddVehicleController>(); 
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration)
   
   
//    if(controller.isLoading.value == false){
//     // controller.makeValue = widget.data.make;
//     // controller.update();
// log("hello");
//    }
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
                  child: controller.editLoading.value ? SizedBox(
                    height: Get.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
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
                  decoration: controller.imagePath == ""?  BoxDecoration(
                    image: DecorationImage(image:   widget.data.image != "" ? NetworkImage(ApiUrls.domain+widget.data.image.toString()) : AssetImage("assets/images/car_img.png") as ImageProvider,
                    fit: BoxFit.cover
                    )) : BoxDecoration(
                    image: DecorationImage(image:   FileImage(File(controller.imagePath)) as ImageProvider,
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
                  Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: DropdownButtonFormField<MakeModelData>(                                 
                    onChanged: (newValue) {                            
                      controller.makeValue= newValue;
                      controller.update();                                         
                      controller.carModelValue  = null;                     
                      controller.checkAllFieldDone();
                      controller.ModelApi();                     
                    },                    
                    value: controller.makeValue ?? null,                  
                    hint: Text(
                      "Make",
                      style: HeadingCustom(
                        size: 16.sp,
                        color: ColorCode.ligthGray,
                        fbold: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    items: controller.makeList == null ? [] :[
                      for (var value in controller.makeList ?? [])
                        DropdownMenuItem(
                          child: Text(
                            value.name!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: ColorCode.darkGray,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          value: value,
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
                  child: controller.loadingmodel.value ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator()
                    ],
                  ) :DropdownButtonFormField<CarModelData>(
                    
                    onChanged: controller.carmodelList == null ? null: (newValue) {
                      controller.carModelValue = newValue;
                      // controller.selectedModel.value = newValue.toString();
                      // controller.update();
                      controller.checkAllFieldDone();
                     
                    },
                    value: controller.carModelValue ?? null,                   
                    hint: Text(
                      "Model ",
                      style: HeadingCustom(
                        size: 16.sp,
                        color: ColorCode.ligthGray,
                        fbold: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    items:controller.carmodelList != null?  [
                      // if(controller.makeValue != null && controller.carmodelList != null)
                    
                      for (var value in controller.carmodelList!)
                        DropdownMenuItem(
                          child: new Text(
                            value.name!,
                            style: TextStyle(
                                fontSize: 16.sp,
                              color: ColorCode.darkGray,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          value: value,
                        )
                    
                    ]: [],
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
                  child: DropdownButtonFormField<ColorModelData>(
                    // iconSize: ,
                    onChanged: (newValue) {
                      controller.colorsModelValue = newValue;
                      controller.update();
                      controller.checkAllFieldDone();
                    },
                    value: controller.colorsModelValue ??  null,                  
                    hint: Text(
                      "Color ",
                      style: HeadingCustom(
                        size: 16.sp,
                        color: ColorCode.ligthGray,
                        fbold: FontWeight.bold,
                      ),
                    ),
                    isExpanded: true,
                    items: controller.colorsList == null ? null: [
                      for (var value in controller.colorsList!)
                        DropdownMenuItem(
                          child: new Text(
                            value.name!,
                            style: TextStyle(
                              fontSize: 16.sp,
                        color: ColorCode.darkGray,
                        fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: value,
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
                            onChanged: (newValue) {
                              controller.stateCodeValue = newValue;
                              controller.update();
                              controller.checkAllFieldDone();                              
                            },
                            value: controller.stateCodeValue ?? null,
                           
                            hint: Text(
                              "State",
                              style: HeadingCustom(
                                size: 16.sp,
                                color: ColorCode.ligthGray,
                                fbold: FontWeight.bold,
                              ),
                            ),
                            isExpanded: true,
                            items: controller.stateCodeList ==  null ? null :[
                              for (var value in controller.stateCodeList!)
                                DropdownMenuItem(
                                  child: new Text(
                                    value.code.toString(),
                                    style: TextStyle(
                                       fontSize: 16.sp,
                        color: ColorCode.darkGray,
                        fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: value,
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

                SizedBox(
                  height: 20.h,
                ),
                
                SizedBox(
                    height: 30.h,
                  ),
                
               Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h
                  ),
                  child: FillBtn(ontap: () async{
                    VehicleController vehicleController = Get.put(VehicleController());
                 bool res = await controller.EditVehicleApi(context, widget.data.id.toString());
                          if(res){
                            vehicleController.GetVehicleList();
                            Navigator.of(context).pop();                            
                          } 
                      }, text: "SAVE CHANGES"
                    ),
                ),
                  SizedBox(height: 10.h,),
               Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h
                  ),child: BorderBtn(ontap: (){
                    
                    showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  Text("Delete Vehicle", style: Heading1(),),
                  content:  Text("Are you sure to Delete this vehicle", style: Heading3Regular(),),
                  actions: <Widget>[
                     ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
                  // textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },             // function used to perform after pressing the button
                  child: Text('CANCEL'),
                ),
                ElevatedButton(
                  // textColor: Colors.black,
                  onPressed: () async{
                    Navigator.of(ctx).pop();
                     VehicleController vehicleController = Get.put(VehicleController());
                   bool res = await  controller.DeleteVehicleApi(context, widget.data.id.toString());
                   if(res){
                     vehicleController.GetVehicleList();
                              Navigator.of(context).pop();

                   }

                  },
                  child: Text('DELETE'),
                ),
                    
                  ],
                ),
              );

                   
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
              controller.imagePath = "";
              controller.update();
              controller.AddVehicleImage(false);
              // Navigator.pop(context);
            },
            child: Text('Choose Form Gallery', style: HeadingCustom(color: Colors.blue),),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              controller.imagePath = "";
              controller.update();
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



// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
// import 'package:fuel2u_user/controller/bottom_bar_controller.dart';

// import 'package:fuel2u_user/model/vehicle/make_model.dart';
// import 'package:fuel2u_user/routes/app_pages.dart';
// import 'package:fuel2u_user/utils/color.dart';
// import 'package:fuel2u_user/utils/ui_hepler.dart';
// import 'package:fuel2u_user/widgets/border_button_ui.dart';
// import 'package:fuel2u_user/widgets/fill_button_ui.dart';
// import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
// import 'package:get/get.dart';


// class EditVehicleDetails extends GetView<AddVehicleController> {
//   const EditVehicleDetails({super.key});
//   @override
//   Widget build(BuildContext context) {
//     AddVehicleController controller = Get.find<AddVehicleController>(); 
//     // controller.updateData();
//     return Scaffold(
//       body: GetBuilder<AddVehicleController>(
//         init: AddVehicleController(),
//         initState: (_) {},
//         builder: (_) {
//           return SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 15.h
//                   ),
//                   child: controller.editLoading.value ? Center(
//                     child: CircularProgressIndicator(),
//                   ):Column(
//                     children: [
//                       SizedBox(height: 20.h,),
//                       ImageLogoWithRigthIcon(
//                               back: InkWell(
//                                 onTap: (){
//                                   Navigator.of(context).pop();
//                                   // Get.back();
//                                 },
//                               child: SvgPicture.asset("assets/icons/backarrow.svg", width: 30,),
//                             ),
//                               icon: InkWell(
//                                 onTap: () => Get.offNamed(Routes.ALLTRUCKINMAP),
//                               child: Image.asset("assets/icons/mytruck.png", width: 50,),
//                             )),
//                             SizedBox(height: 40.h,),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                     Text(
//                       "Edit Vehicle",
//                       style: Heading1(color: ColorCode.darkGray),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Container(
//                   height: 150.h,
//                   width: 200.h,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(image: controller.imagePath == ""? AssetImage("assets/images/car_img.png") : FileImage(File(controller.imagePath)) as ImageProvider,
//                     fit: BoxFit.cover
//                     ),
//                   ),
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap:(){
//                           _addPictureSheet(context);
//                         },
//                         child: Image.asset("assets/icons/edit_icon.png"),
//                         // child: Icon(
                          
//                         //   Icons.edit_square,
//                         //   size: 28,
//                         //   color: ColorCode.white,
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ),
//                  // Add Name
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                             child: TextFormField(
//                               style: TextFieldStyle(),
//                               controller: controller.nameCtrl,
//                               autocorrect: true,
//                             keyboardType: TextInputType.name,
//                     // validator: (val) {},
//                     decoration:  InputDecoration(
//                       hintText: "Name (optional), ie Frank’s Car",
//                       hintStyle: TextStyle(
//                          fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                           color: ColorCode.ligthGray),
//                       focusedBorder:  MainBorder(),
//                       border:  MainBorder(),
//                       enabledBorder:  MainBorder(),
//                     ),
//                   ),
//                 ),
//                   Padding(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: DropdownButtonFormField<MakeModelData>(                                 
//                     onChanged: (newValue) {
//                       // log(newValue.toString());                      
//                       controller.makeValue= newValue;
//                       controller.update();                                         
//                       controller.carModelValue  = null;
//                       // controller.updateBrand(newValue.toString());
//                       controller.checkAllFieldDone();
//                       controller.ModelApi();
//                       // log(controller.carModelValue.toString());
//                       // log(controller.carmodelList.toString());
//                     },                    
//                     value: controller.makeValue ?? null,                  
//                     hint: Text(
//                       "Make",
//                       style: HeadingCustom(
//                         size: 16.sp,
//                         color: ColorCode.ligthGray,
//                         fbold: FontWeight.bold,
//                       ),
//                     ),
//                     isExpanded: true,
//                     items: controller.makeList == null ? [] :[
//                       for (var value in controller.makeList ?? [])
//                         DropdownMenuItem(
//                           child: Text(
//                             value.name!,
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               color: ColorCode.darkGray,
//                               fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           value: value,
//                         ),
//                     ],
//                     decoration:  InputDecoration(
//                       fillColor: Colors.transparent,
//                       border: MainBorder(),
//                       enabledBorder:  MainBorder(),
//                     ),
//                   ),
//                 ),
//                 // Model Name DropDown
//                 // Padding(
//                 //   padding:
//                 //       EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //   child: controller.loadingmodel.value ?Row(
//                 //     mainAxisAlignment: MainAxisAlignment.center,
//                 //     children: [
//                 //       CircularProgressIndicator()
//                 //     ],
//                 //   ) :DropdownButtonFormField<CarModelData>(
                 
//                 //     onChanged: controller.carmodelList == null ? null: (newValue) {
//                 //       controller.carModelValue = newValue;
//                 //       // controller.selectedModel.value = newValue.toString();
//                 //       // controller.update();
//                 //       controller.checkAllFieldDone();
                     
//                 //     },
//                 //     value: controller.carModelValue ?? null,                   
//                 //     hint: Text(
//                 //       "Model ",
//                 //       style: HeadingCustom(
//                 //         size: 16.sp,
//                 //         color: ColorCode.ligthGray,
//                 //         fbold: FontWeight.bold,
//                 //       ),
//                 //     ),
//                 //     isExpanded: true,
//                 //     items:controller.carmodelList != null?  [
//                 //       // if(controller.makeValue != null && controller.carmodelList != null)
                    
//                 //       for (var value in controller.carmodelList!)
//                 //         DropdownMenuItem(
//                 //           child: new Text(
//                 //             value.name!,
//                 //             style: TextStyle(
//                 //                 fontSize: 16.sp,
//                 //               color: ColorCode.darkGray,
//                 //               fontWeight: FontWeight.bold
//                 //             ),
//                 //           ),
//                 //           value: value,
//                 //         )
                    
//                 //     ]: null,
//                 //     decoration:  InputDecoration(
//                 //       fillColor: Colors.transparent,
//                 //       border: MainBorder(),
//                 //       enabledBorder:  MainBorder(),
//                 //     ),
//                 //   ),
//                 // ),
//                 // // Color Name DropDown
//                 // Padding(
//                 //   padding:
//                 //       EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //   child: DropdownButtonFormField<ColorModelData>(
//                 //     // iconSize: ,
//                 //     onChanged: (newValue) {
//                 //       controller.colorsModelValue = newValue;
//                 //       controller.update();
//                 //       controller.checkAllFieldDone();
//                 //     },
//                 //     value: controller.colorsModelValue ??  null,                  
//                 //     hint: Text(
//                 //       "Color ",
//                 //       style: HeadingCustom(
//                 //         size: 16.sp,
//                 //         color: ColorCode.ligthGray,
//                 //         fbold: FontWeight.bold,
//                 //       ),
//                 //     ),
//                 //     isExpanded: true,
//                 //     items: controller.colorsList == null ? null: [
//                 //       for (var value in controller.colorsList!)
//                 //         DropdownMenuItem(
//                 //           child: new Text(
//                 //             value.name!,
//                 //             style: TextStyle(
//                 //               fontSize: 16.sp,
//                 //         color: ColorCode.darkGray,
//                 //         fontWeight: FontWeight.bold,
//                 //             ),
//                 //           ),
//                 //           value: value,
//                 //         ),
//                 //     ],
//                 //     decoration:  InputDecoration(
//                 //       fillColor: Colors.transparent,
//                 //       border: MainBorder(),
//                 //       enabledBorder: MainBorder()
//                 //     ),
//                 //   ),
//                 // ),
//                 // License Plate Number and State
//                 Padding(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                   child: Container(
//                     height: 55.h,
//                     child: Row(
//                       children: [
//                         Expanded(
//                             flex: 3,
//                             child: TextFormField(
//                               style: TextFieldStyle(),
//                               controller: controller.licensePlateNoCtrl,
//                               autocorrect: true,
//                               keyboardType: TextInputType.name,
//                               validator: (val) {
//                                 if (val!.isNotEmpty) {
//                                   return null;
//                                 }
//                                 return "Enter Number";
//                               },
//                               onChanged: (val) {
//                                 controller.checkAllFieldDone();
//                               },
//                               decoration: InputDecoration(
//                                 hintText: "License Plate Number",
//                                 hintStyle: TextStyle(
//                                    fontSize: 16.sp,
//                                     fontWeight: FontWeight.bold,
//                                     color: ColorCode.ligthGray),
//                                 focusedBorder:   MainBorder(),
//                                 border:   MainBorder(),
//                                 enabledBorder:   MainBorder(),
//                               ),
//                             )),
//                         SizedBox(
//                           width: 15.h,
//                         ),
//                         Expanded(
//                           flex: 2,
//                           // width: Get.width/2.5,
//                           child: DropdownButtonFormField(                                                                      
//                             onChanged: (newValue) {
//                               controller.stateCodeValue = newValue;
//                               controller.update();
//                               controller.checkAllFieldDone();                              
//                             },
//                             value: controller.stateCodeValue ?? null,
                           
//                             hint: Text(
//                               "State",
//                               style: HeadingCustom(
//                                 size: 16.sp,
//                                 color: ColorCode.ligthGray,
//                                 fbold: FontWeight.bold,
//                               ),
//                             ),
//                             isExpanded: true,
//                             items: controller.stateCodeList ==  null ? null :[
//                               for (var value in controller.stateCodeList!)
//                                 DropdownMenuItem(
//                                   child: new Text(
//                                     value.code.toString(),
//                                     style: TextStyle(
//                                        fontSize: 16.sp,
//                         color: ColorCode.darkGray,
//                         fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   value: value,
//                                 ),
//                             ],
//                             decoration:  InputDecoration(
                              
//                               fillColor: Colors.transparent,
//                               border:  MainBorder(),
//                               enabledBorder:  MainBorder(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 // // Add Name
//                 // Padding(
//                 //     padding:
//                 //         EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //     child: TextFormField(
//                 //       style: TextFieldStyle(),
//                 //       controller: controller.nameCtrl,
//                 //       autocorrect: true,
//                 //       keyboardType: TextInputType.name,
//                 //       // validator: (val) {},
//                 //       decoration:  InputDecoration(
//                 //         hintText: "Name (optional), ie Frank’s Car",
//                 //         hintStyle: TextStyle(
//                 //             color: ColorCode.ligthGray,
//                 //             fontWeight: FontWeight.bold),
//                 //         focusedBorder: MainBorder(),
//                 //         border: MainBorder(),
//                 //         enabledBorder: MainBorder(),
//                 //       ),
//                 //     ),
//                 //   ),

//                 //   // Brand Name DropDown
//                 //   Padding(
//                 //     padding:
//                 //         EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //     child: DropdownButtonFormField(
//                 //       // iconSize: ,
//                 //       onChanged: (newValue) {
//                 //         controller.selectedBrand.value = newValue!.toString();

//                 //         // print(controller.selectedBrand.value=newValue!.toString());
//                 //         controller.updateBrand(newValue.toString());
//                 //         controller.checkAllFieldDone();
//                 //       },
//                 //       value: controller.selectedBrand.value == ""
//                 //           ? null
//                 //           : controller.selectedBrand.value,
//                 //       hint: Text(
//                 //         "Make",
//                 //         style: HeadingCustom(
//                 //             color: ColorCode.ligthGray, fbold: FontWeight.bold),
//                 //       ),
//                 //       isExpanded: true,
//                 //       items: [
//                 //         for (var value in controller.makeList!)
//                 //           DropdownMenuItem(
//                 //             child: Text(
//                 //               value.name!
//                 //               ,
//                 //             ),
//                 //             value: value.obs,
//                 //           ),
//                 //       ],
//                 //       decoration: InputDecoration(
//                 //         fillColor: Colors.transparent,
//                 //         border: MainBorder(),
//                 //         enabledBorder: MainBorder(),
//                 //       ),
//                 //     ),
//                 //   ),
//                 //   // Model Name DropDown
//                 //   Padding(
//                 //     padding:
//                 //         EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //     child: DropdownButtonFormField(
//                 //       // iconSize: ,
//                 //       onChanged: (newValue) {
//                 //         controller.selectedModel.value = newValue.toString();
//                 //         controller.update();
//                 //         controller.checkAllFieldDone();
//                 //         // controller.selectedModel?.value=newValue!.toString();
//                 //       },
//                 //       value: controller.selectedModel.value == ""
//                 //           ? null
//                 //           : controller.selectedModel.value,
//                 //       hint: Text(
//                 //         "Model ",
//                 //         style: HeadingCustom(
//                 //             color: ColorCode.ligthGray, fbold: FontWeight.bold),
//                 //       ),
//                 //       isExpanded: true,
//                 //       items: [
//                 //         for (var value in controller.modelList)
//                 //           DropdownMenuItem(
//                 //             child: new Text(
//                 //               value,
//                 //             ),
//                 //             value: value.obs,
//                 //           ),
//                 //       ],
//                 //       decoration: InputDecoration(
//                 //         fillColor: Colors.transparent,
//                 //         border: MainBorder(),
//                 //         enabledBorder: MainBorder(),
//                 //       ),
//                 //     ),
//                 //   ),
//                 //   // Color Name DropDown
//                 //   Padding(
//                 //     padding:
//                 //         EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //     child: DropdownButtonFormField(
//                 //       // iconSize: ,
//                 //       onChanged: (newValue) {
//                 //         controller.selectedColor.value = newValue.toString();
//                 //         controller.update();
//                 //         controller.checkAllFieldDone();
//                 //       },
//                 //       value: controller.selectedColor.value == ""
//                 //           ? null
//                 //           : controller.selectedColor.value,
//                 //       hint: Text(
//                 //         "Color ",
//                 //         style: HeadingCustom(
//                 //             color: ColorCode.ligthGray, fbold: FontWeight.bold),
//                 //       ),
//                 //       isExpanded: true,
//                 //       items: [
//                 //         for (var value in controller.colorList)
//                 //           DropdownMenuItem(
//                 //             child: new Text(
//                 //               value,
//                 //             ),
//                 //             value: value.obs,
//                 //           ),
//                 //       ],
//                 //       decoration: InputDecoration(
//                 //         fillColor: Colors.transparent,
//                 //         border: MainBorder(),
//                 //         enabledBorder: MainBorder(),
//                 //       ),
//                 //     ),
//                 //   ),
//                 //   // License Plate Number and State
//                 //   Padding(
//                 //     padding:
//                 //         EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
//                 //     child: Row(
//                 //       children: [
//                 //         Expanded(
//                 //             flex: 3,
//                 //             child: TextFormField(
//                 //               style: TextFieldStyle(),
//                 //               controller: controller.licensePlateNoCtrl,
//                 //               autocorrect: true,
//                 //               keyboardType: TextInputType.name,
//                 //               validator: (val) {
//                 //                 if (val!.isNotEmpty) {
//                 //                   return null;
//                 //                 }
//                 //                 return "Enter Number";
//                 //               },
//                 //               onChanged: (val) {
//                 //                 controller.checkAllFieldDone();
//                 //               },
//                 //               decoration: InputDecoration(
//                 //                 hintText: "License Plate Number",
//                 //                 hintStyle: TextStyle(
//                 //                     color: ColorCode.ligthGray,
//                 //                     fontWeight: FontWeight.bold),
//                 //                 focusedBorder: MainBorder(),
//                 //                 border: MainBorder(),
//                 //                 enabledBorder: MainBorder(),
//                 //               ),
//                 //             )),
//                 //         SizedBox(
//                 //           width: 15.h,
//                 //         ),
//                 //         Expanded(
//                 //           flex: 2,
//                 //           // width: Get.width/2.5,
//                 //           child: SizedBox(
//                 //              height: 56.h,
//                 //             child: DropdownButtonFormField(
//                 //               // iconSize: ,
//                 //               onChanged: (newValue) {
//                 //                 controller.selectedState.value =
//                 //                     newValue.toString();
//                 //                 controller.update();
//                 //                 controller.checkAllFieldDone();
                          
//                 //                 // controller.selected.value=newValue!;
//                 //               },
//                 //               value: controller.selectedState.value == ""
//                 //                   ? null
//                 //                   : controller.selectedState.value,
//                 //               hint: Text(
//                 //                 "State",
//                 //                 style: HeadingCustom(
//                 //                     color: ColorCode.ligthGray,
//                 //                     fbold: FontWeight.bold),
//                 //               ),
//                 //               isExpanded: true,
//                 //               items: [
//                 //                 for (var value in controller.stateList)
//                 //                   DropdownMenuItem(
//                 //                     child: new Text(
//                 //                       value,
//                 //                     ),
//                 //                     value: value.obs,
//                 //                   ),
//                 //               ],
//                 //               decoration: InputDecoration(
//                 //                 fillColor: Colors.transparent,
//                 //                 border: MainBorder(),
//                 //                 enabledBorder: MainBorder(),
//                 //               ),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // upload Phote Code
               
//                 // Spacer(),
//                 SizedBox(
//                     height: 30.h,
//                   ),
                
//                Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10.h
//                   ),
//                   child: FillBtn(ontap: (){
//                       Get.toNamed(Routes.HOME);
//                       Get.find<BottomBarController>().onItemTapped(1);            
//                       }, text: "SAVE CHANGES"
//                     ),
//                 ),
//                   SizedBox(height: 10.h,),
//                Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10.h
//                   ),child: BorderBtn(ontap: (){

//                   }, text: "DELETE VEHICLE")),

                  
                 
          
//                   SizedBox(
//                     height: 20.h,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ); 
//         },
//       )    ,
//     );
//   }

//   void _addPictureSheet(BuildContext context) {
//     AddVehicleController controller = Get.find<AddVehicleController>(); 
//     showCupertinoModalPopup<void>(
//       context: context,
//       builder: (BuildContext context) => CupertinoActionSheet(
//         title: const Text('Add Picture'),
//         cancelButton:  CupertinoActionSheetAction(
          
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Cancel', style: HeadingCustom(color: Colors.blue),),
//           ), 
//         actions: <CupertinoActionSheetAction>[
//           CupertinoActionSheetAction(
            
//             onPressed: () {
//               controller.AddVehicleImage(false);
//               // Navigator.pop(context);
//             },
//             child: Text('Choose Form Gallery', style: HeadingCustom(color: Colors.blue),),
//           ),
//           CupertinoActionSheetAction(
//             onPressed: () {
//               controller.AddVehicleImage(true);
//               // Navigator.pop(context);
//             },
//             child:  Text('Take a Picture', style: HeadingCustom(color: Colors.blue)),
//           ),
          
         
//         ],
        
//       ),
//     );
//   }
// }

// // class ActionSheetExample extends StatelessWidget {
// //   const ActionSheetExample({super.key});

// //   // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  

// //   @override
// //   Widget build(BuildContext context) {
// //     return CupertinoPageScaffold(
// //       navigationBar: const CupertinoNavigationBar(
// //         middle: Text('CupertinoActionSheet Sample'),
// //       ),
// //       child: Center(
// //         child: CupertinoButton(
// //           onPressed: () => _showActionSheet(context),
// //           child: const Text('CupertinoActionSheet'),
// //         ),
// //       ),
// //     );
// //   }
// // }


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/business_controller.dart';
import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/main.dart';
import 'package:fuel2u_user/model/state_list_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/capitalization.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  BusinessController controller = Get.put(BusinessController());
  @override
  void initState() {
    super.initState();
    controller.getCurrentPosition();
    controller.BusinessInfoApi();
  }
@override
  void dispose() {
    // TODO: implement dispose    
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              SizedBox(
                            height: 50.h,
                          ),
              Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: ImageLogoWithRigthIcon(
                                back: InkWell(
                                  onTap: () {
                                    // Get.back();
                                    Navigator.pop(context);
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
                          ),
                          
            Expanded(
              child: GetBuilder(
                init: BusinessController(),
                initState: (_) {},
                builder: (_) {
                  return controller.isLoading == true
                      ? Container(
                          height: Get.height,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [CircularProgressIndicator()],
                                )
                              ])
                          // mainAxisAlignment: MainAxisAlignment.center,
                          ,
                        )
                      : Form(
                          key: controller.bussinessFormKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                       
                                     
                                      },
                                      child: Text(
                                        "Business Details",
                                        style: Heading1(color: ColorCode.darkGray),
                                      ),
                                    )
                                  ],
                                ),
                          
                                SizedBox(
                                  height: 30.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                          
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.employerNameCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.name,
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                   inputFormatters: [
                              TextCapitalizationFormatter(TextCapitalization.sentences),
                            ],
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter Employer Name";
                                      }
                                      return null;
                                    },
                                    maxLength: 27,
                                    decoration: InputDecoration(
                                      hintText: "Employer Name",
                                      counterText: "",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    onTap: () async {
                                       await Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>    PlacePicker(
                                  apiKey:googleMKey,
                                          
                                  onPlacePicked: (result) { 
                                        // print(result.adrAddress.toString()); 
                                        // print(result.addressComponents!.toString()); 
                                        // print(result.formattedAddress);
                                        // // log(result.f)
                          
                                        // var add =  result.formattedAddress!.split(",");
                                        // print(add.length);
                                        // controller.addLanlng = LatLng(result.geometry!.location.lat, result.geometry!.location.lng);
                                        // controller.deliveryAddressCtrl.text = add.length >= 4 ? add[0] : add[0]+","+add[1];
                                        // controller.cityCtrl.text = add[add.length - 3];
                                        // // var pin = add[2].split(" ");
                                        // // log(pin.toString());
                                        // // controller.zipCodeCtrl.text = pin[2];
                          
                                        // controller.update();
                                        // Navigator.of(context).pop();
                                          if(result.formattedAddress!.contains(",")) {                         
                                      var add =  result.formattedAddress!.split(",");
                                      print(add.length);
                                       controller.addLanlng = LatLng(result.geometry!.location.lat, result.geometry!.location.lng);
                                      if(add.isNotEmpty){                                
                                      
                                      if(add.length == 1){
                                        controller.deliveryAddressCtrl.text  =  add[0];
                                         controller.cityCtrl.text = add[0];
                                      }
                                      else{
                                      controller.deliveryAddressCtrl.text  =  add.length <= 4 ? add[0] : add[0]+","+add[1];
                                      controller.cityCtrl.text = add.length <= 2 ? add[add.length - 1] :  add[add.length - 3];                                                 
                                      }
                                      }
                                      }
                                      else{
                                        controller.deliveryAddressCtrl.text  =  result.formattedAddress!.toString();
                                        
                                      }
                                      // controller.streetAddressCtrl.text  =  result.formattedAddress.toString() ?? "";
                                      controller.update();
                                      Future.delayed(Duration(seconds: 0), ()=>  Navigator.of(_).pop());
                                  },
                                  initialPosition: LatLng(controller.currentPosition!.latitude, controller.currentPosition!.longitude),
                                  useCurrentLocation: true,
                                  resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
                                )));
                                    
                                    },
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.deliveryAddressCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.text,
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter Delivery Address";
                                      }
                                      return null;
                                    },
                                   inputFormatters: [
                              TextCapitalizationFormatter(TextCapitalization.sentences),
                            ],
                                    decoration: InputDecoration(
                                      hintText: "Delivery Address",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                          
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.cityCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.name,
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter City Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "City",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // State and Zip code
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: SizedBox(
                                    height: controller.stateAndZipCodeHeight.h,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          // width: Get.width/2.5,
                                          child: DropdownButtonFormField<
                                              StateListModelData>(
                                            padding: EdgeInsets.zero,
                                            onChanged: (newValue) {
                                              controller.stateValue = newValue;
                                              log(newValue.toString());
                                              controller.update();
                                              controller.checkFormValied();
                                            },
                                            validator: (value) {
                                              if (value == null) {
                                                controller.stateAndZipCodeHeight =
                                                    80;
                                                controller.update();
                                                return 'Please Select State';
                                              } else {
                                                controller.stateAndZipCodeHeight =
                                                    55;
                                                controller.update();
                                                return null;
                                              }
                                            },
                                            value: controller.stateValue ?? null,
                                            hint: Text(
                                              "State",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorCode.ligthGray),
                                            ),
                                            isExpanded: true,
                                            items: [
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
                                            ],
                                            decoration: InputDecoration(
                                              fillColor: Colors.transparent,
                                              labelStyle:
                                                  TextStyle(color: ColorCode.red),
                                              border: MainBorder(),
                                              enabledBorder: MainBorder(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.h,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: TextFormField(
                                              style: TextFieldStyle(),
                                              textInputAction: TextInputAction.next,
                                              controller: controller.zipCodeCtrl,
                                              autocorrect: true,
                                              keyboardType: TextInputType.name,
                                              onChanged: (val) {
                                                controller.checkFormValied();
                                              },
                                              validator: (val) {
                                                if (val!.length == 5) {
                                                  controller.stateAndZipCodeHeight =
                                                      55;
                                                  controller.update();
                                                  return null;
                                                }
                                                controller.stateAndZipCodeHeight =
                                                    80;
                                                controller.update();
                                                return "Enter Valid Zip Code";
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Zip Code",
                                                hintStyle: TextStyle(
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorCode.ligthGray),
                                                focusedBorder: MainBorder(),
                                                border: MainBorder(),
                                                enabledBorder: MainBorder(),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                // Delivery optional field
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.deliveryInstructionsCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.text,
                                   inputFormatters: [
                              TextCapitalizationFormatter(TextCapitalization.sentences),
                            ],
                                    decoration: InputDecoration(
                                      hintText: "Delivery Instructions (optional)",
                          
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // Promo Code
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.promoCodeCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.name,
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter Promo Code";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          "Promo Code Your Employees will Use",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // Contact Name
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.contactNameCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.name,
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                   inputFormatters: [
                              TextCapitalizationFormatter(TextCapitalization.sentences),
                            ],
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter Contact Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Contact Name",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // Contact Email
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    textInputAction: TextInputAction.next,
                                    controller: controller.contactEmailCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter Contact Email";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Contact Email",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // Contact Phone Number
                          
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    controller: controller.contactNumberCtrl,
                                    textInputAction: TextInputAction.next,
                                    autocorrect: true,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      MaskedInputFormatter('###-###-####')
                          
                                    ],
                                    onChanged: (val) {
                                      controller.checkFormValied();
                                    },
                                    validator: (val) {
                                      if (val!.length == 12) {
                                        return null;
                                      } else if (val.isEmpty) {
                                        return "Enter Phone Number";
                                      }
                                      return "Enter Valid Number";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Contact Phone Number",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                          
                                // Check Box Button Billing
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Obx(
                                        () => Checkbox(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          value: controller.deliveryAddSame.value,
                                          onChanged: (value) {
                                            controller
                                                .checkSameBillingAddress(value!);
                                                if(value == true){
                                            controller.billingAddressCtrl.text  = controller.deliveryAddressCtrl.text;
                                            controller.billingCityCtrl.text  = controller.cityCtrl.text;
                                            controller.billingZipCodeCtrl.text  = controller.zipCodeCtrl.text;
                                            controller.billStateValue = controller.stateValue;
                                            controller.update();
                                            
                                          }
                                          },
                                        ),
                                      ),
                                      Text("Same as delivery address",
                                          style: HeadingCustomFamliy(
                                            size: 13.sp,
                                            family: "RobotoRagular",
                                            fbold: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    controller: controller.billingAddressCtrl,
                          
                                    autocorrect: true,
                                    keyboardType: TextInputType.text,
                                    // validator: (val){
                                    //   if(val == null || val.isEmpty){
                                    //     return "Enter Billing Address";
                                    //   }
                                    //   return null;
                          
                                    // },
                                    decoration: InputDecoration(
                                      hintText: "Billing Address",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // Billing City
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.r, horizontal: 15.r),
                                  child: TextFormField(
                                    style: TextFieldStyle(),
                                    controller: controller.billingCityCtrl,
                                    autocorrect: true,
                                    keyboardType: TextInputType.name,
                                    // validator: (val){
                                    //   if(val == null || val.isEmpty){
                                    //     return "Enter City";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      hintText: "City",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                      focusedBorder: MainBorder(),
                                      border: MainBorder(),
                                      enabledBorder: MainBorder(),
                                    ),
                                  ),
                                ),
                                // State and Zip code
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.r, horizontal: 15.r),
                                    child: Container(
                                      height: 55.h,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            // width: Get.width/2.5,
                                            child: DropdownButtonFormField<
                                                StateListModelData>(
                                              onChanged: (newValue) {
                                                controller.billStateValue =
                                                    newValue!;
                          
                                                controller.update();
                                              },
                                              value:
                                                  controller.billStateValue ?? null,
                                              hint: Text(
                                                "State",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorCode.ligthGray),
                                              ),
                                              isExpanded: true,
                                              items: [
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
                                              ],
                                              decoration: InputDecoration(
                                                fillColor: Colors.transparent,
                                                border: MainBorder(),
                                                enabledBorder: MainBorder(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.h,
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: TextFormField(
                                                style: TextFieldStyle(),
                                                controller:
                                                    controller.billingZipCodeCtrl,
                          
                                                autocorrect: true,
                                                keyboardType: TextInputType.name,
                                                // validator: (val){
                                                //   if(val!.length == 6){
                                                //     return null;
                                                //   }
                                                //   return "Enter Valid Zip Code";
                                                // },
                          
                                                decoration: InputDecoration(
                                                  hintText: "Zip Code",
                                                  hintStyle: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: ColorCode.ligthGray),
                                                  focusedBorder: MainBorder(),
                                                  border: MainBorder(),
                                                  enabledBorder: MainBorder(),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          
                                SizedBox(
                                  height: 30.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  child: FillBtn(
                                    ontap: () {
                                      // controller.UpdateBusinessFormApi(context, "0");
                                      FocusScope.of(context).unfocus();
                                      if(controller.bussinessFormKey.currentState!.validate()){
                                        
                                          // log("Hello Business");
                                          if(controller.editBusinessData == null){
                                            controller.SaveBusinessFormApi(context);
                          
                                          }
                                          else{
                                          controller.UpdateBusinessFormApi(context, controller.editBusinessData!.id.toString());
                                          }
                          
                                      }
                                    },
                                    text: "SAVE CHANGES",
                                    Bgcolor: ColorCode.ligthGray,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  child: BorderBtn(
                                    ontap: () {
                                      FocusScope.of(context).unfocus();
                                       SignUpController profilecontroller = Get.find<SignUpController>();
                                       showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text(
                                              "Delete Account",
                                              style: Heading1(),
                                            ),
                                            content: Text(
                                              "Are your sure to delete you account",
                                              style: Heading3Regular(),
                                            ),
                                            actions: <Widget>[
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                   Expanded(
                                                    flex: 2,
                                                     child: 
                                                     BorderBtn(ontap: () {  
                                                      Navigator.of(ctx).pop();
                                                     }, text: 'NO',
                                                      
                                                     ),
                                               
                                                   ),
                                                   SizedBox(width: 20.h,),
                                                Expanded(
                                                    flex: 2,
                                                    child: FillBtn(ontap: () async{
                                                       Navigator.of(ctx).pop();
                                                      profilecontroller.deleteAccount(context);
                                                    }, text: 'CONFIRM'),
                                              
                                                  ),
                                                 ],)
                                            //   Row(
                                            //     children: [
                                              
                                            //   Expanded(
                                            //     flex: 2,
                                            //     child: ElevatedButton(
                                            //       // FlatButton widget is used to make a text to work like a button
                                              
                                            //       onPressed: () {
                                            //         Navigator.of(ctx).pop();
                                            //       }, // function used to perform after pressing the button
                                            //       child: Text('NO'),
                                            //     ),
                                            //   ),
                                            //   SizedBox(width: 20.h,),
                                            //  Expanded(
                                            //     flex: 2,
                                            //     child: ElevatedButton(
                                            //         // textColor: Colors.black,
                                            //         onPressed: () async {
                                            //           Navigator.of(ctx).pop();
                                            //           profilecontroller.deleteAccount(context);
                                            //           // logOutcontroller.SignOutApi(
                                            //           //     context);
                                            //         },
                                            //         child: Text('CONFIRM'),
                                                    
                                            //         ),
                                            //   ),
                                                      
                                            //     ],
                                            //   )
                                            ],
                                          ),
                          
                                        );
                                    },
                                    text: "DELETE ACCOUNT",
                                    Bgcolor: ColorCode.ligthGray,
                                    textColor: ColorCode.ligthGray,
                                  ),
                                ),
                          
                                //             //  FillBtn(ontap: (){
                                //             //   Get.toNamed(Routes.ADDVEHICLE);
                                //             //  }, text: "Save",
                                //             // Bgcolor: ColorCode.ligthGray,),
                                //             SizedBox(height: 30.h,)
                                SizedBox(
                                  height: 40.h,
                                )
                              ],
                            ),
                          ),
                        );
                },
              ),)
            ],
          )),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 15.h),
    //       child:  Column(
    //         children: [
    //           SizedBox(height: 40.h,),
    //          Padding(
    //                               padding: EdgeInsets.only(left: 10.h),
    //                               child: ImageLogoWithRigthIcon(
    //                                   back: InkWell(
    //                                     onTap: () {
    //                                       // Get.back();
    //                                       Navigator.pop(context);
    //                                     },
    //                                     child: SvgPicture.asset(
    //                                       "assets/icons/backarrow.svg",
    //                                       width: 30,
    //                                     ),
    //                                   ),
    //                                   icon: InkWell(
    //                                     onTap: () =>
    //                                         Get.toNamed(Routes.ALLTRUCKINMAP),
    //                                     child: Image.asset(
    //                                       "assets/icons/mytruck.png",
    //                                       width: 50,
    //                                     ),
    //                                   )),
    //                             ),
    //           SizedBox(height: 50.h,),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text("Business Details", style: Heading1(
    //               color: ColorCode.darkGray
    //             ),)
    //           ],
    //         ),

    //      SizedBox(height: 30.h,),
    //     //  Form Input Feild
    //       Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.employerNameCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter Employer Name";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Employer Name",
    //                     hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),

    //                   focusedBorder: MainBorder(),
    //                   border:  MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.deliveryAddressCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter Delivery Address";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Delivery Address",
    //                     hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),

    //              Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.cityCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter City Name";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "City",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //             // State and Zip code
    //             Padding(

    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: Container(
    //                   height: 55.h,
    //                 child: Row(

    //                   children: [
    //                   Expanded(
    //                         flex: 2,
    //                         // width: Get.width/2.5,
    //                         child:  DropdownButtonFormField(
    //                             padding: EdgeInsets.zero,

    //                                             onChanged: ( newValue){

    //                                             controller.selectedIndex = newValue.toString();
    //                                             log(newValue.toString());
    //                                             controller.update();
    //                                              controller.checkFormValied();
    //                                             },
    //                                               validator: (value) {

    //                                                 if(value == null){
    //                                                 controller.stateAndZipCodeHeight = 80;
    //                                                 controller.update();
    //                                                     return  'Please Select State';
    //                                                 }
    //                                                 else{
    //                                                    controller.stateAndZipCodeHeight = 55;
    //                                                 controller.update();
    //                                                     return  null;

    //                                                 }

    //           },
    //                                             value: controller.selected ?? null,
    //                                             hint: Text("State",  style: TextStyle(
    //                                     fontSize: 16.sp,

    //                                     fontWeight: FontWeight.bold,
    //                                     color: ColorCode.ligthGray),),
    //                                             isExpanded: true,
    //                                             items: [
    //                         for(var value in controller.stateList!)
    //                           DropdownMenuItem(
    //                               child: new Text(
    //                                 value.name!,
    //                                 style: TextStyle(
    //                                   color: ColorCode.darkGray,
    //                                    fontSize: 16.sp,
    //                                 ),
    //                               ),
    //                           value: value.id,
    //                           ),
    //                                             ],
    //                                             decoration:   InputDecoration(
    //                         fillColor: Colors.transparent,
    //                                 labelStyle: TextStyle(
    //                                   color: ColorCode.red
    //                                 ),
    //                                     border:MainBorder(),
    //                                      enabledBorder: MainBorder(),
    //                                   ),
    //                                           ),
    //                       ),
    //                   SizedBox(
    //                     width: 15.h,
    //                   ),
    //                   Expanded(
    //                     flex: 2,
    //                     child:  TextFormField(
    //                       style: TextFieldStyle(),
    //                       controller: controller.zipCodeCtrl,

    //                       autocorrect: true,
    //                       keyboardType: TextInputType.name,
    //                       validator: (val){
    //                         if(val!.length == 6){
    //                           return null;
    //                         }
    //                         return "Enter Valid Zip Code";

    //                       },

    //                       decoration:  InputDecoration(
    //                         hintText: "Zip Code",
    //                         hintStyle: TextStyle(
    //                                 fontSize: 17.sp,
    //                                 fontWeight: FontWeight.bold,
    //                                 color: ColorCode.ligthGray),
    //                         focusedBorder:   MainBorder(),
    //                         border: MainBorder(),
    //                         enabledBorder: MainBorder(),
    //                       ),
    //                     )
    //                   )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             // Delivery optional field
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.deliveryInstructionsCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,

    //                 decoration:  InputDecoration(
    //                   hintText: "Delivery Instructions (optional)",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //             // Promo Code
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.promoCodeCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter Promo Code";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Promo Code Your Employees will Use",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //             // Contact Name
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.contactNameCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter Contact Name";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Contact Name",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //              // Contact Email
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.contactEmailCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter Contact Email";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Contact Email",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //             // Contact Phone Number

    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.contactNumberCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.number,
    //                 inputFormatters: [
    //                    MaskedInputFormatter('###-###-####')
    //                 ],
    //                 validator: (val){
    //                   if(val!.length == 12){
    //                     return null;
    //                   }
    //                   else if(val.isEmpty){
    //                     return "Enter Phone Number";
    //                   }
    //                   return "Enter Valid Number";

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Contact Phone Number",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),

    //             // Check Box Button Billing
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 children: [
    //                    Obx(() => Checkbox(

    //                      shape: RoundedRectangleBorder(
    //              borderRadius: BorderRadius.circular(3)
    //                     ),
    //                     activeColor: ColorCode.orange,
    //                   focusColor: ColorCode.orange,
    //                   side: BorderSide(
    //                     color: ColorCode.orange,
    //                   ),
    //                           value: controller.deliveryAddSame.value,
    //                           onChanged: (value) {
    //                               controller.checkSameBillingAddress(value!);
    //                           },
    //                         ), ),
    //                          Text("Same as delivery address",  style: HeadingCustomFamliy(
    //                             size: 13.sp,
    //                             family: "RobotoRagular",
    //                             fbold: FontWeight.w500,

    //                            ),)
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.billingAddressCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter Billing Address";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "Billing Address",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //             // Billing City
    //             Padding(
    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: TextFormField(
    //                 style: TextFieldStyle(),
    //                 controller: controller.billingCityCtrl,

    //                 autocorrect: true,
    //                 keyboardType: TextInputType.name,
    //                 validator: (val){
    //                   if(val == null || val.isEmpty){
    //                     return "Enter City";
    //                   }
    //                   return null;

    //                 },
    //                 decoration:  InputDecoration(
    //                   hintText: "City",
    //                    hintStyle: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: ColorCode.ligthGray),
    //                   focusedBorder: MainBorder(),
    //                   border: MainBorder(),
    //                   enabledBorder: MainBorder(),
    //                 ),
    //               ),
    //             ),
    //              // State and Zip code
    //             Padding(

    //                padding:  EdgeInsets.symmetric(
    //                 vertical: 10.r,
    //                 horizontal: 15.r
    //               ),
    //               child: Container(
    //                   height: 55.h,
    //                 child: Row(

    //                   children: [
    //                   Expanded(
    //                           flex: 2,
    //                           // width: Get.width/2.5,
    //                           child:  DropdownButtonFormField(
    //                                                 // iconSize: ,
    //                                               onChanged: (newValue){

    //                           controller.billingStateId =newValue!.toString();
    //                           controller.update();

    //                                               },
    //                                               value: controller.billingState?.value,
    //                                               hint: Text("State", style: TextStyle(
    //                                       fontSize: 16.sp,
    //                                       fontWeight: FontWeight.bold,
    //                                       color: ColorCode.ligthGray),),
    //                                               isExpanded: true,
    //                                               items: [
    //                            for(var value in controller.stateList!)
    //                           DropdownMenuItem(
    //                               child: new Text(
    //                                 value.name!,
    //                                 style: TextStyle(
    //                                   color: ColorCode.darkGray,
    //                                    fontSize: 16.sp,
    //                                 ),
    //                               ),
    //                           value: value.id,
    //                           ),
    //                                               ],
    //                                               decoration:   InputDecoration(
    //                           fillColor: Colors.transparent,
    //                                       border: MainBorder(),
    //                                        enabledBorder: MainBorder(),
    //                                     ),
    //                                             ),
    //                         ),
    //                   SizedBox(
    //                     width: 15.h,
    //                   ),
    //                   Expanded(
    //                     flex: 2,
    //                     child:  TextFormField(
    //                       style: TextFieldStyle(),
    //                       controller: controller.billingZipCodeCtrl,

    //                       autocorrect: true,
    //                       keyboardType: TextInputType.name,
    //                       validator: (val){
    //                         if(val!.length == 6){
    //                           return null;
    //                         }
    //                         return "Enter Valid Zip Code";

    //                       },

    //                       decoration:  InputDecoration(
    //                         hintText: "Zip Code",
    //                         hintStyle: TextStyle(
    //                                 fontSize: 17.sp,
    //                                 fontWeight: FontWeight.bold,
    //                                 color: ColorCode.ligthGray),
    //                         focusedBorder: MainBorder(),
    //                         border: MainBorder(),
    //                         enabledBorder: MainBorder(),
    //                       ),
    //                     )
    //                   )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 30.h,),
    //               Padding(
    //                 padding:  EdgeInsets.symmetric(horizontal: 10.h),
    //                 child: FillBtn(ontap: (){}, text: "SAVE CHANGES",
    //                                   Bgcolor: ColorCode.ligthGray,),
    //               ),
    //                                 SizedBox(height: 20.h,),
    //                                 Padding(
    //                                 padding:  EdgeInsets.symmetric(horizontal: 10.h),
    //                                   child: BorderBtn(ontap: (){}, text: "DELETE ACCOUNT",Bgcolor: ColorCode.ligthGray,textColor: ColorCode.ligthGray,),
    //                                 ),

    //             //  FillBtn(ontap: (){
    //             //   Get.toNamed(Routes.ADDVEHICLE);
    //             //  }, text: "Save",
    //             // Bgcolor: ColorCode.ligthGray,),
    //             SizedBox(height: 30.h,)

    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

// class BusinessDetails extends GetView<BusinessController> {
//   @override

//   }

// }

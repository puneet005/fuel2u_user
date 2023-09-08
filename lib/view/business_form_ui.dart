import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/business_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

class BusinessForm extends GetView<BusinessController> {
  const BusinessForm({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 10.h
          ),
          child: GetBuilder(
            init: BusinessController(),
            initState: (_) {},
            builder: (_) {

              return controller.isLoading.value ? Container(
                height: Get.height,
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator()
                    ],
                  )
                ])
                // mainAxisAlignment: MainAxisAlignment.center,
                ,
              )  : Form(
                key: controller.bussinessFormKey,
                child: Column(
                        children: [
                          SizedBox(height: 40.h,),
                          ImageLogo(),
                          SizedBox(height: 40.h,), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Business Information", style: Heading1(
                              color: ColorCode.darkGray
                            ),)
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                              padding:  EdgeInsets.symmetric(
                                vertical: 10.r, 
                                horizontal: 15.r
                              ),
                              child: Text("Enter your details below, including the promo code for your employees.", 
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: HeadingSub2(),),
                          ),
                       SizedBox(height: 15.h,),
                        Padding(
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        textInputAction: TextInputAction.next,
                        controller: controller.employerNameCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                        onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){     
                          if(val == null || val.isEmpty){
                            return "Enter Employer Name";
                          }
                          return null;
                        
                        },
                        decoration:  InputDecoration(
                          hintText: "Employer Name",
                            hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorCode.ligthGray),
                          
                          focusedBorder: MainBorder(),
                          border:  MainBorder(),
                          enabledBorder: MainBorder(),
                        ),
                      ),
                    ),
                    Padding(
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                         style: TextFieldStyle(),
                         textInputAction: TextInputAction.next,
                        controller: controller.deliveryAddressCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                             onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){     
                          if(val == null || val.isEmpty){
                            return "Enter Delivery Address";
                          }
                          return null;
                        
                        },
                        decoration:  InputDecoration(
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
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                         style: TextFieldStyle(),
                         textInputAction: TextInputAction.next,
                        controller: controller.cityCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                             onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){     
                          if(val == null || val.isEmpty){
                            return "Enter City Name";
                          }
                          return null;
                        
                        },
                        decoration:  InputDecoration(
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
                     
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: SizedBox(
                        height: controller.stateAndZipCodeHeight.h,
                        child: Row(
                          
                          children: [
                          Expanded(
                            flex: 2,
                            // width: Get.width/2.5,
                            child:  DropdownButtonFormField( 
                                padding: EdgeInsets.zero,
                                                      
                                                onChanged: ( newValue){
                                                
                                               
                                                controller.selectedIndex = newValue.toString(); 
                                                log(newValue.toString());
                                                controller.update();     
                                                 controller.checkFormValied();                                           
                                                },
                                                  validator: (value) { 
                                                    
                                                    if(value == null){
                                                    controller.stateAndZipCodeHeight = 80;
                                                    controller.update();
                                                        return  'Please Select State';
                                                    }
                                                    else{
                                                       controller.stateAndZipCodeHeight = 55;
                                                    controller.update();
                                                        return  null;

                                                    }
           
              },
                                                value: controller.selected ?? null,
                                                hint: Text("State",  style: TextStyle(
                                        fontSize: 16.sp,
                                        
                                        fontWeight: FontWeight.bold,
                                        color: ColorCode.ligthGray),),
                                                isExpanded: true,
                                                items: [
                            for(var value in controller.stateList!)
                              DropdownMenuItem(
                                  child: new Text(
                                    value.name!,
                                    style: TextStyle(
                                      color: ColorCode.darkGray,
                                       fontSize: 16.sp,
                                    ),
                                  ),
                              value: value.id,
                              ),
                                                ],
                                                decoration:   InputDecoration(
                            fillColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      color: ColorCode.red
                                    ),
                                        border:MainBorder(),
                                         enabledBorder: MainBorder(),
                                      ),              
                                              ),                         
                          ),
                          SizedBox(
                            width: 15.h,
                          ),
                          Expanded(
                            flex: 2,
                            child:  TextFormField(
                              style: TextFieldStyle(),
                              textInputAction: TextInputAction.next,
                              controller: controller.zipCodeCtrl,
                              
                              autocorrect: true,
                              keyboardType: TextInputType.name,
                                   onChanged: (val){
                        controller.checkFormValied();
                        },
                              validator: (val){
                                if(val!.length == 5){
                                   controller.stateAndZipCodeHeight = 55;
                                                    controller.update();

                                  return null;
                                }
                                 controller.stateAndZipCodeHeight = 80;
                                                    controller.update();
                                return "Wrong Zip Code";
                                
                              },
                              
                              decoration:  InputDecoration(
                                hintText: "Zip Code",
                                hintStyle: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorCode.ligthGray),
                                focusedBorder:   MainBorder(),
                                border: MainBorder(),
                                enabledBorder: MainBorder(),
                              ),
                            )
                          )
                          ],
                        ),
                      ),
                    ),
                    // Delivery optional field
                    Padding(
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        textInputAction: TextInputAction.next,
                        controller: controller.deliveryInstructionsCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                        
                        decoration:  InputDecoration(
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
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        textInputAction: TextInputAction.next,
                        controller: controller.promoCodeCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                             onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){     
                          if(val == null || val.isEmpty){
                            return "Enter Promo Code";
                          }
                          return null;
                        
                        },
                        decoration:  InputDecoration(
                          hintText: "Promo Code Your Employees will Use",
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
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        textInputAction: TextInputAction.next,
                        controller: controller.contactNameCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                             onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){     
                          if(val == null || val.isEmpty){
                            return "Enter Contact Name";
                          }
                          return null;
                        
                        },
                        decoration:  InputDecoration(
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
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        textInputAction: TextInputAction.next,
                        controller: controller.contactEmailCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                             onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){     
                          if(val == null || val.isEmpty){
                            return "Enter Contact Email";
                          }
                          return null;
                        
                        },
                        decoration:  InputDecoration(
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
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        controller: controller.contactNumberCtrl,
                        textInputAction: TextInputAction.next,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                           MaskedInputFormatter('###-###-####')
                        ],
                             onChanged: (val){
                        controller.checkFormValied();
                        },
                        validator: (val){
                          if(val!.length == 12){
                            return null;
                          }
                          else if(val.isEmpty){
                            return "Enter Phone Number";
                          }
                          return "Enter Valid Number";
                        
                        },
                        decoration:  InputDecoration(
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
                           Obx(() => Checkbox(
                             shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(3)         
                            ),
                                  value: controller.deliveryAddSame.value,
                                  onChanged: (value) {
                                      controller.checkSameBillingAddress(value!);
                                  },
                                ), ),
                                 Text("Same as delivery address",  style: HeadingCustomFamliy(
                                  size: 13.sp,
                                  family: "RobotoRagular",
                                  fbold: FontWeight.w500,
                                  
                                 )  )
                        ],
                      ),
                    ),
                    Padding(
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
                      child: TextFormField(
                        style: TextFieldStyle(),
                        controller: controller.billingAddressCtrl,
                        
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                        // validator: (val){     
                        //   if(val == null || val.isEmpty){
                        //     return "Enter Billing Address";
                        //   }
                        //   return null;
                        
                        // },
                        decoration:  InputDecoration(
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
                       padding:  EdgeInsets.symmetric(
                        vertical: 10.r, 
                        horizontal: 15.r
                      ),
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
                        decoration:  InputDecoration(
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
                       
                         padding:  EdgeInsets.symmetric(
                          vertical: 10.r, 
                          horizontal: 15.r
                        ),
                        child: Container(
                        height: 55.h,
                          child: Row(
                            
                            children: [
                            Expanded(
                              flex: 2,
                              // width: Get.width/2.5,
                              child:  DropdownButtonFormField(
                                                    // iconSize: ,
                                                  onChanged: (newValue){

                              controller.billingStateId =newValue!.toString();
                              controller.update();
                              
                                                  },
                                                  value: controller.billingState?.value,
                                                  hint: Text("State", style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),),
                                                  isExpanded: true,
                                                  items: [
                               for(var value in controller.stateList!)
                              DropdownMenuItem(
                                  child: new Text(
                                    value.name!,
                                    style: TextStyle(
                                      color: ColorCode.darkGray,
                                       fontSize: 16.sp,
                                    ),
                                  ),
                              value: value.id,
                              ),
                                                  ],
                                                  decoration:   InputDecoration(
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
                              child:  TextFormField(
                                style: TextFieldStyle(),
                                controller: controller.billingZipCodeCtrl,
                                
                                autocorrect: true,
                                keyboardType: TextInputType.name,
                                // validator: (val){
                                //   if(val!.length == 6){
                                //     return null;
                                //   }
                                //   return "Wrong Zip Code";                                
                                // },
                                
                                decoration:  InputDecoration(
                                  hintText: "Zip Code",
                                  hintStyle: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCode.ligthGray),
                                  focusedBorder: MainBorder(),
                                  border: MainBorder(),
                                  enabledBorder: MainBorder(),
                                ),
                              )
                            )
                            ],
                          ),
                        ),
                      ),
                    ),
                     
                  SizedBox(height: 30.h,),
                 Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 10.h
                        ),
                     child: FillBtn(ontap: (){
                      if(controller.bussinessFormKey.currentState
                      !.validate()){
                        controller.BusinessFormApi(context);

                      }
                      // Get.toNamed(Routes.ADDVEHICLE);
                     }, text: "Save",
                                   Bgcolor: controller.formvalid.value ? ColorCode.orange:ColorCode.ligthGray,),
                   ),
                  SizedBox(height: 40.h,)
                      
                      
                  
                          ],
                        ),
              ); 
            },
          )  
        ),
      ),
    );
  }
  
}


 //  Form Input Feild
          // Padding(
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: TextFormField(
          //                 controller: controller.employerNameCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter Employer Name";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Employer Name",
          //                    hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: TextFormField(
          //                 controller: controller.deliveryAddressCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter Delivery Address";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Delivery Address",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                 ),
          //               ),
          //             ),
        
          //              Padding(
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: TextFormField(
          //                 controller: controller.cityCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter City Name";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "City",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                 ),
          //               ),
          //             ),
          //             // State and Zip code
          //             Padding(
                 
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: Row(
                    
          //                 children: [
          //                 Expanded(
          //                   flex: 2,
          //                   // width: Get.width/2.5,
          //                   child:  DropdownButtonFormField(
          //                                         // iconSize: ,
          //                 onChanged: (newValue){
          //                   // controller.selected.value=newValue!;
                      
          //                 },
          //                 value: controller.selected?.value,
          //                 hint: Text("State", style: HeadingCustom(
          //                 color: ColorCode.ligthGray,
          //                 fbold: FontWeight.bold
          //                 ),),
          //                 isExpanded: true,
          //                 items: [
          //                   for(var value in controller.tierList)
          //                     DropdownMenuItem(
          //                         child: new Text(
          //                           value,
          //                         ),
          //                     value: value.obs,
          //                     ),
          //                 ],
          //                 decoration:  const InputDecoration(
          //                   fillColor: Colors.transparent,
                      
          //   border: OutlineInputBorder(
          //     borderSide: BorderSide(
          //       color: ColorCode.orange
          //     ),
              
          //   ),
          //    enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          // ),              
          //               ),                         
          //                 ),
          //                 SizedBox(
          //                   width: 15.h,
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child:  TextFormField(
          //                     controller: controller.zipCodeCtrl,
                        
          //                     autocorrect: true,
          //                     keyboardType: TextInputType.name,
          //                     validator: (val){
          //                       if(val!.length == 6){
          //                         return null;
          //                       }
          //                       return "Wrong Zip Code";
        
          //                     },
                        
          //                     decoration:  InputDecoration(
          //                       hintText: "Zip Code",
          //                      hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                       focusedBorder: const OutlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: ColorCode.orange
          //                         ),),
          //                       border: const OutlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: ColorCode.orange
          //                         ),
          //                       ),
          //                       enabledBorder: const OutlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: ColorCode.orange
          //                         ),),
          //                     ),
          //                   )
          //                 )
          //                 ],
          //               ),
          //             ),
          //             // Delivery optional field
          //             Padding(
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: TextFormField(
          //                 controller: controller.deliveryInstructionsCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
                    
          //                 decoration: const InputDecoration(
          //                   hintText: "Delivery Instructions (optional)",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
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
          //                 controller: controller.promoCodeCtrl,
                    
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter Promo Code";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Promo Code Your Employees will Use",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
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
          //                 controller: controller.contactNameCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter Contact Name";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Contact Name",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
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
          //                 controller: controller.contactEmailCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter Contact Email";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Contact Email",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
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
          //                   else if( val.isEmpty) {
          //                     return "Enter Phone Number";
          //                   }
          //                   return "Enter Valid Number";
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Contact Phone Number",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                 ),
          //               ),
          //             ),
        
          //             // Check Box Button Billing
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Row(
          //                 children: [
          //                    Obx(() => Checkbox(
          //                           value: controller.deliveryAddSame.value,
          //                           onChanged: (value) {
          //                               controller.checkSameBillingAddress(value!);
          //                           },
          //                            shape: RoundedRectangleBorder(
          //              borderRadius: BorderRadius.circular(3)         
          //                     ),
          //                         ), ),
          //                         const Text("Same as delivery address",  style:  TextStyle(
          //                           fontSize: 16,
                  
          //               ),)
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: TextFormField(
          //                 controller: controller.billingAddressCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter Billing Address";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "Billing Address",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
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
          //                 controller: controller.billingCityCtrl,
                    
          //                 autocorrect: true,
          //                 keyboardType: TextInputType.name,
          //                 validator: (val){     
          //                   if(val == null || val.isEmpty){
          //                     return "Enter City";
          //                   }
          //                   return null;
        
          //                 },
          //                 decoration: const InputDecoration(
          //                   hintText: "City",
          //                   hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                   focusedBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                   border: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          //                 ),
          //               ),
          //             ),
          //              // State and Zip code
          //             Padding(
                 
          //                padding:  EdgeInsets.symmetric(
          //                 vertical: 10.r, 
          //                 horizontal: 15.r
          //               ),
          //               child: Row(
                    
          //                 children: [
          //                 Expanded(
          //                   flex: 2,
          //                   // width: Get.width/2.5,
          //                   child:  DropdownButtonFormField(
          //                                         // iconSize: ,
          //                 onChanged: (newValue){
          //                   // controller.selected.value=newValue!;
                      
          //                 },
          //                 value: controller.billingState?.value,
          //                 hint: Text("State", style: HeadingCustom(
          //                 color: ColorCode.ligthGray,
          //                 fbold: FontWeight.bold
          //                 ),),
          //                 isExpanded: true,
          //                 items: [
          //                   for(var value in controller.tierList)
          //                     DropdownMenuItem(
          //                         child: new Text(
          //                           value,
          //                         ),
          //                     value: value.obs,
          //                     ),
          //                 ],
          //                 decoration:  const InputDecoration(
          //                   fillColor: Colors.transparent,
                      
          //   border: OutlineInputBorder(
          //     borderSide: BorderSide(
          //       color: ColorCode.orange
          //     ),
              
          //   ),
          //    enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(
          //                       color: ColorCode.orange
          //                     ),),
          // ),              
          //               ),                         
          //                 ),
          //                 SizedBox(
          //                   width: 15.h,
          //                 ),
          //                 Expanded(
          //                   flex: 2,
          //                   child:  TextFormField(
          //                     controller: controller.billingZipCodeCtrl,
                        
          //                     autocorrect: true,
          //                     keyboardType: TextInputType.name,
          //                     validator: (val){
          //                       if(val!.length == 6){
          //                         return null;
          //                       }
          //                       return "Wrong Zip Code";
        
          //                     },
                        
          //                     decoration:  InputDecoration(
          //                       hintText: "Zip Code",
          //                      hintStyle: TextStyle(
          //                                 fontSize: 16.sp,
          //                                 fontWeight: FontWeight.bold,
          //                                 color: ColorCode.ligthGray),
          //                       focusedBorder: const OutlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: ColorCode.orange
          //                         ),),
          //                       border: const OutlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: ColorCode.orange
          //                         ),
          //                       ),
          //                       enabledBorder: const OutlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: ColorCode.orange
          //                         ),),
          //                     ),
          //                   )
          //                 )
          //                 ],
          //               ),
          //             ),
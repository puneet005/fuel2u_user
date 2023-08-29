import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/business_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';

import 'package:get/get.dart';

class BusinessDetails extends GetView<BusinessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 40.h,),
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
                                            Get.offNamed(Routes.ALLTRUCKINMAP),
                                        child: Image.asset(
                                          "assets/icons/mytruck.png",
                                          width: 50,
                                        ),
                                      )),
                                ),
              SizedBox(height: 50.h,), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Business Details", style: Heading1(
                  color: ColorCode.darkGray
                ),)
              ],
            ),
            
            
         SizedBox(height: 30.h,),
        //  Form Input Feild
          Padding(
                   padding:  EdgeInsets.symmetric(
                    vertical: 10.r, 
                    horizontal: 15.r
                  ),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.employerNameCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Employer Name";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "Employer Name",
                        hintStyle: TextStyle(
                                  fontSize: 18,
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
                    controller: controller.deliveryAddressCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Delivery Address";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "Delivery Address",
                        hintStyle: TextStyle(
                                  fontSize: 18,
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
                    controller: controller.cityCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter City Name";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "City",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                        // controller.selected.value=newValue!;
                        
                      },
                      value: controller.selected?.value,
                      hint: Text("State",  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorCode.ligthGray),),
                      isExpanded: true,
                      items: [
                        for(var value in controller.tierList)
                          DropdownMenuItem(
                              child: new Text(
                                value,
                              ),
                          value: value.obs,
                          ),
                      ],
                      decoration:   InputDecoration(
                        fillColor: Colors.transparent,
                        
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
                          controller: controller.zipCodeCtrl,
                          
                          autocorrect: true,
                          keyboardType: TextInputType.name,
                          validator: (val){
                            if(val!.length == 6){
                              return null;
                            }
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
                    controller: controller.deliveryInstructionsCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    
                    decoration:  InputDecoration(
                      hintText: "Delivery Instructions (optional)",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                    controller: controller.promoCodeCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Promo Code";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "Promo Code Your Employees will Use",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                    controller: controller.contactNameCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Contact Name";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "Contact Name",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                    controller: controller.contactEmailCtrl,
                    
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Contact Email";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "Contact Email",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                    
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                       MaskedInputFormatter('###-###-####')
                    ],
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
                                  fontSize: 18,
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
                        activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
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
                                
                               ),)
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
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter Billing Address";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "Billing Address",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                    validator: (val){     
                      if(val == null || val.isEmpty){
                        return "Enter City";
                      }
                      return null;
        
                    },
                    decoration:  InputDecoration(
                      hintText: "City",
                       hintStyle: TextStyle(
                                  fontSize: 18,
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
                        // controller.selected.value=newValue!;
                        
                      },
                      value: controller.billingState?.value,
                      hint: Text("State", style: TextStyle( 
                                    fontFamily: "",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorCode.ligthGray),),
                      isExpanded: true,
                      items: [
                        for(var value in controller.tierList)
                          DropdownMenuItem(
                              child: new Text(
                                value,
                              ),
                          value: value.obs,
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
                          validator: (val){
                            if(val!.length == 6){
                              return null;
                            }
                            return "Wrong Zip Code";
                          
                          },
                          
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
                SizedBox(height: 30.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.h),
                    child: FillBtn(ontap: (){}, text: "SAVE CHANGES",
                                      Bgcolor: ColorCode.ligthGray,),
                  ),
                                    SizedBox(height: 20.h,),
                                    Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.h),
                                      child: BorderBtn(ontap: (){}, text: "DELETE ACCOUNT",Bgcolor: ColorCode.ligthGray,textColor: ColorCode.ligthGray,),
                                    ),
                                    
                //  FillBtn(ontap: (){
                //   Get.toNamed(Routes.ADDVEHICLE);
                //  }, text: "Save",
                // Bgcolor: ColorCode.ligthGray,),
                SizedBox(height: 30.h,)
        
        
                
            ],
          ),
        ),
      ),
    );
    
  }

  
}
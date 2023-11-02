import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/capitalization.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/edit_order/edit_date.dart';
import 'package:fuel2u_user/view/edit_order/edit_location.dart';
import 'package:fuel2u_user/view/order/select_location.dart';
import 'package:fuel2u_user/view/vehicle/edit_vehicle_details.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class OrderEditAfterCreate extends GetView<OrderController> {
  const OrderEditAfterCreate({super.key});
  
  @override
  Widget build(BuildContext context) {
      OrderController controller = Get.find<OrderController>();
      Future.delayed(
        Duration.zero, (){
          controller.EditOrderDataSet();
  //        
        // controller.editdate =  controller.editOrderDetailsData!.orderDeliveryDay!.split(" ");
        // controller.update();
        }
      );
    return Scaffold(
        body: SafeArea(
            child: GetBuilder(
                init: OrderController(),
                initState: (_) {},
                builder: (_) {
                  return Container(
                      // height: Get.height,
                      child: controller.editLoading.value ?Center(
                          child: CircularProgressIndicator(),
                      ) : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h),
                          child: ListView(
                            shrinkWrap:false,
                            children: [
                            ImageLogoWithRigthIcon(
                                back: InkWell(
                                  onTap: () {
                                    // controller.isEdit.value = false;
                                    // controller.update();
                                    Navigator.of(context).pop();
                                    // Get.back();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/backarrow.svg",
                                    width: 30,
                                  ),
                                ),
                                icon: InkWell(
                                   onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
                                  child: Image.asset(
                                    "assets/icons/mytruck.png",
                                    width: 50,
                                  ),
                                )),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Edit Order",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            // Show Vehicle Ui
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vehicle",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:  controller.iseditSeeMore.value  ?Get.height/3 : Get.height / 5.1,
                                decoration: BoxDecoration(
                                    // color: ColorCode.orange,
                                    border: Border.all(
                                        color: ColorCode.orange, width: 2),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(24))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        // height: Get.height,
                                        color: ColorCode.orange,
                                        child: Column(
                                          children: [
                                            Checkbox(
                                              activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                                              value: true,
                                               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(3)         
                      ),
                                              onChanged: (newValue) {
                                                
                                                // controller.setVehicle(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                controller.vehicleList![controller.selectVehicleIndex].image ==
                                                                            "" || controller.vehicleList![controller.selectVehicleIndex].image == null
                                                                        ? Image.asset(
                                                                            "assets/images/car_img.png", 
                                                                             height:
                                                                                35.h,
                                                                            width:
                                                                                70.h,
                                                                            )
                                                                        : Image
                                                                            .network(
                                                                            ApiUrls.domain +
                                                                                controller.vehicleList![controller.selectVehicleIndex].image!.toString(),
                                                                            height:
                                                                                35.h,
                                                                            width:
                                                                                70.h,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                      Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: 
                                          InkWell(
                                            onTap: (){
                                              PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen:
                                                          EditVehicleDetails(
                                                            data:  controller.vehicleList![controller.selectVehicleIndex]
                                                          ),
                                                      withNavBar: true,
                                                      pageTransitionAnimation:
                                                          PageTransitionAnimation
                                                              .cupertino,
                                                    ).then((value) {
                                                      controller.GetVehicleList();

                                                    });
                                    },
                                            child: Image.asset("assets/icons/edit_icon.png")),
                                          // Icon(
                                          //   Icons.edit_square,
                                          //   color: ColorCode.ligthGray,
                                          // ),
                                        )
                                                ],
                                              ),
                                                  SizedBox(height: 5.h,),
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  controller.vehicleList![controller.selectVehicleIndex].name == null ? Text ("Name of Vehicle",  style: Heading4Medium(),):
                                                  Text(
                                                    "${controller.vehicleList![controller.selectVehicleIndex].name.toString()} ",
                                                    style: Heading4Medium(),
                                                  )
                                                  // Text(
                                                  //   "${controller.vehicleList![controller.selectVehicleIndex].name.toString() ?? "Name of Vehicle"} ",
                                                  //   style: Heading4Medium(),
                                                  // )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${controller.vehicleList![controller.selectVehicleIndex].licensePlate.toString()}",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                               if(controller.iseditSeeMore.value)
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${controller.vehicleList![controller.selectVehicleIndex].color!.name.toString()}",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              if(controller.iseditSeeMore.value)
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              if(controller.iseditSeeMore.value)
                                             Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${controller.vehicleList![controller.selectVehicleIndex].make!.name.toString() }",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              if(controller.iseditSeeMore.value)
                                               SizedBox(
                                                height: 5.h,
                                              ),
                                              if(controller.iseditSeeMore.value)
                                               Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${controller.vehicleList![controller.selectVehicleIndex].model!.name.toString()}",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              if(controller.iseditSeeMore.value)
                                               SizedBox(
                                                height: 5.h,
                                              ),
                                               if(controller.iseditSeeMore.value)
                                             Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${controller.vehicleList![controller.selectVehicleIndex].state!.name.toString()}",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              if(controller.iseditSeeMore.value)
                                               SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      controller.iseditSeeMore.value = !controller.iseditSeeMore.value;
                                                      controller.update();
                                                    },
                                                    child: Text(
                                                      controller.iseditSeeMore.value ? "Less More" :"See More",
                                                      style: HeadingCustomFamliy(
                                                        family: "RobotoRegular",
                                                        color:ColorCode.orange,
                                                        size: 13.sp,
                                                        decoration: TextDecoration.underline
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // SizedBox(
                                              //   height: 10.h,
                                              // ),
                                            ],
                                          ),
                                        )),
                                    //  Flexible(
                                    //     flex: 1,
                                    //     child: Padding(
                                    //       padding: EdgeInsets.all(8.0),
                                    //       child: 
                                    //       Image.asset("assets/icons/edit_icon.png"),
                                    //       // Icon(
                                    //       //   Icons.edit_square,
                                    //       //   color: ColorCode.ligthGray,
                                    //       // ),
                                    //     ))
                                  ],
                                ),
                              ),
                            ),
                            // Select Fuel Type  Ui
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Select Fuel Type",
                                  style: Heading2(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            controller.fuelLoaidng.value ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator()
                      ],
                    ):
                    controller.fuelTypeList!.isEmpty || controller.fuelTypeList == null ? 
                    Center(child: Text("No Fuel Type"),):
                    GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.fuelTypeList!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 190),
                    itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // height: 200,
                     

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectFuelType = index;
                            controller.selectfuelTypeId = controller.fuelTypeList![index].id;
                            controller.update();
                          },
                          child: Container(
                            width: Get.width/4,
                            height: Get.height/6.6,
                             decoration:   BoxDecoration(   
                            color: controller.selectFuelType == index ? ColorCode.orange : Colors.transparent,                       
                          border: Border.all(
                            color: ColorCode.orange,
                            width: 2
                          ),
                           borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24)
                       )
                                      ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/fuel_icon.svg",
                                color : controller.selectFuelType == index  ? ColorCode.white :  ColorCode.orange ),
                                SizedBox(height: 10.h,),
                                Text("${controller.fuelTypeList![index].type}",
                                textAlign: TextAlign.center,
                                 style: Heading5Medium(                                  
                                  color : controller.selectFuelType == index ? ColorCode.white :  ColorCode.black 
                                ),),
                                
                            ]),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text("\$${controller.fuelTypeList![index].price}/ gal",
                         textAlign: TextAlign.center, style: Heading3Medium(),)
                      ],
                    ),
                    );
                    }),
                          
                                  SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Select Amount Needed",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "There is a \$${controller.minFuelType} minimum charge for fuel amount",
                                  style: Heading5Medium(
                                      color: ColorCode.black,
                                      fbold: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 GestureDetector(
                                                            onTap: (){
                                                              controller.changeFuelAmount(1);
                                                              // controller.changePlan(index);
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: ColorCode.orange),
                                                                color: controller.selectFuelAmount.value == 1 ? ColorCode.orange : ColorCode.white,
                                                              ),
                                                            ),
                                                          ),
                               SizedBox(width: 10.h,),
                                Text("I only want \$${controller.minFuelType} of fuel", style: Heading5(
                                  color: ColorCode.black
                                ),)
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  GestureDetector(
                                                            onTap: (){
                                                              controller.changeFuelAmount(2);
                                                              // controller.changePlan(index);
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: ColorCode.orange),
                                                                color: controller.selectFuelAmount.value == 2 ? ColorCode.orange : ColorCode.white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.h,),
                                // Radio(
                                //     value: 2,
                                //     groupValue:
                                //         controller.selectFuelAmount.value,
                                //     onChanged: (value) {
                                //       controller.changeFuelAmount(value);
                                //     }),
                                Text("Fill the tank                  ",style: Heading5(
                                  color: ColorCode.black
                                ),)
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
              //               // Plan Ui
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Plan",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: Get.height / 11,
                                  decoration: BoxDecoration(
                                      // color: ColorCode.orange,
                                      border: Border.all(
                                          color: ColorCode.orange, width: 2),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(24))),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: ColorCode.orange,
                                            child: Column(
                                              children: [
                                                Checkbox(
                                                  activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                                                  value: true,
                                                   shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(3)         
                      ),
                                                  onChanged: (newValue) {
                                                    // controller.selectPlan =  1;
                                                    // controller.update();
                                                    // controller.setVehicle(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 5.h,),
                                                  Text(
                                                   controller.editOrderDetailsData!.orderSubscription ?? "",
                                                    style: Heading4Medium(),
                                                  ),
                                                  //  SizedBox(height: 5.h,),
                                                  // Text(
                                                  //   controller.isPromoCodevalid.value  ? "Employer Promo Code: ${controller.profileData!.promocode}" : "",
                                                  //   style: Heading5(
                                                  //       fbold:
                                                  //           FontWeight.normal),
                                                  // )
                                                ],
                                              ),
                                            ))
                                      ])),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            // Location Ui
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Location",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                             SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: Get.height / 9,
                                  decoration: BoxDecoration(
                                      // color: ColorCode.orange,
                                      border: Border.all(
                                          color: ColorCode.orange, width: 2),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(24))),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: ColorCode.orange,
                                            child: Column(
                                              children: [
                                                Checkbox(
                                                  activeColor: ColorCode.orange,
                      focusColor: ColorCode.orange,
                      side: BorderSide(
                        color: ColorCode.orange,
                      ),
                                                  value: true,
                                                   shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(3)         
                      ),
                                                  onChanged: (newValue) {

                                                    // controller.selectPlan =  1;
                                                    // controller.update();
                                                    // controller.setVehicle(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                   SizedBox(
                              height: 05.h,
                            ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      
                                                      Text(
                                                        "${
                                                         controller.selectLocation ==  null ?
                                                        controller.editOrderDetailsData?.location!.name ?? "" : controller.selectLocation!.name ?? ""}",
                                                        style: Heading4Medium(),
                                                      ),
                                                      // if(controller.editOrderDetailsData!.user!.userType != "")
                                                      if(controller.editOrderDetailsData!.locationId != null)
                                                      InkWell(
                                                        onTap: (){
                                                          // controller.isEdit.value = true;
                                                          controller.update();  
                                                          controller.ProfileApi(context).then((value) => {
                                                          PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: EditLocation(),
                                      withNavBar:
                                          true, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    )   
                                                          }); 
                                                                   
                                                        },
                                                        child: Image.asset("assets/icons/edit_icon.png")),                                                     
                                                    ],
                                                  ),
                                                  SizedBox(
                              height: 05.h,
                            ),
                                                  Text(
                                                    "${  controller.selectLocation ==  null ?
                                                      controller.editOrderDetailsData?.location!.address ?? "" : controller.selectLocation!.address ?? "" }",
                                                    style: Heading5(  
                                                        fbold:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              ),
                                            ))
                                      ])),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            // Payment Method Ui
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     "Payment Method",
              //                     style: Heading2(color: ColorCode.darkGray),
              //                   )
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 5.h,
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                     height: Get.height / 9,
              //                     decoration: BoxDecoration(
              //                         // color: ColorCode.orange,
              //                         border: Border.all(
              //                             color: ColorCode.orange, width: 2),
              //                         borderRadius: BorderRadius.only(
              //                             bottomRight: Radius.circular(24))),
              //                     child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.start,
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           Expanded(
              //                             flex: 1,
              //                             child: Container(
              //                               color: ColorCode.orange,
              //                               child: Column(
              //                                 children: [
              //                                   Checkbox(
              //                                     activeColor: ColorCode.orange,
              //         focusColor: ColorCode.orange,
              //         side: BorderSide(
              //           color: ColorCode.orange,
              //         ),
              //                                     value: true,
              //                                      shape: RoundedRectangleBorder(
              //  borderRadius: BorderRadius.circular(3)         
              //         ),
              //                                     onChanged: (newValue) {
              //                                           controller.isEdit.value = true;
              //                                           controller.update();
              //                       //                     PersistentNavBarNavigator.pushNewScreen(
              //                       //   context,
              //                       //   screen: SelectPaymentMethod(),
              //                       //   withNavBar:
              //                       //       true,
              //                       //   pageTransitionAnimation:
              //                       //       PageTransitionAnimation.cupertino,
              //                       // );                                                
              //                       },
              //                       ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                           Expanded(
              //                               flex: 5,
              //                               child: Padding(
              //                                 padding:
              //                                     const EdgeInsets.all(8.0),
              //                                 child: Column(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.start,
              //                                   crossAxisAlignment:
              //                                       CrossAxisAlignment.start,
              //                                   children: [
              //                                     SizedBox(height: 5.h,),
              //                                     Row(
              //                                       mainAxisAlignment:
              //                                           MainAxisAlignment
              //                                               .spaceBetween,
              //                                       children: [
              //                                         Text(
              //                                           "${controller.editOrderDetailsData.}"
              //                                           // "${controller.selectedCardDetails!.metadata!.name ?? ""}",
              //                                           style: Heading4Medium(),
              //                                         ),
              //                                         InkWell(
              //                                           onTap: (){
              //                                             controller.isEdit.value = true;
              //                                             controller.update();
              //                                       //        PersistentNavBarNavigator
              //                                       //     .pushNewScreen(
              //                                       //   context,
              //                                       //   screen: SelectPaymentMethod(),
              //                                       //   withNavBar:
              //                                       //   true, // OPTIONAL VALUE. True by default.
              //                                       //   pageTransitionAnimation:
              //                                       //   PageTransitionAnimation
              //                                       //       .cupertino,
              //                                       // );
              //                                           },
              //                                           child: Image.asset("assets/icons/edit_icon.png")),
              //                                         // Icon(
              //                                         //   Icons.edit_square,
              //                                         //   color: Colors.grey[400],
              //                                         // )
              //                                       ],
              //                                     ),
              //                                     SizedBox(height: 5.h,),
              //                                     Text(
              //                                       "Card ending in ${controller.selectedCardDetails!.card!.last4 ?? ""}",
              //                                       style: Heading5(
              //                                           fbold:
              //                                               FontWeight.normal),
              //                                     )
              //                                   ],
              //                                 ),
              //                               ))
              //                         ])),
              //               ),
                            // SizedBox(
                            //   height: 40.h,
                            // ),
                            // Select Delivery  Ui
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  "Select Delivery Date",
                                  style: Heading1(color: ColorCode.darkGray),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child:
                                  InkWell(
                                    onTap: (){
                                      controller.isEdit.value = true;
                                      controller.update();
                                                           PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: EditDate(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                                    },
                                    child: Image.asset("assets/icons/edit_icon.png")),
                                  //  Icon(
                                  //   Icons.edit_square,
                                  //   color: Colors.grey[400],
                                  // ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width / 5,
                                  height: Get.height / 8,
                                  decoration: BoxDecoration(
                                      color: ColorCode.orange,
                                      border: Border.all(
                                          color: ColorCode.orange, width: 2),
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(24))),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("${controller.selectdata.isEmpty ? controller.editdate[0] ?? "" : controller.selectdata['day'] }",
                                          // "",
                                            style: HeadingRobotoBold(
                                                size: 13,
                                                color: ColorCode.white)),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "${controller.selectdata.isEmpty ? controller.editdate[1] ?? "" : controller.selectdata['shortData'] }",
                                          style:
                                              HeadingRobotoBold(
                                                size: 16,
                                                color: ColorCode.white),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            // Additional CommentsUi
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Additional Comments",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 15.r),
                              child: TextFormField(
                                maxLength: 27,
                                style: TextFieldStyle(),
                                controller: controller.commentCtrl,
                                textCapitalization: TextCapitalization.words,
                                autocorrect: true,
                                keyboardType: TextInputType.text,
                                // validator: (val) {},
                               inputFormatters: [
    TextCapitalizationFormatter(TextCapitalization.sentences),
  ],
                                decoration:  InputDecoration(
                                   counterText: "",
                                  hintText: "Comments (optional)",
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
                            SizedBox(height: 40.h,),

                             Padding(
                               padding: EdgeInsets.symmetric(
                                horizontal: 15.h
                               ),
                               child: FillBtn(
                                                 Bgcolor:  ColorCode.orange ,
                                                 ontap: () {
                                                  controller.editOrderApi(context);
                                                //  Navigator.pop(context);
                                               //  Get.toNamed(Routes.SELECTDATE);
                                                 }, text: 'REQUEST CHANGES',),
                             ) ,
                  SizedBox(height: 10.h, ),
                  Padding(
                               padding: EdgeInsets.symmetric(
                                horizontal: 15.h
                               ),
                    child: BorderBtn(ontap: () {
                       showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title:  Text("Cancel Order", style: Heading1(),),
                content:  Text("Are your sure to cancel your order", style: Heading3Regular(),),
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
                   controller.cancelOrderApi(context);
                                                }, text: 'YES'),
                                          
                                              ),
                                             ],)
              //      ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
               
              //   onPressed: 
                
              //   () {
              //     Navigator.of(ctx).pop(); 
              //   },             // function used to perform after pressing the button
              //   child: Text('NO'),
              // ),
              // ElevatedButton(
              //   // textColor: Colors.black,
              //   onPressed: ()
              //   async{

              //      Navigator.of(ctx).pop(); 
              //      controller.cancelOrderApi(context);

              //     //  controller.cleanAllData();

               

              //   },
              //   child: Text('YES')
              // ),
                  
                ],
              ),
            );     
                     
                      }, text: 'CANCEL ORDER',),
                  )  ,
                  SizedBox(height: 20.h, ),

                          ])));
                })));
  }
}
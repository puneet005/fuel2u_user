import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
// import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
// import 'package:fuel2u_user/view/home.dart';
import 'package:fuel2u_user/view/order/fuel_type.dart';
import 'package:fuel2u_user/view/vehicle/add_vehicle_in_vehicle_view.dart';
import 'package:fuel2u_user/view/vehicle/edit_vehicle_details.dart';
// import 'package:fuel2u_user/view/vehicle/vehicle_home.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/api_constant.dart';
import '../../widgets/loading_widget.dart';

class NewOrder extends GetView<OrderController> {
  const NewOrder({super.key});

  @override
  Widget build(BuildContext context) {
   OrderController controller = Get.find<OrderController>();
   Future.delayed(Duration.zero,(){
    controller.cleanAllData();
    controller.GetVehicleList();
    
    controller.update(); 
   });
    return GetBuilder(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            body: SafeArea(
                child:  Container(
                  child: RefreshIndicator(
                    onRefresh: () async{
                              controller.GetVehicleList();
                              controller.update(); 
                                                           
                    },
                    child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 10.h),
                          child: ListView(children: [
                            ImageLogoWithRigthIcon(
                                back: InkWell(
                                  onTap: () {
                                    // Get.back();
                                     controller.isEdit.value = false;
                                      controller.update();
                                    Navigator.of(context).pop();
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
                                  "Select Vehicle",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            controller.vehicleListLoading.value
                                ? ListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: List.generate(
                                        5, (index) => ShimmerLoading()),
                                  )
                                : controller.vehicleList == null || controller.vehicleList!.isEmpty 
                                    ? SizedBox(
                                        height: 150.h,
                                        child: Center(
                                          child: Text(
                                            "Not Vehicle Found !!",
                                            style: HeadingCustomFamliy(
                                              size: 22.sp,
                                              color: ColorCode.orange,
                                              fbold: FontWeight.bold,
                                              family: 'RobotaMedium',
                                            ),
                                          ),
                                        ),
                                      )
                                    : ListView(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            controller.vehicleList!.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: controller.vehicleList![index].seeMore ? 200.sp : 143.sp,
                                                    decoration: BoxDecoration(
                                                        // color: ColorCode.orange,
                                                        border: Border.all(
                                                            color:
                                                                ColorCode.orange,
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            24))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            color: controller
                                                                        .selectVehicleIndex ==
                                                                    index
                                                                ? ColorCode.orange
                                                                : Colors
                                                                    .transparent,
                                                            child: Column(
                                                              children: [
                                                                Checkbox(
                                                                  activeColor:
                                                                      ColorCode
                                                                          .orange,
                                                                  focusColor:
                                                                      ColorCode
                                                                          .orange,
                                                                  side:
                                                                      BorderSide(
                                                                    color: ColorCode
                                                                        .orange,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              3)),
                                                                  value: controller
                                                                              .selectVehicleIndex ==
                                                                          index
                                                                      ? true
                                                                      : false,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    controller
                                                                        .setVehicle(
                                                                            index);
                                                                    controller
                                                                            .selectVehicleId =
                                                                        controller
                                                                            .vehicleList![
                                                                                index]
                                                                            .id;
                                                                    controller
                                                                        .update();
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
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 10,
                                                                horizontal: 10,
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [                                                                    
                                                                      controller.vehicleList![index].image == 
                                                                              "" || controller.vehicleList![index].image == null
                                                                          ? Image.asset(
                                                                              "assets/images/car_img.png",
                                                                               height:
                                                                                  35.h,
                                                                            )
                                                                          : Image
                                                                              .network(
                                                                              ApiUrls.domain +
                                                                                  controller.vehicleList![index].image.toString(),
                                                                              height:
                                                                                  35.h,
                                                                              width:
                                                                                  70.h,
                                                                              fit:
                                                                                  BoxFit.fill,
                                                                            ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .topRight,
                                                                        child: InkWell(
                                                                          onTap: (){
                                                                            PersistentNavBarNavigator
                                                          .pushNewScreen(
                                                        context,
                                                        screen:
                                                            EditVehicleDetails(
                                                              data:  controller.vehicleList![index]
                                                            ),
                                                        withNavBar: true,
                                                        pageTransitionAnimation:
                                                            PageTransitionAnimation
                                                                .cupertino,
                                                      ).then((value) {
                                                        controller.GetVehicleList();
                                                        controller.update();
                
                                                      });
                                                                          },
                                                                          child: Image
                                                                              .asset(
                                                                                  "assets/icons/edit_icon.png"),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10.h,
                                                                  ),
                                                                  Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        controller.vehicleList![index].name ==
                                                                                "" ||  controller.vehicleList![index].name == null
                                                                            ? "Name of Vehicle"
                                                                            : controller
                                                                                .vehicleList![index]
                                                                                .name
                                                                                .toString(),
                                                                        style:
                                                                            Heading3Medium(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        "${controller.vehicleList![index].licensePlate}",
                                                                        style:
                                                                            Heading5(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  if(controller.vehicleList![index].seeMore)
                                                                   SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  if(controller.vehicleList![index].seeMore)          
                                                                   Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        "${controller.vehicleList![index].make!.name}",
                                                                        style:
                                                                            Heading5(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  if(controller.vehicleList![index].seeMore)
                                                                   SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  if(controller.vehicleList![index].seeMore)          
                                                                   Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        "${controller.vehicleList![index].model!.name}",
                                                                        style:
                                                                            Heading5(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                   if(controller.vehicleList![index].seeMore)          
                                                                   Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Text(
                                                                        "${controller.vehicleList![index].color!.name}",
                                                                        style:
                                                                            Heading5(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 10.h,),
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: (){       
                                                                            controller.vehicleList![index].seeMore =  !  controller.vehicleList![index].seeMore;
                                                                            controller.update();
                                    //   return null;
                                    // }) ;
                                                                        },                                                                      
                                                                        // onTap: () => Get.toNamed(Routes.ORDERHISTORY),
                                                                        child: Text(
                                                                           controller.vehicleList![index].seeMore ? "See Less" : "See More",
                                                                            style:
                                                                                HeadingCustomFamliy(
                                                                              family:
                                                                                  "RabotoRegular",
                                                                              size:
                                                                                  12.sp,
                                                                              color:
                                                                                  ColorCode.orange,
                                                                              decoration:
                                                                                  TextDecoration.underline,
                                                                              fbold:
                                                                                  FontWeight.w500,
                                                                            )),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                       
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                      ),
                            // Spacer(),
                          ])),
                  ),
                )),
            bottomNavigationBar: Container(
              height: 120.h,
              child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 20.h,
                    // vertical: 10.h
                  ),
                child: Column(
                  children: [
                    FillBtn(
                      Bgcolor: controller.selectVehicleIndex == -1
                          ? ColorCode.ligthGray
                          : ColorCode.orange,
                      ontap: () {
                        if (controller.selectVehicleIndex != -1) {
                          if(controller.isEdit.value){
                              Navigator.of(context).pop();
                          }
                          else{
                          controller.fuelTypeApi();
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: FuelType(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                          // Get.toNamed(Routes.FUELTYPE);
                        }
                        }
                      },
                      text: 'Next',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BorderBtn(
                      ontap: () {
                        AddVehicleController vehiclecontroller =
                      Get.put(AddVehicleController());
                  vehiclecontroller.CleanAllData();

                        controller.newOrderCretating.value = true;
                        controller.update();
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: AddVehicleInVehicleView(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ).then((value) {
                            controller.GetVehicleList();
                        });
                      },
                      text: '+ add a vehicle',
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

/*
const  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Icon(Icons.edit_square, color: ColorCode.ligthGray,)
                  ],
                ),
                  SizedBox(height: 5.h,),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Order Number: XXXXXX", style: Heading5(),)
                  ],
                ),
                  SizedBox(height: 5.h,),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Order Date: YYYY-MM-DD", style: Heading5(),)
                  ],
                ),
                  SizedBox(height: 5.h,),
                 Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Status: Out for Delivery", style: Heading5(),)
                  ],
                ),
                SizedBox(height: 5.h,),
               Row(children: [
                 InkWell(
                      // onTap: () => Get.toNamed(Routes.ORDERHISTORY),
                      child: Text("View details",
                      style: HeadingCustom(
                        color: ColorCode.orange,
                        size: 16,
                        decoration: TextDecoration.underline
                      ),),
                    )
               ],)

 */

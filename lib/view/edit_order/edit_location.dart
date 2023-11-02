import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/location/add_location.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/loading_widget.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class EditLocation extends GetView<OrderController> {
  const EditLocation({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.find<OrderController>(); 
    Future.delayed(Duration.zero, () {
      if(!controller.isEdit.value)
      controller.GetLocationList();
    });
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: GetBuilder(
                init: OrderController(),
                initState: (_) {},
                builder: (_) {
                  return Container(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 10.h),
                          child: Column(children: [
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
                                  "Select Location",
                                  style: Heading1(color: ColorCode.darkGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            // if(controller.profileData!.userType == "User")
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 10.r),
                              child: InkWell(
                                onTap: (){
                                    // VehicleController vehicleController = Get.find<VehicleController>(); 
                                    // vehicleController.g
                                     PersistentNavBarNavigator.pushNewScreen(
                                                      context,
                                                      screen: AddLocation(
                                                       userLive: true,
                                                      ),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    ).then((value) {
                                                      controller.GetLocationList();
                                                    });

                                },
                                child: Row(
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
                                          fbold: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            controller.locationLoading.value
                                ? Center(
                                  child: CircularProgressIndicator(
                                    color: ColorCode.orange,
                                  ),
                                )
                                // ListView(
                                //     shrinkWrap: true,
                                //     physics: NeverScrollableScrollPhysics(),
                                //     children: List.generate(
                                //         2, (index) => ShimmerLoading()),
                                //   ).marginOnly(
                                //     bottom: 50.h
                                //   )
                                : Expanded(
                                    child:
                                        controller.locationList != null ||
                                                controller
                                                    .locationList!.isNotEmpty
                                            ? ListView(
                                                shrinkWrap: true,
                                                children: List.generate(
                                                  controller
                                                      .locationList!.length,
                                                  (index) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.h,
                                                            horizontal: 10.h),
                                                    child: Container(
                                                        height: Get.height / 10,
                                                        decoration:
                                                            BoxDecoration(
                                                                // color: ColorCode.orange,
                                                                border: Border.all(
                                                                    color: ColorCode
                                                                        .orange,
                                                                    width: 2),
                                                                borderRadius: BorderRadius.only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            24))),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  color:  controller.selectLocation ==
                                                                          controller.locationList![index]
                                                                      ? ColorCode
                                                                          .orange
                                                                      : Colors
                                                                          .transparent,
                                                                  child: Column(
                                                                    children: [
                                                                      Checkbox(
                                                                        activeColor:
                                                                            ColorCode.orange,
                                                                        focusColor:
                                                                            ColorCode.orange,
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              ColorCode.orange,
                                                                        ),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(3)),
                                                                        value: controller.selectLocation ==
                                                                                controller.locationList![index]
                                                                            ? true
                                                                            : false,
                                                                        // value: controller.selectAddress == index ? true : false,
                                                                        onChanged:
                                                                            (newValue) {
                                                                          // controller.selectAddress =  index;
                                                                          controller.selectLocation =
                                                                              controller.locationList![index];
                                                                          controller
                                                                              .update();
                                                                          // controller.setVehicle(index);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            8,
                                                                            12,
                                                                            8,
                                                                            8),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              controller.locationList![index].name ?? "",
                                                                              style: Heading4Medium(),
                                                                            ),
                                                                            // Image.asset("assets/icons/edit_icon.png"),
                                                                            // Icon(Icons.edit_square, color: Colors.grey[400],)
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5.h,
                                                                        ),
                                                                        Text(
                                                                          controller.locationList![index].address ?? "",
                                                                          style:
                                                                              Heading5(fbold: FontWeight.normal),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ))
                                                            ])),
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child: Text(
                                                  "No Location Saved!!",
                                                  style: Heading3Medium(),
                                                ),
                                              )),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.h,
                                // vertical: 0.h
                              ),
                              child: FillBtn(
                                Bgcolor: controller.selectLocation == null
                                    ? ColorCode.ligthGray
                                    : ColorCode.orange,
                                ontap: () {
                                  if(controller.isEdit.value){
                                    Navigator.of(context).pop();
                                  }
                                  else{
                                    log(controller.selectVehicleIndex.toString());
                                  if (controller.selectVehicleIndex != -1 && controller.selectLocation != null) {
                                    Navigator.of(context).pop();
                                    // PersistentNavBarNavigator.pushNewScreen(
                                    //   context,
                                    //   screen: SelectPaymentMethod(),
                                    //   withNavBar:
                                    //       true, // OPTIONAL VALUE. True by default.
                                    //   pageTransitionAnimation:
                                    //       PageTransitionAnimation.cupertino,
                                    // );
                                  }
                                  }
                                },
                                text: 'Save',
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            
                          ])));
                })));
  }
}

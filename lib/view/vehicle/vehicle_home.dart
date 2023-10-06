import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/model/vehicle/vehicle_list_model.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/vehicle/add_vehicle_in_vehicle_view.dart';
import 'package:fuel2u_user/view/vehicle/edit_vehicle_details.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/loading_widget.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/api_constant.dart';

class VehicleHome extends StatefulWidget {
  const VehicleHome({super.key});

  @override
  State<VehicleHome> createState() => _VehicleHomeState();
}

class _VehicleHomeState extends State<VehicleHome> {
  @override
  Widget build(BuildContext context) {
    VehicleController controller = Get.put(VehicleController());
    
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<VehicleController>(
            init: VehicleController(),
            initState: (_) {},
            builder: (_) {
              return RefreshIndicator(
                            onRefresh: () async{
                              controller.GetVehicleList();
                            },
                child: Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 10.h),
                        child: ListView(children: [
                          ImageLogoWithRigthIcon(
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
                                "My Vehicles",
                                style: Heading1(color: ColorCode.darkGray),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          controller.vehicleListLoading.value
                              ? ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                      5, (index) => ShimmerLoading()),
                                )
                              : VehileList(controller.vehicleList!)
                        ]))),
              );
            }),
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h
                // vertical: 10.h
                ),
            child: FillBtn(
                ontap: () {
                  AddVehicleController vehiclecontroller =
                      Get.put(AddVehicleController());
                  vehiclecontroller.CleanAllData();

                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: AddVehicleInVehicleView(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                  // Get.toNamed(Routes.ADDVEHICLEINVEHICLEVIEW);
                },
                text: "+ ADD A VEHICLE"),
          )
        ]),
      ),
    );
  }

  Container EmptyUi() {
    return Container(
      height: Get.height / 2.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "You don’t have any vehicles saved. Add one by clicking on the button below.",
                textAlign: TextAlign.center,
                style: Heading1(color: ColorCode.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  VehileList(List<VehicleListModelData> vehicleList) {
    VehicleController controller = Get.put(VehicleController());
    return vehicleList.isEmpty
        ? EmptyUi()
        : ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              vehicleList.length,
              (index) {
                // bool seemore = false;

                return GetBuilder<VehicleController>(
                    init: VehicleController(),
                    initState: (_) {},
                    builder: (_) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.h),
                        child: Container(
                          // height: Get.height / 6,
                          decoration: BoxDecoration(
                              // color: ColorCode.orange,
                              border:
                                  Border.all(color: ColorCode.orange, width: 2),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(24))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            vehicleList[index].image == "" ||  vehicleList[index].image == null
                                                ? Image.asset(
                                                    "assets/images/car_img.png")
                                                : Image.network(
                                                    ApiUrls.domain +
                                                        controller
                                                            .vehicleList![index]
                                                            .image
                                                            .toString(),
                                                    height: 35.h,
                                                    width: 60.h,
                                                    fit: BoxFit.fill,
                                                    loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                                                  ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20,
                                                    horizontal: 10),
                                                child: InkWell(
                                                  onTap: () {
                                                    //  AddVehicleController addvehiclecontroller = Get.find<AddVehicleController>(); 
                                                    //  addvehiclecontroller.updatevehicleData(vehicleList[index]);
                                                    PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen:
                                                          EditVehicleDetails(
                                                            data: vehicleList[index]
                                                          ),
                                                      withNavBar: true,
                                                      pageTransitionAnimation:
                                                          PageTransitionAnimation
                                                              .cupertino,
                                                    );
                                                  },
                                                  child: Image.asset(
                                                      "assets/icons/edit_icon.png"),
                                                ))
                                          ],
                                        ),

                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller.vehicleList![index]
                                                          .name == 
                                                      "" ||  controller.vehicleList![index].name == null
                                                  ? "Name of Vehicle"
                                                  : controller
                                                      .vehicleList![index].name
                                                      .toString(),
                                              // "Name of Vehicle",
                                              style: Heading4Medium(
                                                  // fbold:
                                                  ),
                                            )
                                          ],
                                        ),
                                        if (controller
                                            .vehicleList![index].seeMore)
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                        if (controller
                                            .vehicleList![index].seeMore)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "${controller.vehicleList![index].make!.name}",
                                                    // "${controller.staticvehicleList[index]['make']}",
                                                    // "Name of Vehicle",
                                                    style: Heading5(),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                "${controller.vehicleList![index].model!.name}",
                                                // "Name of Vehicle",
                                                style: Heading5(),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                "${controller.vehicleList![index].color!.name}",
                                                // "Name of Vehicle",
                                                style: Heading5(),
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
                                              // "License Plate",
                                              style: Heading5(),
                                            )
                                          ],
                                        ),
                                        if (controller
                                            .vehicleList![index].seeMore)
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                        if (controller
                                            .vehicleList![index].seeMore)
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${controller.vehicleList![index].state!.code}",
                                                style: Heading5(),
                                              )
                                            ],
                                          ),

                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        // if(seemore)
                                        //  Row(
                                        //   // mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: [
                                        //     Text(
                                        //       "License Plate",
                                        //       style: Heading5(),
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(
                                        //   height: 5.h,
                                        // ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.vehicleList![index]
                                                        .seeMore =
                                                    !controller
                                                        .vehicleList![index]
                                                        .seeMore;
                                                // controller.staticvehicleList[index]['seemore'] =  !controller.staticvehicleList[index]['seemore'];
                                                controller.update();
                                                // seemore = !seemore;
                                              },
                                              child: Text(
                                                controller.vehicleList![index]
                                                        .seeMore
                                                    ? "See less"
                                                    : "See More",
                                                style: HeadingCustomFamliy(
                                                    family: "RobotoRegular",
                                                    color: ColorCode.orange,
                                                    size: 12.sp,
                                                    decoration: TextDecoration
                                                        .underline),
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
                            ],
                          ),
                        ),
                      );
                    });
              },
            ));
  }
}

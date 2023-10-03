import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class NearYourTruck extends GetView<OrderController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GetBuilder<OrderController>(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
          return Container(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: controller.center,
                      zoom: 10.0,
                    ),
                    markers: controller.markers,
                  ),
                  Positioned(
                    top: 50,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const CircleAvatar(
                        backgroundColor: ColorCode.yellow,
                  radius: 25,
                  child: Icon(
                    Icons.close,
                    // weight: 10,
                    size: 30,
                    color: ColorCode.white,
                  ),
                ),
              ),
            ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorCode.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    )
                  ),
                height: Get.height/4,
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Divider(
                      thickness: 5,
                      color: ColorCode.ligthGray,
                      indent: 50.h,
                      endIndent: 50.h,
                    ),
                     SizedBox(height: 10.h,),
                    // Container(
                    //   child: Text("Your driver is <X.X> miles away", style: Heading3(),),
                    // ),
                    Container(
                      child: Text("Truck is <X.X> miles away Fuel type: <Octane 87>", style: Heading3(),),
                    ),
                    
                  ],)
                          ),
              )
          ],
        ),
      );},
      )
    );
  }
  }
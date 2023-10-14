

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/order_controller.dart';

import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class NearYourTruck extends StatefulWidget {
  const NearYourTruck({super.key});

  @override
  State<NearYourTruck> createState() => _NearYourTruckState();
}

class _NearYourTruckState extends State<NearYourTruck> {
   OrderController controller = Get.find<OrderController>();
   bool loadingis=  true;
  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
    Future.delayed(Duration.zero,(){
      setState(() {
        loadingis = true;
      });
    });
   
}

// @override
// void didChangeDependencies() {
//   getLocation();
//   super.didChangeDependencies();
  
// }

Future<void> getLocation() async {
     bool res = 
     await controller.getCurrentPosition();
     if(res){
        Future.delayed(Duration(
      seconds: 3
    ),(){
      loadingis = false;
      setState(() {

      });
      
    });
      
      print("calling getLocation");            
      
      controller.ShowTruckInMap();
     }
     else{
         Future.delayed(Duration(
      seconds: 3
    ),(){
      loadingis = false;
      setState(() {
        
      });
      
    });
     }
  }


//  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder<OrderController>(
          init: OrderController(),
          initState: (_) {}, 
          builder: (_) {
            return  loadingis ? Container(
              height: Get.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ): Container(
                child: Stack(
                  children: [
                    GoogleMap(
                  onMapCreated:
                  // controller.onMapCreated,
                  (mapControl) {
            // setState(() {
              controller.mapController = mapControl;
              controller.update();
            // });
          },
                    initialCameraPosition: CameraPosition(
                        target: controller.center,
                        zoom: 15.0,
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
                      controller.alltruckinMap.value ? 
                      Center(
                        child: CircularProgressIndicator(),
                      ): 
                      Container(
                        child:
                        controller.driverList == [] || controller.driverList.isEmpty ?  Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 10.h
                          ),
                          child: Text(" Not Truck Found\nNear You Location", style: Heading4Medium(),),
                        ):
                         Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 10.h
                          ),
                          child: Text("Truck is  ${controller.driverList[controller.selectDriver.value].distance!.toStringAsFixed(2) ?? ""} miles away Fuel type: ${controller.driverList[controller.selectDriver.value].fuelTypes ?? ""}", style: Heading4Medium(),),
                          // ${controller.driverList[controller.selectDriver.value].distance} 
                          //
                        ),
                      ),
                      
                    ],)
                            ),
                )
            ],
          ),
        );},
      ),
    );
  }


double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
        cos(lat1 * p) * cos(lat2 * p) * 
        (1 - cos((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}
@override
void dispose() {
  // if(controller.socket!.connected){
  // if(controller.socket != null){
  controller.socket!.disconnected;
  // }
  // }
  // else{
  //    controller.socket!.disconnected;
  // }
  super.dispose();
}






}




// class NearYourTruck extends GetView<OrderController>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: GetBuilder<OrderController>(
//         init: OrderController(),
//         initState: (_) {},
//         builder: (_) {
//           return Container(
//               child: Stack(
//                 children: [
//                   GoogleMap(
//                     onMapCreated: controller.onMapCreated,
//                     initialCameraPosition: CameraPosition(
//                       target: controller.center,
//                       zoom: 10.0,
//                     ),
//                     markers: controller.markers,
//                   ),
//                   Positioned(
//                     top: 50,
//                     right: 30,
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: const CircleAvatar(
//                         backgroundColor: ColorCode.yellow,
//                   radius: 25,
//                   child: Icon(
//                     Icons.close,
//                     // weight: 10,
//                     size: 30,
//                     color: ColorCode.white,
//                   ),
//                 ),
//               ),
//             ),
//               Positioned(
//                 bottom: 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: ColorCode.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30.0),
//                       topRight: Radius.circular(30.0)
//                     )
//                   ),
//                 height: Get.height/4,
//                 width: Get.width,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 10.h,),
//                     Divider(
//                       thickness: 5,
//                       color: ColorCode.ligthGray,
//                       indent: 50.h,
//                       endIndent: 50.h,
//                     ),
//                      SizedBox(height: 10.h,),
//                     // Container(
//                     //   child: Text("Your driver is <X.X> miles away", style: Heading3(),),
//                     // ),
//                     Container(
//                       child: Text("Truck is <X.X> miles away Fuel type: <Octane 87>", style: Heading4Medium(),),
//                     ),
                    
//                   ],)
//                           ),
//               )
//           ],
//         ),
//       );},
//       )
//     );
//   }
//   }
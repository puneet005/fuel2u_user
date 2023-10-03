import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/vehicle/add_vehicle_in_vehicle_view.dart';
import 'package:fuel2u_user/view/vehicle/edit_vehicle_details.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
        child:GetBuilder<VehicleController>(
      init: VehicleController(),
      initState: (_) {},
      builder: (_) {
            return  Container(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 10.h
                ),
                child: ListView(
                  children: [
                    ImageLogoWithRigthIcon(icon: InkWell(
                      onTap: ()=> Get.toNamed(Routes.ALLTRUCKINMAP),
                      child: Image.asset("assets/icons/mytruck.png", width: 50,),
                    )),
                    SizedBox(height: 40.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("My Vehicles", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  controller.emptyVehicleList.value ? EmptyUi() : VehileList()
                  ])));}),
                  
                  ),
                  bottomNavigationBar: Container(
                    height: 70.h,
                    child: Column(
                      
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 15.h
                            // vertical: 10.h
                          ),
                          child: FillBtn(ontap: (){
                              PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: AddVehicleInVehicleView(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                            // Get.toNamed(Routes.ADDVEHICLEINVEHICLEVIEW);
                          }, text: "+ ADD A VEHICLE"),
                        )
                      ]),
                  ),
    
  );
  }
  Container EmptyUi(){
    return Container(
      height: Get.height/2.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              
              child: Text("You don’t have any vehicles saved. Add one by clicking on the button below.", 
              textAlign: TextAlign.center,
              style: Heading1(
          
                color: ColorCode.orange
              ),),
            ),
          ),
        ],
      ),
    );
  }

  VehileList(){
       VehicleController controller = Get.put(VehicleController());
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(controller.vehicleList.length, (index) {
        // bool seemore = false;

        return  GetBuilder<VehicleController>(
          init: VehicleController(),
          initState: (_) {},
          builder: (_) {
            return Padding(
                                       padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                      child: Container(
                                        // height: Get.height / 6,
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
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        
                                                        children: [
                                                          Image.asset(
                                                              "assets/images/car_img.png"),
                                                               Padding(
                                          padding: EdgeInsets.symmetric(
                                             vertical: 20,
                                             horizontal: 10
                                          ),
                                          child: InkWell(
                                            onTap: () =>    PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: EditVehicleDetails(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    ),
                                            // Get.toNamed(Routes.EDITVEHICLEDETAILS),
                                            child:Image.asset("assets/icons/edit_icon.png"),
                                            // const Icon(
                                            //   Icons.edit_square,
                                            //   color: ColorCode.ligthGray,
                                            // ),
                                          ))
                                                        ],
                                                      ),

                                                      Row(
                                                        // mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            "${controller.vehicleList[index]['vehicleName']}",
                                                            // "Name of Vehicle",
                                                            style: Heading4Medium(
                                                              // fbold: 
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      if(controller.vehicleList[index]['seemore'])
                                                       SizedBox(
                                                        height: 5.h,
                                                      ),
                                                       if(controller.vehicleList[index]['seemore'])
                                                       
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                           Row(
                                                             children: [

                                                               Text(
                                                                "${controller.vehicleList[index]['make']}",
                                                                // "Name of Vehicle",
                                                                style: Heading5(),
                                                          ),
                                                             ],
                                                           ),
                                                       SizedBox(
                                                 height: 5.h,
                                              ),
                                                   Text(
                                                    "${controller.vehicleList[index]['model']}",
                                                    // "Name of Vehicle",
                                                    style: Heading5(),
                                                  ),
                                                                                                 SizedBox(
                                                height: 5.h,
                                              ),
                                                  Text(
                                                    "${controller.vehicleList[index]['color']}",
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
                                                    "${controller.vehicleList[index]['plate']}",
                                                    // "License Plate",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              if(controller.vehicleList[index]['seemore'])
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              if(controller.vehicleList[index]['seemore'])
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                   "${controller.vehicleList[index]['state']}",
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
                                                      controller.vehicleList[index]['seemore'] =  !controller.vehicleList[index]['seemore'];
                                                      controller.update();
                                                      // seemore = !seemore;
                                                     

                                                    },
                                                    child: Text(
                                                      controller.vehicleList[index]['seemore'] ? "See less" :  "See More",
                                                      style: HeadingCustomFamliy(
                                                        family: "RobotoRegular",
                                                          color:
                                                              ColorCode.orange,
                                                          size: 12.sp,
                                                          decoration:
                                                              TextDecoration
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
                                    //  Flexible(
                                    //     flex: 1,
                                    //     child: Padding(
                                    //       padding: EdgeInsets.symmetric(
                                    //          vertical: 20,
                                    //       ),
                                    //       child: InkWell(
                                    //         onTap: () => Get.toNamed(Routes.EDITVEHICLEDETAILS),
                                    //         child:Image.asset("assets/icons/edit_icon.png"),
                                    //         // const Icon(
                                    //         //   Icons.edit_square,
                                    //         //   color: ColorCode.ligthGray,
                                    //         // ),
                                    //       ),
                                    //     ))
                                  ],
                                ),
                              ),
                            );
      })    ; 
          },
        )   


    );
  }
}

// class VehicleHome extends GetView<VehicleController>{




//   @override
//   Widget build(BuildContext context) {
//     VehicleController controller = Get.put(VehicleController());
//     // TODO: implement build
//   return Scaffold(
//       body: SafeArea(
//         child:GetBuilder<VehicleController>(
//       init: VehicleController(),
//       initState: (_) {},
//       builder: (_) {
//             return  Container(
//               child: Padding(
//                 padding:  EdgeInsets.symmetric(
//                   horizontal: 10.h,
//                   vertical: 10.h
//                 ),
//                 child: ListView(
//                   children: [
//                     ImageLogoWithRigthIcon(icon: InkWell(
//                       onTap: ()=> Get.toNamed(Routes.ALLTRUCKINMAP),
//                       child: Image.asset("assets/icons/mytruck.png", width: 50,),
//                     )),
//                     SizedBox(height: 20.h,),
//                     Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("My Vehicles", style: Heading1(
//                         color: ColorCode.darkGray
//                       ),)
//                     ],
//                   ),
//                   SizedBox(height: 20.h,),
//                   controller.emptyVehicleList.value ? EmptyUi() : VehileList()
//                   ])));}),
                  
//                   ),
//                   bottomNavigationBar: Container(
//                     height: 70.h,
//                     child: Column(
                      
//                       children: [
//                         FillBtn(ontap: (){}, text: "+ ADD A VEHICLE")
//                       ]),
//                   ),
    
//   );
//   }
//   Container EmptyUi(){
//     return Container(
//       height: Get.height/2.2,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
            
//             child: Text("You don’t have any vehicles saved. Add one by clicking on the button below.", 
//             textAlign: TextAlign.center,
//             style: Heading1(

//               color: ColorCode.orange
//             ),),
//           ),
//         ],
//       ),
//     );
//   }

//   VehileList(){
//     return ListView(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       children: List.generate(2, (index) {
//         final seemore = false;

//         return  Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 // height: Get.height / 6,
//                                 decoration: BoxDecoration(
//                                     // color: ColorCode.orange,
//                                     border: Border.all(
//                                         color: ColorCode.orange, width: 2),
//                                     borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(24))),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
                                   
//                                     Expanded(
//                                         flex: 5,
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                             vertical: 20,
//                                             horizontal: 10,
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Image.asset(
//                                                   "assets/images/car_img.png"),
//                                               Row(
//                                                 // mainAxisAlignment: MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     "Name of Vehicle",
//                                                     style: Heading3(),
//                                                   )
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: 5.h,
//                                               ),
//                                               Row(
//                                                 // mainAxisAlignment: MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     "License Plate",
//                                                     style: Heading5(),
//                                                   )
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: 5.h,
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: () {
//                                                       setState(){};

//                                                     },
//                                                     child: Text(
//                                                       "See More",
//                                                       style: HeadingCustom(
//                                                           color:
//                                                               ColorCode.orange,
//                                                           size: 16,
//                                                           decoration:
//                                                               TextDecoration
//                                                                   .underline),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                               // SizedBox(
//                                               //   height: 10.h,
//                                               // ),
//                                             ],
//                                           ),
//                                         )),
//                                     const Flexible(
//                                         flex: 1,
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                              vertical: 20,
//                                           ),
//                                           child: Icon(
//                                             Icons.edit_square,
//                                             color: ColorCode.ligthGray,
//                                           ),
//                                         ))
//                                   ],
//                                 ),
//                               ),
//                             );
//       }),


//     );
//   }
// }
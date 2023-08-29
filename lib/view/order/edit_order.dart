import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class EditOrder extends GetView<OrderController> {
  const EditOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GetBuilder<OrderController>(
                init: OrderController(),
                initState: (_) {},
                builder: (_) {
                  return Container(
                      // height: Get.height,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 10.h),
                          child: ListView(
                            shrinkWrap:false,
                            children: [
                            ImageLogoWithRigthIcon(
                                back: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    // Get.back();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/backarrow.svg",
                                    width: 30,
                                  ),
                                ),
                                icon: InkWell(
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
                                height: Get.height / 5.2,
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
                                                  Image.asset(
                                                      "assets/images/car_img.png"),
                                                      Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: 
                                          Image.asset("assets/icons/edit_icon.png"),
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
                                                  Text(
                                                    "Name of Vehicle",
                                                    style: Heading4Medium(),
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
                                                    "License Plate",
                                                    style: Heading5(),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    // onTap: () => Get.toNamed(Routes.ORDERHISTORY),
                                                    child: Text(
                                                      "See More",
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
                            GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.fuelTypeList.length,
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 180),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Container(
                                    // height: 200,

                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.selectFuelType =
                                                index;
                                            controller.update();
                                          },
                                          child: Container(
                                            width: Get.width / 4,
                                            height: 110.h,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .selectFuelType ==
                                                        index
                                                    ? ColorCode.orange
                                                    : Colors.transparent,
                                                border: Border.all(
                                                    color: ColorCode.orange,
                                                    width: 2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(
                                                                24))),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/icons/fuel_icon.svg",
                                                      color: controller
                                                                  .selectFuelType ==
                                                              index
                                                          ? ColorCode.white
                                                          : ColorCode
                                                              .orange),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    "${controller.fuelTypeList[index]}",
                                                    style: Heading5Medium(
                                                        color: controller
                                                                    .selectFuelType ==
                                                                index
                                                            ? ColorCode
                                                                .white
                                                            : ColorCode
                                                                .black),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "\$X.XX / gal",
                                          style: Heading4Medium(),
                                        )
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
                                  "There is a \$20 minimum charge for fuel amount",
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
                                Text("I only want \$20 of fuel", style: Heading5(
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
                            // Plan Ui
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
                                                  SizedBox(height: 5.h,),
                                                  Text(
                                                    "Business",
                                                    style: Heading4Medium(),
                                                  ),
                                                   SizedBox(height: 5.h,),
                                                  Text(
                                                    "Employer Promo Code: XXXXXX",
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
                                                        "Home",
                                                        style: Heading4Medium(),
                                                      ),
                                                      Image.asset("assets/icons/edit_icon.png"),
                                                      // Icon(
                                                      //   Icons.edit_square,
                                                      //   color: Colors.grey[400],
                                                      // )
                                                    ],
                                                  ),
                                                  SizedBox(
                              height: 05.h,
                            ),
                                                  Text(
                                                    "Address",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: Heading2(color: ColorCode.darkGray),
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
                                                  SizedBox(height: 5.h,),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Credit/Debit Card",
                                                        style: Heading4Medium(),
                                                      ),
                                                      Image.asset("assets/icons/edit_icon.png"),
                                                      // Icon(
                                                      //   Icons.edit_square,
                                                      //   color: Colors.grey[400],
                                                      // )
                                                    ],
                                                  ),
                                                  SizedBox(height: 5.h,),
                                                  Text(
                                                    "Card ending in XXXX",
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
                                  Image.asset("assets/icons/edit_icon.png"),
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
                                        Text("Tue",
                                            style: HeadingRobotoBold(
                                                size: 13,
                                                color: ColorCode.white)),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "25",
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
                                style: TextFieldStyle(),
                                controller: controller.commentCtrl,
                                autocorrect: true,
                                keyboardType: TextInputType.name,
                                // validator: (val) {},
                                decoration:  InputDecoration(
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
                                                 
                                               //  Get.toNamed(Routes.SELECTDATE);
                                                 }, text: 'REQUEST CHANGES',),
                             ) ,
                  SizedBox(height: 10.h, ),
                  Padding(
                               padding: EdgeInsets.symmetric(
                                horizontal: 15.h
                               ),
                    child: BorderBtn(ontap: () {
                     
                      }, text: 'CANCEL ORDER',),
                  )  ,
                  SizedBox(height: 20.h, ),

                          ])));
                })));
  }
}

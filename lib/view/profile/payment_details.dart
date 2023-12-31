import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/profile/add_card.dart';
import 'package:fuel2u_user/view/profile/edit_card_details.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../widgets/logo_rigth_icon.dart';

class PaymentDetails extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder(
              init: VehicleController(),
              initState: (_) {},
              builder: (_) {
                return Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 10.h),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: ImageLogoWithRigthIcon(
                                back: InkWell(
                                  onTap: () {
                                    // Get.back();n
                                    Navigator.of(context).pop();
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
                          SizedBox(
                            height: 50.h,
                          ),
                           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Payment Methods", style: Heading1(
                  color: ColorCode.darkGray
                ),)
              ],
            ),
            if(!controller.paymentdataloading.value)
            SizedBox(height: 40.h,),
            // SizedBox(height: ,)
                          controller.paymentdataloading.value
                              ? EmptyUi()
                              : PaymentList(context),
                          Spacer(),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 10.h
                            ),
                            child: FillBtn(ontap: () {
                               PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: AddCard(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                              // Get.toNamed(Routes.ADDCARD);
                            }, text: "+ ADD A PAYMENT METHOD"),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ])));
              })),
    );
  }

  Container EmptyUi() {
    return Container(
      height: Get.height / 2.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70.h,),
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 10.h
              ),
              child: Text(
                "You haven’t added any payment methods yet.",
                textAlign: TextAlign.center,
                style: Heading1(color: ColorCode.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PaymentList(BuildContext context) {
    VehicleController controller = Get.put(VehicleController());
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(controller.cardList.length, (index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: Get.height / 10,
                  decoration: BoxDecoration(
                      // color: ColorCode.orange,
                      border: Border.all(color: ColorCode.orange, width: 2),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(24))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.cardList[index],
                                        style: Heading4Medium(),
                                      ),
                                      InkWell(
                                          onTap: () {
                                             PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: EditCardDetails(),
                                                      withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                    );
                                           
                                          },
                                           child: Image.asset("assets/icons/edit_icon.png"),
                                         
                                          )
                                    ],
                                  ),
                                  SizedBox(height: 5.h,),
                                  Row(
                                    children: [
                                      Text(
                                        "Card ending in XXXX",
                                        style: Heading5(fbold: FontWeight.normal),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ])));
        }));
  }
}

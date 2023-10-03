import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/premiun_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';

class AddPromoCode extends GetView<PremiunController> {
  const AddPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    PremiunController controller = Get.find<PremiunController>();
    return Scaffold(
      body: GetBuilder(
          init: PremiunController(),
          initState: (_) {},
          builder: (_) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: SizedBox(
                    height: Get.height / 1.1,
                    child: Form(
                      child: Column(children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: ImageLogoWithRigthIcon(
                              back: InkWell(
                                onTap: () {
                                  
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/backarrow.svg",
                                  width: 30,
                                ),
                              ),
                              icon: InkWell(
                                onTap: () => Get.offNamed(Routes.ALLTRUCKINMAP),
                                child: Image.asset(
                                  "assets/icons/mytruck.png",
                                  width: 50,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Business",
                            textAlign: TextAlign.center,
                            style: HeadingCustom(
                                size: 22,
                                fbold: FontWeight.bold,
                                color: ColorCode.darkGray),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Enter the promo code provided by your Employer",
                            textAlign: TextAlign.center,
                            style: HeadingCustom(
                                size: 20,
                                fbold: FontWeight.normal,
                                color: ColorCode.darkGray),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.r, horizontal: 15.r),
                          child: TextFormField(
                            style: TextFieldStyle(),
                            controller: controller.promoCodeCtrl,
                            autocorrect: true,
                            keyboardType: TextInputType.name,
                            onChanged: (val) {},
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Enter Promo Code";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Promo Code",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCode.ligthGray),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorCode.orange),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorCode.orange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorCode.orange),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        FillBtn(
                            ontap: () {
                              Get.offAndToNamed(Routes.HOME);
                            },
                            text: "SAVE"),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom))
                      ]),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

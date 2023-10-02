import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/image_logo.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class PromoCode extends GetView<SignUpController> {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<NotAvailableAreaController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder(
            init: SignUpController(),
            initState: (_) {},
            builder: (_) {
              return Container(
                height: Get.height,
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        ImageLogo(),
                       SizedBox(height: 40.h,), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome! Let’s Get Started.",
                              style: Heading1(color: ColorCode.darkGray),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.r, horizontal: 15.r),
                          child: Text(
                              "Do you have a Promo Code from your employer?",
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Heading1(color: ColorCode.darkGray)),
                        ),
                         SizedBox(height: 20.h,),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                                            onTap: (){
                                                              controller.setYesOrNo(1);
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: ColorCode.orange),
                                                                color: controller.promodeYesOrNo.value == 1 ? ColorCode.orange : ColorCode.white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.h,),
                             
                                  Text(
                                    "Yes",
                                    style: Heading2(),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [                                
                                   GestureDetector(
                                                            onTap: (){
                                                              controller.setYesOrNo(2);                                                           
                                                            },
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: ColorCode.orange),
                                                                color: controller.promodeYesOrNo.value == 2 ? ColorCode.orange : ColorCode.white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.h,),
                                  Text(
                                    "No ",
                                    style: Heading2(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (controller.promodeYesOrNo == 1)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.r, horizontal: 15.r),
                            child: TextFormField(
                              style: TextFieldStyle(),
                              controller: controller.promoCodeCtrl,
                              autocorrect: true,
                              keyboardType: TextInputType.name,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  controller.getVaildPromoCode();
                                } else {
                                  controller.getNotVaildPromoCode();
                                }
                              },
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Enter Promo Code";
                                }
                                return null;
                              },
                              decoration:  InputDecoration(
                                hintText: "Promo Code",
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorCode.ligthGray),
                                focusedBorder:  MainBorder(),
                                border:  MainBorder(),
                                enabledBorder:  MainBorder(),
                              ),
                            ),
                          ),
                        Spacer(),
                        if (controller.promodeYesOrNo == 1)
                          !controller.promoCodeVaild.value
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.h),
                                  child: FillBtn(
                                    ontap: () {},
                                    text: "Next",
                                    Bgcolor: ColorCode.ligthGray,
                                  ),
                                )
                              : Padding(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 15.h
                                ),
                                child: FillBtn(
                                    ontap: () {
                                      controller.PromoCodeAPi(context);
                                      // 
                                    },
                                    text: "Next"),
                              ),
                        if (controller.promodeYesOrNo == 2)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.h),
                            child: FillBtn(
                                ontap: () {
                                  Get.toNamed(Routes.SELECTPLAN);
                                },
                                text: "Next"),
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: BorderBtn(ontap: () {
                            Get.toNamed(Routes.SELECTPLAN);
                          }, text: "SKIP FOR NOW"),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
//   },
// )

//     );
  }
}

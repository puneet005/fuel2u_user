import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/deliveryzipcode_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:get/get.dart';

class DeliveryZipCode extends GetView<DeliveryZipCodeController> {
  const DeliveryZipCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<DeliveryZipCodeController>();
    //  Get.lazyPut<DeliveryZipCodeController>(() => DeliveryZipCodeController());
    return Scaffold(
      body:  Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 15.h
            ),
        child: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 60.h,
                    width: 100.w,
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter Your Delivery Zip Code",
                    style: Heading1(color: ColorCode.darkGray),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                child: TextFormField(
                  
                  style: TextFieldStyle(),       
                  controller: controller.zipcode,
                  onChanged: (val) {
                    if (val.length == 6) {
                      controller.getColors();
                    } else {
                      controller.getColorsFalse();
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/location_icon.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    hintText: "Delivery Fual to ?",
                    hintStyle: TextStyle(
                        color: ColorCode.ligthGray, fontWeight: FontWeight.w700),
                    focusedBorder:  MainBorder(),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCode.orange),
                      // InputBorder? errorBorder,
                      // InputBorder? focusedBorder,
                      // InputBorder? focusedErrorBorder,
                      // InputBorder? disabledBorder,
                    ),
                    enabledBorder:  MainBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                child: Container(
                  // width: ScreenUtil().screenWidth/2,
                  child: Row(
                    children: [
                      Icon(Icons.near_me_rounded,
                          size: 28, color: ColorCode.orange),
                      Text(
                        "Use Current Location",
                        style: Heading3(color: ColorCode.orange),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              // FillBtn(ontap: (){}, text: "Confirm Address",
              // Bgcolor: ColorCode.darkGray,),
      
               Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 15.h
            ),
                child: Obx(() => !controller.zipCodeVaild.value
                    ? FillBtn(
                        ontap: () {},
                        text: "Confirm Address",
                        Bgcolor: ColorCode.ligthGray,
                      )
                    : FillBtn(
                        ontap: () {
                          Get.toNamed(Routes.NOTAVAILABLEAREA);
                        },
                        text: "Confirm Address",
                      )),
              ),
      
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

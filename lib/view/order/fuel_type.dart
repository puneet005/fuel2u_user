import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/controller/sign_up_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/view/order/select_location.dart';
import 'package:fuel2u_user/view/order/select_plan.dart';
// import 'package:fuel2u_user/view/premium/plan_list.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import '../../routes/app_pages.dart';

class FuelType extends  GetView<OrderController>{
  const FuelType({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpController profilecontroller = Get.find<SignUpController>(); 
    Future.delayed(Duration(seconds: 5), (){
      controller.loadingFlase();
    });
      return Scaffold(
          body: SafeArea(
          child:GetBuilder(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
              return  Container(
                height: Get.height,
                child: controller.loadingAllData.value? Center(
                  child: CircularProgressIndicator()
                ) : Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 10.h
                  ),
                  child: controller.fuelLoaidng.value ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator()
                      ],
                    ):ListView(
                    children: [
                      ImageLogoWithRigthIcon(
                        back: InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            // Get.back();
                          },
                        child: SvgPicture.asset("assets/icons/backarrow.svg", width: 30,),
                      ),
                        icon: InkWell(
                           onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
                        child: Image.asset("assets/icons/mytruck.png", width: 50,),
                      )),
                      SizedBox(height: 40.h,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select Fuel Type", style: Heading1(
                          color: ColorCode.darkGray
                        ),)
                      ],
                      ),
                      SizedBox(height: 30.h,),
                    
                    controller.fuelTypeList!.isEmpty || controller.fuelTypeList == null ? 
                    Center(child: Text("No Fuel Type"),):
                    GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.fuelTypeList!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 180),
                    itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // height: 200,                    
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectFuelType = index;
                            controller.selectfuelTypeId = controller.fuelTypeList![index].id;
                            controller.update();
                          },
                          child: Container(
                            width: Get.width/4,
                            height: Get.height/6,
                             decoration:   BoxDecoration(   
                            color: controller.selectFuelType == index ? ColorCode.orange : Colors.transparent,                       
                          border: Border.all(
                            color: ColorCode.orange,
                            width: 2
                          ),
                           borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24)
                       )
                                      ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/fuel_icon.svg",
                                color : controller.selectFuelType == index ? ColorCode.white :  ColorCode.orange ),
                                SizedBox(height: 10.h,),
                                Text("${controller.fuelTypeList![index].type}",
                                textAlign: TextAlign.center,
                                 style: Heading5Medium(                                  
                                  color : controller.selectFuelType == index ? ColorCode.white :  ColorCode.black 
                                ),),
                                
                            ]),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text("\$${controller.fuelTypeList![index].price}/ gal",
                         textAlign: TextAlign.center, style: Heading3Medium(),)
                      ],
                    ),
                    );
                    }),
                    SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Select Amount Needed", style: Heading1(
                        color: ColorCode.darkGray
                      ),)
                    ],
                    ),
                     SizedBox(height: 10.h,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("There is a \$${controller.minFuelType} minimum charge for fuel amount", style: Heading5Medium(
                        color: ColorCode.black,
                        fbold: FontWeight.normal
                      ),)
                    ],
                    ),
                     SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                                                            onTap: (){
                                                              controller.fuelQuantity = "I only want \$${controller.minFuelType} of fuel";
                                                              controller.update();
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
                        Text("I only want \$${controller.minFuelType} of fuel", style: Heading5(
                        color: ColorCode.black,
                        fbold: FontWeight.w600
                        
                      ),)
                      ],
                    ),
                     SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                                                            onTap: (){
                                                            controller.fuelQuantity = "Fill the tank";
                                                            controller.update();
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
                                                            Text("Fill the tank                   ", 
                                                            style: Heading5(
                        color: ColorCode.black,
                        fbold:  FontWeight.w600
                      ),)
                      ],
                    ),
                      SizedBox(height: 20.h,), 
                    // Spacer(),                   
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                // vertical: 0.h
              ),
              child: FillBtn(
                Bgcolor:  controller.selectFuelType != -1 && controller.selectFuelAmount != 0 ?  ColorCode.orange : ColorCode.ligthGray,
                ontap: (){
                  if(controller.selectFuelType != -1 && controller.selectFuelAmount != 0){
                                           controller.selectPlan = -1;
                                           controller.update();
                    controller.ProfileApi(context).then((value) {                    
                      if(controller.profileData!.userType == "Family User"){
                            controller.planId = controller.profileData!.subscription!.planId ?? 2;
                            controller.update();
                             PersistentNavBarNavigator
                                                      .pushNewScreen(
                                                    context,
                                                    screen:  SelectLocation(),
                                                    withNavBar:
                                                    true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                    PageTransitionAnimation
                                                        .cupertino,
                      );


                          // controller.GetPlan(context, controller.profileData!.subscription!.planId!);                         
                      }
                      else{
                        PersistentNavBarNavigator
                                                      .pushNewScreen(
                                                    context,
                                                    screen:  SelectPlanOnOrder(),
                                                    withNavBar:
                                                    true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                    PageTransitionAnimation
                                                        .cupertino,
                      );

                      }
                       

                    });

                      // Future.delayed(Duration.zero,()=> profilecontroller.ProfileApi(context));
                    // 
                    // Get.toNamed(Routes.SELECTPLANONORDER);
                  }                 
                }, text: "Next"),
            ),
               SizedBox(height: 20.h,),              
                  ])));
      }))

    );
  }

}

/*

child:GridView.count(  
                  shrinkWrap: true,
                crossAxisCount: 3, 
                // padding: EdgeInsets.zero, 
                mainAxisSpacing: 2,
                // childAspectRatio: 2,
                children: List.generate(3, (index) {  
                  return Center(  
                    child: Container(
                      
                      child: Column(
                        children: [
                          Container(
                            width: Get.width/4,
                            height: Get.height/7,
                             decoration:   BoxDecoration(                          
                          border: Border.all(
                            color: ColorCode.orange,
                            width: 2
                          ),
                           borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24)
                       )
                                      ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/fuel_icon.svg")
                                
                            ]),
                          ),
                          // SizedBox(height: 10.h,),
                          Text("\$X.XX / gal", style: Heading3(),)
                        ],
                      ),
                    ),  
                  );  
                }  
                )  
            ) */
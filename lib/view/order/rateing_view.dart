import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';
import 'package:fuel2u_user/widgets/border_button_ui.dart';
import 'package:fuel2u_user/widgets/fill_button_ui.dart';
import 'package:fuel2u_user/widgets/logo_rigth_icon.dart';
import 'package:get/get.dart';
class DriveRating extends GetView<OrderController>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  // appBar:  AppBar(
  //         automaticallyImplyLeading: false,
  //         toolbarHeight: 100,
  //         backgroundColor: ColorCode.white,
  //         title:  ImageLogoWithRigthIcon(icon: InkWell(
  //                     onTap: ()=> Get.toNamed(Routes.ALLTRUCKINMAP),
  //                     child: Image.asset("assets/icons/mytruck.png", width: 50,),
  //                   )),
  //         elevation: 0,
  //       ),
    body:  
    
    GetBuilder<OrderController>(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
          return controller.submitRateing.value ? sumbitReview(): 
           SingleChildScrollView(
      child:
           Form(
              key: controller.rateingFomrKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                     ImageLogoWithRigthIcon(
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
                                 onTap: () => Get.toNamed(Routes.ALLTRUCKINMAP),
                                child: Image.asset(
                                  "assets/icons/mytruck.png",
                                  width: 50,
                                ),
                              )),
                          SizedBox(height: 20.h,),
                      Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Rate your Driver ${controller.orderDetailsData!.driver!.firstName} ${controller.orderDetailsData!.driver!.lastName}", style: Heading1(
                                  color: ColorCode.darkGray
                                ),)
                              ],
                            ),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Order Number: ${controller.orderDetailsData!.orderNumber}",style: Heading3Regular(
                                  
                                  color: ColorCode.darkGray
                                ), )
                        ],
                      ),
                      SizedBox(height: 5.h,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Delivery Date: ${controller.orderDetailsData!.deliveryDate}",
                          style: Heading3Regular(                                  
                                  color: ColorCode.darkGray
                                ), )
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      controller.orderDetailsData!.driver!.image == null|| controller.orderDetailsData!.driver!.image == "" ?
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/driver_img.png"),):
                        CircleAvatar(
                             radius: 40,
                             backgroundImage: NetworkImage("${ApiUrls.domain}${controller.orderDetailsData!.driver!.image}",),
                       
                          ),
                        
                        // :Container(
                        //   width: 90,
                        //   height: 80,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(60),
                        //     // shape: BoxShape.circle
                        //   ),
                          

                        // ),
                    //   ): 
                  //   CircleAvatar(
                  //       radius: 40,
                  //       backgroundImage: NetworkImage("${ApiUrls.domain}${controller.orderDetailsData!.driver!.image}",
                  //       loadingBuilder: (BuildContext context, Widget child,
                  //     ImageChunkEvent? loadingProgress) {
                  //   if (loadingProgress == null) return child;
                  //   return Center(
                  //     child: CircularProgressIndicator(
                  //       value: loadingProgress.expectedTotalBytes != null
                  //           ? loadingProgress.cumulativeBytesLoaded /
                  //               loadingProgress.expectedTotalBytes!
                  //           : null,
                  //     ),
                  //   );
                  // },
                  //       ),
                  //     ) ,
                      SizedBox(height: 30.h,),
                      Container(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      if(index == 0)
                      {
                        return  SizedBox();
                      }
                      else
                      return
                      InkWell(
                        onTap: (){
                          controller.rateStar.value =  index;
                          controller.update();
                        },
                        child:  controller.rateStar.value >= index  ? Icon(Icons.star,
                        size: 48,
                    color: ColorCode.orange,
                    ) : Icon(Icons.star_border,
                    size: 48,
                     color: ColorCode.orange,)
                    );
                    }
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  child: TextFormField(
                    style: TextFieldStyle(),
                    controller: controller.ratingCommentCtrl,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    // validator: (val) {},
                    onChanged: (val){ 
                      controller.checkRateing();                            
                    },
                    decoration:  InputDecoration(
                      hintText: "Comments",
                       hintStyle: TextStyle(
                      color: ColorCode.ligthGray,
                      fontWeight: FontWeight.bold
                    ),
                      focusedBorder: MainBorder(),
                      border: MainBorder(),
                      enabledBorder: MainBorder()
                    ),
                  ),
                  ), 
                  SizedBox(height: 50.h,),
                  Padding(
                     padding: EdgeInsets.symmetric(
                              horizontal: 15.h),
                    child: FillBtn(ontap: (){
                     
                      if(controller.israting.value){
                        controller.GetRateingOnOrder(context);
                        //  controller.updateReview();                        
                      }                                                      
                    }, text: "SUBMIT",
                    Bgcolor: controller.israting.value ? ColorCode.orange : ColorCode.ligthGray,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                   padding: EdgeInsets.symmetric(
                              horizontal: 15.h),
                    child: BorderBtn(ontap: (){
                      controller.rateStar.value = 0;
                      controller.commentCtrl.clear();
                      controller.update();
                     Navigator.of(context).pop();
                    }, text: "No Thanks"),
                  ),
                   Padding( // this is new
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                          ),
              
                    
                    
                    
                  
                        ],
                      ),
              ),
     ), ); 
        },
      )  
 
    
   );
  }
Container sumbitReview(){
     OrderController controller  = Get.put(OrderController());

  return Container(
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text("Thank you for your feedback!", style: Heading1(color: ColorCode.orange),),
          Spacer(flex: 3,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.h),
            child: FillBtn(ontap: (){
                    
                      controller.submitRateing.value = false;
                      controller.update();
                      Get.offAllNamed(Routes.HOME);
                    // }
          
                  }, text: "NEXT",
                  Bgcolor: ColorCode.orange,
                  ),
          ),

                SizedBox(height: 40.h,),

          

        ],
      ),
    );
}
}
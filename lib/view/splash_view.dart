
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/splash_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {  

  
    SplashController controlller =  Get.find<SplashController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // log("Hello");
    // Future.delayed(Duration(seconds: 3),() =>  Get.to(Routes.WELCOME));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight ,
        color: ColorCode.orange,
        child: Image.asset("assets/images/splash.png",
          fit: BoxFit.cover,
         width: ScreenUtil().screenWidth,
         height: ScreenUtil().scaleHeight,),
      ),
    );

  }
}

// class Splash extends GetView<SplashController>{ 
//   const Splash({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Get.lazyPut<SplashController>(() => SplashController());
//     return Scaffold(
//       body: Container(
//         height: ScreenUtil().screenHeight ,
//         color: ColorCode.orange,
//         child: Image.asset("assets/images/splash.png",
//          width: ScreenUtil().screenWidth,
//          height: ScreenUtil().scaleHeight,),
//       ),
//     );

//   }
  
// }


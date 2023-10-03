import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

    @override
  void onInit() {
    super.onInit();
    // moveScreen();
    print("Get Ready");
    Future.delayed(Duration(seconds: 3), () =>  Get.offAllNamed(Routes.WELCOME) );
   
  }

  @override
  void onReady() {
    // super.onReady();
    // Future.delayed(Duration(seconds: 3), (){
    //   Get.offAllNamed(Routes.WELCOME);
    //     print("Get Ready");
    // });
    
    // useAccessibilityService();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  void moveScreen() async{
     await Future.delayed(Duration(seconds: 5), (){
      Get.offAllNamed(Routes.WELCOME);
        print("Get Ready");
    });
  }
  

}
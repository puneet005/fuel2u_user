import 'package:fuel2u_user/controller/add_vehicle_controller.dart';
import 'package:fuel2u_user/controller/bottom_bar_controller.dart';
import 'package:fuel2u_user/controller/business_controller.dart';
import 'package:fuel2u_user/controller/login_controller.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/controller/vehicel_controller.dart';
import 'package:get/get.dart';

import 'controller/deliveryzipcode_controller.dart';
// import 'controller/not_available_area_controller.dart';
import 'controller/premiun_controller.dart';
import 'controller/sign_up_controller.dart';
import 'controller/splash_controller.dart';

Future<void> init() async{

  Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  // Get.lazyPut<NotAvailableAreaController>(() => NotAvailableAreaController(), fenix: true);
  Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  Get.lazyPut<DeliveryZipCodeController>(() => DeliveryZipCodeController(), fenix: true);
  Get.lazyPut<PremiunController>(() => PremiunController(), fenix: true);
  Get.lazyPut<BusinessController>(() => BusinessController(), fenix: true);
  Get.lazyPut<AddVehicleController>(() => AddVehicleController(), fenix: true);
  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  Get.lazyPut<BottomBarController>(() => BottomBarController(), fenix: true);
  Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
  Get.lazyPut<VehicleController>(() => VehicleController(), fenix: true);

}
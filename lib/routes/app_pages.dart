import 'package:fuel2u_user/view/all_truck_on_map.dart';
import 'package:fuel2u_user/view/business_form_ui.dart';
import 'package:fuel2u_user/view/home.dart';
import 'package:fuel2u_user/view/location/add_location.dart';
import 'package:fuel2u_user/view/location/edit_location.dart';
import 'package:fuel2u_user/view/order/additional_comments.dart';
import 'package:fuel2u_user/view/order/confirm_order.dart';
import 'package:fuel2u_user/view/order/edit_order.dart';
import 'package:fuel2u_user/view/order/fuel_type.dart';
import 'package:fuel2u_user/view/order/ges_cap_open_ui.dart';
import 'package:fuel2u_user/view/order/new_order.dart';
import 'package:fuel2u_user/view/order/order_history.dart';
import 'package:fuel2u_user/view/order/rateing_view.dart';
import 'package:fuel2u_user/view/order/review_order.dart';
import 'package:fuel2u_user/view/order/select_date.dart';
import 'package:fuel2u_user/view/order/select_location.dart';
import 'package:fuel2u_user/view/order/select_payment_method.dart';
import 'package:fuel2u_user/view/order/select_plan.dart';
import 'package:fuel2u_user/view/premium/plan_details.dart';
import 'package:fuel2u_user/view/profile/add_card.dart';
import 'package:fuel2u_user/view/profile/add_promo_code.dart';
import 'package:fuel2u_user/view/profile/business_details.dart';
import 'package:fuel2u_user/view/profile/edit_card_details.dart';
import 'package:fuel2u_user/view/profile/membership.dart';
import 'package:fuel2u_user/view/profile/membership_change.dart';
import 'package:fuel2u_user/view/profile/payment_details.dart';
import 'package:fuel2u_user/view/profile/personal_details.dart';
import 'package:fuel2u_user/view/profile/support.dart';
import 'package:fuel2u_user/view/sign_up/login.dart';
import 'package:fuel2u_user/view/sign_up/login_otp.dart';
import 'package:fuel2u_user/view/sign_up/not_available_area.dart';
import 'package:fuel2u_user/view/sign_up/promo_code.dart';
import 'package:fuel2u_user/view/sign_up/sign_up_view.dart';
import 'package:fuel2u_user/view/sign_up/verification_view.dart';
import 'package:fuel2u_user/view/splash_view.dart';
import 'package:fuel2u_user/view/vehicle/add_vehicle_in_vehicle_view.dart';
import 'package:fuel2u_user/view/vehicle/edit_vehicle_details.dart';
import 'package:fuel2u_user/view/vehicle/vehicle_home.dart';
import 'package:fuel2u_user/view/view_car_image.dart';
import 'package:fuel2u_user/view/welcome.dart';
import 'package:get/get.dart';

import '../view/add_vehicle.dart';
import '../view/order/single_order_in_map.dart';
import '../view/premium/plan_list.dart';
import '../view/sign_up/delivery_pincode.dart';

part  'app_routes.dart';

class AppPages{
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const HOME =  Routes.WELCOME;
  // Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  Splash(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => Welcome(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
    ),
     GetPage(
      name: _Paths.LOGINOTP,
      page: () => const LoginOTP(),
    ),
    
    GetPage(
      name: _Paths.DELIVERYPINCODE,
      page: () => const DeliveryZipCode(),
    ),
     GetPage(
      name: _Paths.NOTAVAILABLEAREA,
      page: () => const NotAvaiableArea(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () =>  const SignUpView(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
    ),
    GetPage(
      name: _Paths.PROMOCODE,
      page: () => const PromoCode(),
    ),
    GetPage(
      name: _Paths.SELECTPLAN,
      page: () => const SelectPlan(),
    ),
    GetPage(
      name: _Paths.PLANDETAILS,
      page: () => const PlanDetails(),
    ),
    GetPage(
      name: _Paths.BUSINESSFORM,
      page: () => const BusinessForm(),
    ),
     GetPage(
      name: _Paths.ADDVEHICLE,
      page: () => const AddVehicle(),
    ),
    GetPage(
      name: _Paths.VIEWCARIMAGE,
      page: () => const ViewCarImage(),
    ),
    GetPage(              
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.ORDERHISTORY,
      page: () => const OrderHistory(),
    ),
    GetPage(
      name: _Paths.NEWORDER,
      page: () => const NewOrder(),
    ),
    GetPage(
      name: _Paths.FUELTYPE,
      page: () => const FuelType(),
    ),
    GetPage(
      name: _Paths.SELECTPLANONORDER,
      page: () => const SelectPlanOnOrder(),
    ),
    GetPage(
      name: _Paths.SELECTLOCATION,
      page: () => const SelectLocation(),
    ),
    GetPage(
      name: _Paths.SELECTPAYMETHOD,
      page: () => const SelectPaymentMethod(),
    ),
    GetPage(
      name: _Paths.SELECTDATE,
      page: () => const SelectDate(),
    ),
    GetPage(
      name: _Paths.COMMENTSCREEN,
      page: () => const AdditionalComments(),
    ),
    GetPage(
      name: _Paths.REVIEWORDER,
      page: () => const ReviewOrder(),
    ),
    GetPage(
      name: _Paths.CONFIRMORDER,
      page: () => const ComfirmOrder(),
    ),
    // 
      GetPage(
      name: _Paths.GASCAPOPEN,
      page: () => const GasCapOpen(),
    ),
    GetPage(
      name: _Paths.EDITORDER,
      page: () => const EditOrder(),
    ),
     // 
      GetPage(
      name: _Paths.ALLTRUCKINMAP,
      page: () =>  NearYourTruck(),
    ), 
    GetPage(
      name: _Paths.SINGLEORDERINMAP,
      page: () => SingleOrderViewMap(),
    ),

    GetPage(
      name: _Paths.DRIVERATEING,
      page: () => DriveRating(),
    ),
  GetPage(
      name: _Paths.VEHICLEHOME,
      page: () => VehicleHome(),
    ),
    GetPage(
      name: _Paths.ADDVEHICLEINVEHICLEVIEW,
      page: () => AddVehicleInVehicleView(),
    ),
    // GetPage(
    //   name: _Paths.EDITVEHICLEDETAILS,
    //   page: () => EditVehicleDetails(),
    // ),
    GetPage(
      name: _Paths.ADDLOCATION,
      page: () => AddLocation(),
    ),
    // GetPage(
    //   name: _Paths.EDITLOCATION,
    //   page: () => EditLoaction(),
    // ),

      GetPage(
      name: _Paths.PERSONALDETAILS,
      page: () =>  PersonalDetails(),
    ),
  GetPage(  // GetPage(
      name: _Paths.BUSINESSDETAILS,
      page: () =>  BusinessDetails(),
    ),
  GetPage(
      name: _Paths.PAYMENTDETAILS,
      page: () => PaymentDetails(),
    ),
    GetPage( 
        name: _Paths.ADDCARD,
      page: () => AddCard(),
    ),
  GetPage(
      name: _Paths.EDITCARDDETAILS,
      page: () => EditCardDetails(),
  ),
  GetPage(
      name: _Paths.MEMBERSHIP,
      page: () =>  Membership(),
    ),
    GetPage(
      name: _Paths.MEMBERSHIPETAILS,
      page: () => MemberShipDetail(),
    ), 
    GetPage(
      name: _Paths.ADDPROMOCODE,
      page: () =>  AddPromoCode(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => Support(),
    ),


  

    
  ];

}
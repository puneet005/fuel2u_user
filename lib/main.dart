import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fuel2u_user/resources/firebase_service.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'dependencies.dart' as de;

String fcmToken = "";
String googleMKey = "AIzaSyCxSKrMOXBe-Ur6wVJfCAy4IEGyTOFAVuI";
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await de.init();
  //  Stripe.publishableKey = "pk_test_51NngyIDbCQcF6xccOIYMjunXx7NU2iBOvgObB7gfYw7vdUPxsyZcURPpSCHMEV1oW7dJQTRsxFxcsP050CuxxebH00n9hd2wpf";
  try {
    fcmToken = await FirebaseMessaging.instance.getToken() ?? "FcmToken";
    print('FireBase FCM token=>' + fcmToken.toString());
  } catch (e) {
    print("FireBase FCM toke exception====> " + e.toString());
  }
  initMessaging();
  HttpOverrides.global = MyHttpOverrides();
 
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     
           
    // // systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
    // statusBarBrightness: Brightness.light ,
    
    // systemNavigationBarDividerColor: Colors.black,
    // // status bar color
  ));
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: (){
            if (FocusManager.instance.primaryFocus!.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: '2U Fuel',
            theme: ThemeData(brightness: Brightness.light,
            fontFamily: 'Roboto',
          scaffoldBackgroundColor: ColorCode.white,
          
          colorScheme: const ColorScheme.light(
            primary: ColorCode.orange,
            secondary: ColorCode.orange,
          ),
           visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        );
      }
    );
  }
}




class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
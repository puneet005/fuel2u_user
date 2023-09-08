import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/resources/firebase_service.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';
import 'dependencies.dart' as de;

String fcmToken = "";
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await de.init();
  try {
    fcmToken = await FirebaseMessaging.instance.getToken() ?? "FcmToken";
    print('FireBase FCM token=>' + fcmToken.toString());
  } catch (e) {
    print("FireBase FCM toke exception====> " + e.toString());
  }
  initMessaging();
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
        return GetMaterialApp(
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
        );
      }
    );
  }
}



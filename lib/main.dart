import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:get/get.dart';
import 'dependencies.dart' as de;
void main() async{
  await de.init();
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



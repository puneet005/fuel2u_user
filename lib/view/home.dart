

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel2u_user/controller/bottom_bar_controller.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/view/location/my_location.dart';
import 'package:fuel2u_user/view/profile/profile_view.dart';
import 'package:fuel2u_user/view/vehicle/vehicle_home.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'my_order.dart';


BuildContext? testContext;
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}
int selectedIndex = 0;
class _HomeViewState extends State<HomeView> {
   late PersistentTabController _controller;
  late bool _hideNavBar;


  List<Widget> _buildScreens = [
     MyOrder(),
     VehicleHome(),
     MyLocation(),
     ProfileView(),
    
   ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  // List<String> _bottomeIcons = [
  //  "","","","",
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
      context,
      screens:_buildScreens,
      items: _navBarsItems(),
      controller: _controller,
      confineInSafeArea: true,
      backgroundColor: ColorCode.yellow,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      onItemSelected: (value) {
        setState(() {
          selectedIndex = value;
        });
        print(value.toString());
      },
      hideNavigationBarWhenKeyboardShows: true,
      
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
     
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style6,
    
    
    ),
      // body: PersistentTabView(
      //     context,
      //     controller: _controller,
      //     screens: _widgetOptions,
      //     items:  _navBarsItems(),
      //     resizeToAvoidBottomInset: true,
      //     navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
      //         ? 0.0
      //         : kBottomNavigationBarHeight,
      //     bottomScreenMargin: 0,
      //     onWillPop: (context) async {
      //       // await showDialog(
      //       //   context: context!,
      //       //   useSafeArea: true,
      //       //   builder: (final context) => Container(
      //       //     height: 50,
      //       //     width: 50,
      //       //     color: Colors.white,
      //       //     child: ElevatedButton(
      //       //       child: const Text("Close"),
      //       //       onPressed: () {
      //       //         Navigator.pop(context);
      //       //       },
      //       //     ),
      //       //   ),
      //       // );
      //       return false;
      //     },
      //     selectedTabScreenContext: (final context) {
      //       testContext = context;
      //     },
      //     backgroundColor: ColorCode.yellow,
      //     hideNavigationBar: _hideNavBar,
      //     decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      //     itemAnimationProperties: const ItemAnimationProperties(
      //       duration: Duration(milliseconds: 400),
      //       curve: Curves.ease,
      //     ),
      //     screenTransitionAnimation: const ScreenTransitionAnimation(
      //       animateTabTransition: true,
      //     ),
      //     navBarStyle: NavBarStyle
      //         .style19, // Choose the nav bar style with this property
      //   ),
    );
  }

   List<PersistentBottomNavBarItem> _navBarsItems() => [
        // Container(),
        PersistentBottomNavBarItem(
            icon: SvgPicture.asset( "assets/icons/fuel_icon.svg",
                  height: 25,
                  color:  selectedIndex == 0 ? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.3),
                  ),

            routeAndNavigatorSettings: RouteAndNavigatorSettings(onGenerateRoute: (sett) {
                                      PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: _buildScreens[selectedIndex],
                                      withNavBar: true,
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                    return null;
                                  }),  
         
            ),
        PersistentBottomNavBarItem(
          icon:  SvgPicture.asset("assets/icons/car_icon.svg",
           height: 25,
          // icon: Image.asset( selectedIndex == 1 ?"assets/images/darktruck.png"  :"assets/images/truck.png" ,
                  //  height: 20,
                  //  width: 40,
                   color:  selectedIndex == 1 ? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.3),
                  //  color: ColorCode.ligthGray,
                    ),
                  // )
       
          routeAndNavigatorSettings: RouteAndNavigatorSettings(onGenerateRoute: (sett) {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: _buildScreens[selectedIndex],
                                      withNavBar: true,
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                    return null;
                                   }),
                                  ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/icons/location_icon.svg",
            // selectedIndex == 2 ? "assets/icons/blackrating.svg" :"assets/icons/rating.svg",
                  height: 25,
                  color:  selectedIndex == 2 ? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.3),
                  ),                
              routeAndNavigatorSettings: RouteAndNavigatorSettings(onGenerateRoute: (sett) {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: _buildScreens[selectedIndex],
                                      withNavBar: true,
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                    return null;
                                  }),

        ),
        PersistentBottomNavBarItem(
          
          icon: SvgPicture.asset("assets/icons/black_profile_icon.svg",
            // selectedIndex == 3 ? "assets/icons/black_profile_icon.svg" : "assets/icons/profile_icon.svg",
           height: 25,
                  color:  selectedIndex == 3 ? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.3),
          ),        
          routeAndNavigatorSettings: RouteAndNavigatorSettings(onGenerateRoute: (sett) {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: _buildScreens[selectedIndex],
                                      withNavBar: true,
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                    return null;
                                  }),
        ),      
      ];
}



// class HomeView extends GetView<BottomBarController>{
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//      Get.lazyPut<BottomBarController>(() => BottomBarController());
//     // TODO: implement build
//     return 
//     GetBuilder<BottomBarController>(
//       init: BottomBarController(),
//       initState: (_) {},
//       builder: (_) {
//         return Scaffold(
//           //  key: controller.key,
//             body: controller.widgetOptions.elementAt(controller.selectedIndex),
//           //  body: controller.widgetOptions.elementAt(controller.selectedIndex),
//             bottomNavigationBar:
//             // using BottomAppBar
//             BottomAppBar(
             
//               color:  ColorCode.yellow,
//               child: Container(
//                 height: 60,
//                 decoration: BoxDecoration(
                 
//                       color:  ColorCode.yellow,
                  
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                 IconButton(
//                   onPressed: (){
//                     controller.selectedIndex = 0;
//                     controller.update();
//                   }, 
//                     icon: SvgPicture.asset("assets/icons/fuel_icon.svg",
//                         color: controller.selectedIndex==0? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.5)),
                  
//                   ),
//                 IconButton(onPressed: (){
//                   controller.selectedIndex = 1;
//                   controller.update();
//                 },
//                 icon: SvgPicture.asset("assets/icons/car_icon.svg",
//                 color: controller.selectedIndex==1? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.5)),
//                 // ),
//                 //  icon: Image.asset(AppAssets.bottomNavImagesCategory, height: 20,width: 20,
//                 //     color: ,
//                     ),
                
//                 IconButton(onPressed: (){

//                   controller.selectedIndex = 2;
//                   controller.update();
//                 },
//                 icon: SvgPicture.asset("assets/icons/location_icon.svg",
//                 color: controller.selectedIndex==2? ColorCode.darkGray: ColorCode.darkGray.withOpacity(0.5)),
//                 //  icon: Image.asset(AppAssets.bottomNavImagesChat, height22,width: 22,
//                 //     color: controller.selectedIndex==3 ? AppColors.whiteColor : Colors.grey),
//                     ),
//                 IconButton(onPressed: (){
//                   controller.selectedIndex = 3;
//                   controller.update();
//                 },
//                 icon: SvgPicture.asset(  controller.selectedIndex==3 ? "assets/icons/black_profile_icon.svg" :"assets/icons/profile_icon.svg",
//                 color: controller.selectedIndex==3 ? ColorCode.black.withOpacity(0.8): ColorCode.darkGray),
//                 //  icon: Image.asset(AppAssets.bottomNavImagesChat, height: 22,width: 22,
//                 //     color: controller.selectedIndex==3 ? AppColors.whiteColor : Colors.grey),
//                     ),
               
//               ],
//             ),
//           ),
//         )
//     );
     
//       },
//     )  ; 
//   }
  
// }
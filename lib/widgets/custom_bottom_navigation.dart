

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomBottomNav extends StatelessWidget {
//   const CustomBottomNav({Key? key}) : super(key: key);

//   // final controller = Get.put(BottomBarController());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BottomBarController>(builder: (controller) {
//       return Scaffold(
//         key: controller.key,
            
       
//         body: controller.widgetOptions.elementAt(controller.selectedIndex),
//         bottomNavigationBar:
//         // using BottomAppBar
//         BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           color: Colors.transparent,
//           elevation: 0,
//           child: Container(
//             height: 60,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//                   color: Colors.black,
//               boxShadow: const [
//                  BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(
//                   onPressed: (){
//                     controller.selectedIndex = 0;
//                     controller.update();
//                   }, icon: Image.asset(AppAssets.bottomNavImagesHomepage, height: 20,width: 20,
//                   color: controller.selectedIndex==0? AppColors.whiteColor:Colors.grey,),),
//                 IconButton(onPressed: (){

//                   controller.selectedIndex = 1;
//                   controller.update();
//                 }, icon: Image.asset(AppAssets.bottomNavImagesCategory, height: 20,width: 20,
//                     color: controller.selectedIndex==1? AppColors.whiteColor: Colors.grey),),
//                 IconButton(
//                   padding: EdgeInsets.all(0),
//                   // visualDensity: VisualDensity(horizontal: -4,vertical: -4),
//                   onPressed: (){
//                   controller.selectedIndex = 2;
//                   controller.update();
//                 }, icon: const CircleAvatar(
//                   radius: 50,
//                   backgroundColor: AppColors.whiteColor,
//                   child: Icon(Icons.add,
//                       color:AppColors.blackColor),
//                 ),),
//                 IconButton(onPressed: (){

//                   controller.selectedIndex = 3;
//                   controller.update();
//                 }, icon: Image.asset(AppAssets.bottomNavImagesChat, height: 22,width: 22,
//                     color: controller.selectedIndex==3 ? AppColors.whiteColor : Colors.grey),),
//                 IconButton(onPressed: (){

//                   controller.selectedIndex = 4;
//                   controller.update();
//                 }, icon: Image.asset(AppAssets.bottomNavImagesUser, height: 20,width: 20,
//                     color: controller.selectedIndex==4? AppColors.whiteColor: Colors.grey),),
//               ],
//             ),
//           ),
//         ).marginOnly(left: 16.0,right: 16.0, bottom: 16.0,)



// // using BottomNavigationBar
//         /*BottomNavigationBar(
//             iconSize: 40,
//             elevation: 5,
//             backgroundColor: AppColors.blackColor,
//             items: const <BottomNavigationBarItem>
//             [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                   backgroundColor: Colors.green,
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.search),
//                   label: 'Search',
//                   backgroundColor: Colors.yellow
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                     Icons.person),
//                 label: "Profile",
//                 backgroundColor: Colors.blue,
//               ),
//             ],
//             type: BottomNavigationBarType.fixed,
//             onTap: controller.onItemTapped,
//             currentIndex: controller.selectedIndex,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white,

//         ),*/
//       );
//     });
//   }
// }

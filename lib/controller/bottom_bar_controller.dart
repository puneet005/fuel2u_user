
import 'package:flutter/material.dart';
import 'package:fuel2u_user/view/location/my_location.dart';
import 'package:fuel2u_user/view/my_order.dart';
import 'package:fuel2u_user/view/profile/profile_view.dart';
import 'package:fuel2u_user/view/vehicle/vehicle_home.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController{

  // final GlobalKey<ScaffoldState> key = GlobalKey();// for app drawer


int selectedIndex = 0;
  
  List<Widget> widgetOptions = <Widget>[
    
    const MyOrder(),
     VehicleHome(),
     MyLocation(),
     ProfileView(),
  ];
  
  void onItemTapped(int index) {
      selectedIndex = index;
      update();
  }


}
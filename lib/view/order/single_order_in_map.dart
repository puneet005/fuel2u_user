import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel2u_user/controller/login_controller.dart';
import 'package:fuel2u_user/controller/order_controller.dart';
import 'package:fuel2u_user/model/socket_model/get_user_order.dart';
import 'package:fuel2u_user/utils/api_constant.dart';
// import 'package:fuel2u_user/routes/app_pages.dart';
import 'package:fuel2u_user/utils/color.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';



class SingleOrderViewMap extends StatefulWidget {
  int id;
  SingleOrderViewMap({super.key, required this.id});

  @override
  State<SingleOrderViewMap> createState() => _SingleOrderViewMapState();
}

class _SingleOrderViewMapState extends State<SingleOrderViewMap> {
  OrderController controller = Get.put(OrderController());

  @override
  void initState() {
    initSocket(); 
    super.initState();
  }

@override
void dispose() {
  socket!.disconnected;
  super.dispose();
}

IO.Socket? socket;
initSocket() async {
 controller.singleOrderMapLoading.value = true;

    if(socket!=null && socket!.connected){
      socket!.disconnected;
    }
    socket = IO.io(ApiUrls.socketUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
      // 'Authorization': 'Bearer ' + token!.toString()
    });
    if(socket!.connected){
     controller.singleOrderMapLoading.value = false;  
      // controller.update(); 
      setState(() {
        
      });
      joinRoom();
    }
    socket!.connect();
    socket!.onConnect((_) {
        log("socket connect");
         controller.singleOrderMapLoading.value = false;  
      controller.update(); 
      joinRoom();
    });
    socket!.onDisconnect((_) {
      initSocket();
       controller.singleOrderMapLoading.value = false;
      log("socket Disconnect");

    });
    socket!.onConnectError((err) {
       controller.singleOrderMapLoading.value = false;
       initSocket();
        log("onConnectError");
        log(err.toString());
        print(err);
    });
    socket!.onError((err) {
      controller.singleOrderMapLoading.value = false;
      // controller.update();
      // if (kDebugMode) {
         initSocket();
        print(err);
      // }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
          return 
        controller.singleOrderMapLoading.value ? Container(
          child: Center(
            child: CircularProgressIndicator(
              color: ColorCode.orange,
            ),
          ),
        )  : Container(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: 
                     (mapControl) {
            setState(() {
              controller.mapController = mapControl;
              controller.update();
            });
          },
                    initialCameraPosition: CameraPosition(
                      target: controller.center,
                      zoom: 16.0,
                    ),
                    markers:  controller.myCarlocation == null  &&  controller.driverlocation == null ? {} : {
                      controller.myCarlocation ?? Marker(markerId: MarkerId("")),
                      controller.driverlocation ?? Marker(markerId: MarkerId("")),
                      }
                  ),
                  Positioned(
                    top: 50,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        // Get.back();
                      },
                      child: const CircleAvatar(
                        backgroundColor: ColorCode.yellow,
                  radius: 25,
                  child: Icon(
                    Icons.close,
                    // weight: 10,
                    size: 30,
                    color: ColorCode.white,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorCode.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    )
                  ),
                height: Get.height/4,
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Divider(
                      thickness: 5,
                      color: ColorCode.ligthGray,
                      indent: 50.h,
                      endIndent: 50.h,
                    ),
                     SizedBox(height: 20.h,),
                    Container(
                      child: Text("${controller.orderData?.driver?.firstName ?? ""} is ${controller.orderData?.driverDistance ?? ""} miles away", style: Heading1(),),
                    ),
                     SizedBox(height: 20.h,),
//                    TextButton(onPressed: (){ 
// joinRoom();
//                     //  PersistentNavBarNavigator
//                     //                                     .pushNewScreen(
//                     //                                   context,
//                     //                                   screen: DriveRating(),
//                     //                                   withNavBar:
//                     //                                   true, // OPTIONAL VALUE. True by default.
//                     //                                   pageTransitionAnimation:
//                     //                                   PageTransitionAnimation
//                     //                                       .cupertino,
//                     //                                 );
//                     // Get.toNamed(Routes.DRIVERATEING);                   
//                    }, child: Text("Driver Rating Screen"))
                  ],)
                          ),
              )
          ],
        ),
      );},
      )
    );
  }

  joinRoom() async {
      OrderController controller = Get.put(OrderController());
  log("getUserOrder");
  log(widget.id.toString());  
    socket!.emitWithAck("getUserOrder", {'order_id' : widget.id},);
    socket!.on("getUserOrderResponse", (data) {
      log("getUserOrderResponse");
      log("on ---> \n");
      
      var res = jsonEncode(data['data']);
      log(res.toString());
      GetUserOrderData orderData = GetUserOrderData.fromJson(data['data']);
      controller.orderData = orderData ; 
      controller.update();   
      log(LatLng(double.parse(orderData.location!.latitude!), double.parse(orderData.location!.longitude!)).toString());  
      controller.center =  LatLng(double.parse(orderData.location!.latitude!), double.parse(orderData.location!.longitude!));     
      controller.SetCarLocation(orderData.vehicle!.name ?? "", double.parse(orderData.location!.latitude!),  double.parse(orderData.location!.longitude!) );
      controller.update(); 
      if(orderData.driver!.latitude != null && orderData.driver!.longitude != null){
         controller.SetTruckLocation(orderData.vehicle!.name ?? "", double.parse(orderData.driver!.latitude!),  double.parse(orderData.driver!.longitude!) );
         controller.mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(double.parse(orderData.location!.latitude!),  double.parse(orderData.location!.longitude!)),
        ),
      );
      }
      
    });
  }
}

























// class SocketClient {
//   static Socket? socket;
//   static init() async {
//     log("init");
//      SessionManager pref = SessionManager();
//     String? token = await pref.getAccessToken();
//     if(token == null || token == ""){
//        token = oneTimeToken;
//       }
//     // final token = DataStorage.retrieve('token');
//     // Dart client
//     try {
//       // Configure socket transports must be sepecified
//       socket = io(
//         ApiUrls.socketUrl,
//         OptionBuilder()
//             .setTransports(['websocket']) // for Flutter or Dart VM
//             .disableAutoConnect() // disable auto-connection
//             .setExtraHeaders({'Authorization': 'Bearer ' + token!}) // optional
//             .build(),
//       );

//       // Connect to websocket
//       socket?.connect();
//       // Listen to messages
//       socket?.onConnect((_) {
//         // getting all data
        
//         log('Socket connected! 😄');
//         // listen events
//         // SocketClient.listenEvents();
//       });

//       // on disconnect
//       socket?.onDisconnect((_) => print('Socket disconnected! 😭'));
//     } catch (e) {
//       ('Socket error: $e');
//       return null;
//     }
//   }

//   static socketio() {
//     return socket;
//   }
//   static listenEvents() {
//     // get all individual chat
//     // socket?.on('CHAT_DETAIL_RESPONSE_NEW', (data) {
//     //   print('CHAT_DETAIL_RESPONSE_NEW');
//     //   log(data);
//     //   try {
//     //     ChattingController chattingController = Get.find<ChattingController>();
//     //     var json = jsonDecode(data);
//     //     chattingController.mainChatData.value = MainChatData.fromJson(json);
//     //     chattingController.loading.value = false;
//     //     chattingController.scrollToEnd();
//     //   } catch (e) {}
//     //   try {
//     //     ChatController chatController = Get.find<ChatController>();
//     //     chatController.getChatUserList(chatController.chatController.index);
//     //   } catch (e) {}
//     // });

//     // get all group chat
//     // socket?.on('GROUP_CHAT_DETAIL_RESPONSE_NEW', (data) {
//     //   print('GROUP_CHAT_DETAIL_RESPONSE_NEW');
//     //   log(data);
//     //   try {
//     //     ChattingController chattingController = Get.find<ChattingController>();
//     //     var json = jsonDecode(data);
//     //     chattingController.mainChatData.value = MainChatData.fromJson(json);
//     //     chattingController.loading.value = false;
//     //     chattingController.scrollToEnd();
//     //   } catch (e) {}
//     // });

//     // individual chat response
//     // socket?.on('NEW_MESSAGE_RESPONSE', (data) {
//     //   print('NEW_MESSAGE_RESPONSE');
//     //   log(data);
//     //   try {
//     //     ChatController chatController = Get.find<ChatController>();
//     //     chatController.getChatUserList(chatController.chatController.index);
//     //   } catch (e) {}
//     // });

//     // // group chat response
//     // socket?.on('NEW_GROUP_MESSAGE_RESPONSE', (data) {
//     //   print('NEW_GROUP_MESSAGE_RESPONSE');
//     //   log(data);
//     //   try {
//     //     ChatController chatController = Get.find<ChatController>();
//     //     chatController.getChatUserList(chatController.chatController.index);
//     //   } catch (e) {}
//     // });

//     // room response
//     // socket?.on('JOIN_ROOM_RESPONSE', (data) {
//     //   print('JOIN_ROOM_RESPONSE');
//     //   log(data);
//     //   try {
//     //     data = jsonDecode(data);
//     //     Map<String, dynamic> map = data['data'];
//     //     ChattingController chattingController = Get.find<ChattingController>();
//     //     chattingController.roomId = map['roomId'];
//     //     SocketClient.emitWithAck(
//     //       'CHAT_DETAIL_NEW',
//     //       {map['roomId'], map['senderId'], map['receiverId']},
//     //       ack: (data) {
//     //         print('CHAT_DETAIL_NEW');
//     //         log(data);
//     //       },
//     //     );
//     //   } catch (e) {}
//     // });
//   }

//   static emit(String event, dynamic data) {
//     Socket? socket = SocketClient.socket;
//     if (socket != null) {
//       print('Socket emit: $event');
//       print(data);
//       socket.emit(event, data);
//     }
//   }

//   // emit with ack
//   static emitWithAck(String event, dynamic data, {Function? ack}) {
//     Socket? socket = SocketClient.socket;
//     if (socket != null) {
//       print('Socket emit: $event');
//       print('Socket emit: $data');
//       socket.emitWithAck(event, data, ack: ack);
//     }
//   }

//   // reset socket
//   static reinit() {
//     Socket? socket = SocketClient.socket;
//     if (socket != null) {
//       socket.disconnect();
//       socket.destroy();
//     }

//     SocketClient.socket = null;
//     SocketClient.init();
//   }
// }
// class SingleOrderViewMap extends GetView<OrderController>{
  // @override
  // Widget build(BuildContext context) {
  //   //  controller.GetSingleTruck();
  //   // TODO: implement build
  //   return Scaffold(
  //     body: GetBuilder<OrderController>(
  //       init: OrderController(),
  //       initState: (_) {},
  //       builder: (_) {
  //         return Container(
  //             child: Stack(
  //               children: [
  //                 GoogleMap(
  //                   // onMapCreated: controller.onMapCreated,
  //                   initialCameraPosition: CameraPosition(
  //                     target: controller.center,
  //                     zoom: 16.0,
  //                   ),
  //                   markers: controller.markers,
  //                 ),
  //                 Positioned(
  //                   top: 50,
  //                   right: 30,
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       Navigator.of(context).pop();
  //                       // Get.back();
  //                     },
  //                     child: const CircleAvatar(
  //                       backgroundColor: ColorCode.yellow,
  //                 radius: 25,
  //                 child: Icon(
  //                   Icons.close,
  //                   // weight: 10,
  //                   size: 30,
  //                   color: ColorCode.white,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //               bottom: 0,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: ColorCode.white,
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(30.0),
  //                     topRight: Radius.circular(30.0)
  //                   )
  //                 ),
  //               height: Get.height/4,
  //               width: Get.width,
  //               child: Column(
  //                 children: [
  //                   SizedBox(height: 10.h,),
  //                   Divider(
  //                     thickness: 5,
  //                     color: ColorCode.ligthGray,
  //                     indent: 50.h,
  //                     endIndent: 50.h,
  //                   ),
  //                    SizedBox(height: 20.h,),
  //                   Container(
  //                     child: Text("Your driver is <X.X> miles away", style: Heading1(),),
  //                   ),
  //                    SizedBox(height: 20.h,),
  //                  TextButton(onPressed: (){ 
  //                    PersistentNavBarNavigator
  //                                                       .pushNewScreen(
  //                                                     context,
  //                                                     screen: DriveRating(),
  //                                                     withNavBar:
  //                                                     true, // OPTIONAL VALUE. True by default.
  //                                                     pageTransitionAnimation:
  //                                                     PageTransitionAnimation
  //                                                         .cupertino,
  //                                                   );
  //                   // Get.toNamed(Routes.DRIVERATEING);                   
  //                  }, child: Text("Driver Rating Screen"))
  //                 ],)
  //                         ),
  //             )
  //         ],
  //       ),
  //     );},
  //     )
  //   );
  // }
  // }
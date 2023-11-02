import 'package:flutter/material.dart';
import 'package:fuel2u_user/utils/ui_hepler.dart';

// class DialogBox extends StatelessWidget {
//    DialogBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return       
//                     DiallogBox(context);
//   }

//   DialogBox({
//  required BuildContext context, 
//   required String headingText,
//   required String subTitleText,
//   required void Function() backOnTap,
//  required  void Function() sumbitOnTap,
//   }) {
//     return showDialog(
//               context: context,
//               builder: (ctx) => AlertDialog(
//                 title:  Text(headingText, style: Heading1(),),
//                 content:  Text(subTitleText, style: Heading3Regular(),),
//                 actions: <Widget>[
//                    ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
//                 // textColor: Colors.black,
//                 onPressed: 
//                 // backOnTap,
//                 () {
//                   Navigator.of(ctx).pop(); 
//                 },             // function used to perform after pressing the button
//                 child: Text('CANCEL'),
//               ),
//               ElevatedButton(
//                 // textColor: Colors.black,
//                 onPressed: sumbitOnTap,
//                 // async{
//                 //   Navigator.of(ctx).pop();
//                 //    VehicleController vehicleController = Get.put(VehicleController());
//                 //  bool res = await  controller.DeleteVehicleApi(context, widget.data.id.toString());
//                 //  if(res){
//                 //    vehicleController.GetVehicleList();
//                 //             Navigator.of(context).pop();
//                 //  }

//                 // },
//                 child: Text('DELETE'),
//               ),
                  
//                 ],
//               ),
//             );
//   }
// }
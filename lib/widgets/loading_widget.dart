// import 'package:flutter/material.dart';
// import 'package:fuel2u_user/utils/color.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerLoading extends StatelessWidget {
//   const ShimmerLoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Container(
//                           decoration: BoxDecoration(
//                       //      border:Border.all(
//                       //   color: ColorCode.orange,
//                       //   width: 2
//                       // ),
//                        borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(24)
//                        )
//                           ),
//                          width: 200.0,
//                          height: 100.0,
//                          child: Shimmer.fromColors(
//                            baseColor: ColorCode.orange.withOpacity(0.6),
//                            highlightColor:ColorCode.orange.withOpacity(0.2),
//                            child: Container(
//                              decoration: BoxDecoration(
//                               color: Colors.grey,
//                                borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(24)
//                        )
//                             // borderRadius: BorderRadius.circular(10)     
//                           ),
                             
//                              height: 100,
//                            )
//                          ),
//                        ),
//                        );
//   }
// }
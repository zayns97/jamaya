// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:selfa/utils/colors.dart';
// import 'package:sizer/sizer.dart';
//
// import 'controller/checkbox_controller.dart';
//
// Widget CheckBox(
//     {required bool checked,
//     required String title,
//     required String descprion,
//     required CheckController checkController}) {
//   return InkWell(
//     onTap: () {
//       checkController.check();
//       checked = checkController.checked;
//     },
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       height: 9.h,
//       margin: EdgeInsets.only(bottom: 2.h),
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Flexible(
//               flex: 1,
//               child: GetBuilder<CheckController>(builder: (controller) {
//                 return Icon(
//                     checked ? Iconsax.tick_circle4 : Iconsax.tick_circle1,
//                     color: checked ? Colorsax.green : Colorsax.lightGreen);
//               })),
//           Flexible(
//             flex: 6,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 13.5.sp,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(top: 1.h),
//                   width: 80.w,
//                   child: Text(
//                     descprion,
//                     style: TextStyle(fontSize: 10.sp),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     softWrap: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

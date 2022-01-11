import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:selfa/screen/create_selfa/component/txt_field_widget.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  late final TextEditingController _selfaDetailsTextController =
      TextEditingController(text: '');
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        child: Textsax(
                            text: 'report_an_issue'.tr,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  textarea(
                      'issue_description'.tr,
                      Iconsax.warning_2,
                      TextInputType.visiblePassword,
                      context,
                      _selfaDetailsTextController),
                  GestureDetector(
                    onTap: _pickImageGallery,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Get.theme.listTileTheme.tileColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Icon(
                              Iconsax.picture_frame,
                              color: Colorsax.lightBlue,
                            ),
                          ),
                          Textsax(text: 'add_screenshot'.tr, fontSize: 13),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MaterialButton(
                    onPressed: Get.back,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    elevation: 0,
                    color: Colorsax.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide.none),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textsax(
                              text: 'report'.tr,
                              fontSize: 14,
                              color: Colorsax.white,
                              fontWeight: FontWeight.bold),
                        ]),
                  )
                ],
              ),
            ),
            Positioned(
                top: 0.h,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 2.5.w),
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.theme.listTileTheme.tileColor),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 15.sp,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //
  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     body: SafeArea(
  //       child: Stack(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: 2.5.h),
  //                 child: Textsax(
  //                     text: 'issue_description'.tr,
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.bold,
  //                     textAlign: TextAlign.center),
  //               )
  //             ],
  //           ),
  //           Positioned(
  //             top: 10.h,
  //             width: 100.w,
  //             height: 100.h,
  //             child: Container(
  //               padding: const EdgeInsets.all(20),
  //               width: size.width,
  //               height: size.height,
  //               child: ListView(
  //                 physics: const BouncingScrollPhysics(),
  //                 padding: EdgeInsets.zero,
  //                 children: [
  //                   textarea(
  //                       'issue_description'.tr,
  //                       Iconsax.warning_2,
  //                       TextInputType.visiblePassword,
  //                       context,
  //                       _selfaDetailsTextController),
  //                   GestureDetector(
  //                     onTap: _pickImageGallery,
  //                     child: Container(
  //                       margin: const EdgeInsets.symmetric(vertical: 10),
  //                       padding:
  //                           EdgeInsets.symmetric(horizontal: 10, vertical: 3.h),
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(15),
  //                           color: Get.theme.listTileTheme.tileColor),
  //                       child: Row(
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.symmetric(horizontal: 2.w),
  //                             child: Icon(
  //                               Iconsax.picture_frame,
  //                               color: Colorsax.lightBlue,
  //                             ),
  //                           ),
  //                           Textsax(text: 'add_screenshot'.tr, fontSize: 13),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 2.h,
  //                   ),
  //                   MaterialButton(
  //                     onPressed: Get.back,
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
  //                     elevation: 0,
  //                     color: Colorsax.blue,
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(15),
  //                         side: BorderSide.none),
  //                     child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Textsax(
  //                               text: 'report'.tr,
  //                               fontSize: 14,
  //                               color: Colorsax.white,
  //                               fontWeight: FontWeight.bold),
  //                         ]),
  //                   ),
  //                   // Container(
  //                   //   child: imageFile == null
  //                   //       ? Container(
  //                   //           child: Icon(
  //                   //           Iconsax.camera,
  //                   //           color: Colorsax.blue,
  //                   //           size: 25.sp,
  //                   //         ))
  //                   //       : Image.file(imageFile!),
  //                   // )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //               top: 0.h,
  //               child: GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: Container(
  //                   margin: EdgeInsets.symmetric(
  //                       vertical: 1.5.h, horizontal: 2.5.w),
  //                   width: 10.w,
  //                   height: 10.w,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color: Get.theme.listTileTheme.tileColor),
  //                   child: Icon(
  //                     Icons.arrow_back_ios_rounded,
  //                     size: 15.sp,
  //                   ),
  //                 ),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void _pickImageGallery() async {
    var galleryStatus = await Permission.storage.status;
    // ignore: unnecessary_statements
    !galleryStatus.isGranted ? await Permission.storage.request() : null;

    if (galleryStatus.isGranted) {
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
      try {
        setState(() {
          imageFile = pickedFile as File?;
        });
      } catch (e) {
        debugPrint('profile_picture_warning2'.tr);
      }
    } else {
      Get.snackbar('', "profile_picture_warning".tr);
    }
  }
}

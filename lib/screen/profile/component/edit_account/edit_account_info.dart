import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

class EditAccountInfoPage extends StatefulWidget {
  const EditAccountInfoPage({Key? key}) : super(key: key);

  @override
  State<EditAccountInfoPage> createState() => _EditAccountInfoPageState();
}

class _EditAccountInfoPageState extends State<EditAccountInfoPage> {
  late final TextEditingController _nameTextController =
      TextEditingController(text: '');
  late final TextEditingController _phoneTextController =
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
                      Container(
                          margin: const EdgeInsets.all(15),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: context.theme.listTileTheme.tileColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Textsax(
                              text: 'edit_info'.tr,
                              fontSize: 13.5,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2.h),
                    width: 100.w,
                    height: 89.h,
                    child: ListView(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: showImageDialog,
                            child: Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colorsax.lightBlue),
                              child: imageFile == null
                                  ? Container(
                                      child: Icon(
                                      Iconsax.camera,
                                      size: 25.sp,
                                    ))
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        imageFile!,
                                        fit: BoxFit.fill,
                                        width: 30.w,
                                        height: 30.w,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        txtFormField(
                          'fullname'.tr,
                          Iconsax.frame_1,
                          TextInputType.name,
                          TextInputAction.next,
                          _nameTextController,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        txtFormField(
                          'phone_num'.tr,
                          Iconsax.call,
                          TextInputType.phone,
                          TextInputAction.next,
                          _phoneTextController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.5.h),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide.none),
                          color: Colorsax.blue,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Textsax(
                                    text: 'edit'.tr,
                                    fontSize: 14,
                                    color: Colorsax.white,
                                    fontWeight: FontWeight.bold),
                              ]),
                        ),
                      ],
                    ),
                  ),
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

  void _cropImage(filePath) async {
    File? cropImage = await ImageCropper.cropImage(
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: AndroidUiSettings(
            backgroundColor: Get.theme.backgroundColor,
            activeControlsWidgetColor: Colorsax.blue,
            statusBarColor: Get.theme.scaffoldBackgroundColor,
            toolbarTitle: 'change_picture'.tr,
            hideBottomControls: true,
            lockAspectRatio: true,
            toolbarColor: Colorsax.black,
            toolbarWidgetColor: Colorsax.blue),
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080);
    try {
      setState(() {
        imageFile = cropImage;
      });
    } catch (e) {
      Get.snackbar('', "profile_picture_warning3".tr);
    }
  }

  void _pickImageCamera() async {
    var cameraStatus = await Permission.camera.status;
    !cameraStatus.isGranted ? await Permission.camera.request() : null;

    if (cameraStatus.isGranted) {
      Navigator.pop(context);
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
      try {
        _cropImage(pickedFile!.path);
      } catch (e) {
        Get.snackbar('', "profile_picture_warning2".tr);
      }
    } else if (cameraStatus.isDenied) {
      Get.snackbar('', "profile_picture_warning1".tr);
    }
  }

  void _pickImageGallery() async {
    var galleryStatus = await Permission.storage.status;
    // ignore: unnecessary_statements
    !galleryStatus.isGranted ? await Permission.storage.request() : null;

    if (galleryStatus.isGranted) {
      Navigator.pop(context);
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
      try {
        _cropImage(pickedFile!.path);
      } catch (e) {
        Get.snackbar('', "profile_picture_warning2".tr);
      }
    } else if (galleryStatus.isDenied) {
      Get.snackbar('', "profile_picture_warning".tr);
    }
  }

  void showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Textsax(text: 'pick_img'.tr, fontSize: 13),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: _pickImageCamera,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                        ),
                        Textsax(
                            text: 'camera'.tr,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: _pickImageGallery,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.image_rounded,
                        ),
                        Textsax(
                            text: 'gallery'.tr,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

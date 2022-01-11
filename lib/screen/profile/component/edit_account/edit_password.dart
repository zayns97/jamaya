import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

class EditPaswordPage extends StatefulWidget {
  const EditPaswordPage({Key? key}) : super(key: key);

  @override
  State<EditPaswordPage> createState() => _EditPaswordPageState();
}

class _EditPaswordPageState extends State<EditPaswordPage> {
  late final TextEditingController _currentPassTextController =
      TextEditingController(text: '');
  late final TextEditingController _passTextController =
      TextEditingController(text: '');
  late final TextEditingController _repPassTextController =
      TextEditingController(text: '');
  final currentPassFocusNode = FocusNode();
  final newPassFocusNode = FocusNode();
  final repPassFocusNode = FocusNode();

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
                            text: 'edit_password'.tr,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1.h),
                    width: 100.w,
                    height: 89.h,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        txtFormField(
                            'current_password'.tr,
                            Iconsax.key,
                            TextInputType.visiblePassword,
                            TextInputAction.next,
                            _currentPassTextController,
                            'This Field is required',
                            context,
                            currentPassFocusNode),
                        SizedBox(
                          height: 2.h,
                        ),
                        txtFormField(
                            'password'.tr,
                            Iconsax.password_check,
                            TextInputType.visiblePassword,
                            TextInputAction.next,
                            _passTextController,
                            'This Field is required',
                            context,
                            newPassFocusNode),
                        SizedBox(
                          height: 2.h,
                        ),
                        txtFormField(
                            'rep_password'.tr,
                            Iconsax.password_check,
                            TextInputType.phone,
                            TextInputAction.done,
                            _repPassTextController,
                            'This Field is required',
                            context,
                            repPassFocusNode),
                        SizedBox(
                          height: 12.h,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          padding: EdgeInsets.symmetric(vertical: 2.6.h),
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
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../tiles.dart';
import 'edit_account_info.dart';
import 'edit_password.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 5.w,
                left: 5.w,
                top: 15.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Tilesax(
                      context: context,
                      title: 'edit_account'.tr,
                      subtitle: 'edit_infos'.tr,
                      leading: Icon(Iconsax.user_edit),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                      navigateTo: const EditAccountInfoPage()),
                  SizedBox(
                    height: 3.h,
                  ),
                  Tilesax(
                      context: context,
                      title: 'edit_password'.tr,
                      subtitle: 'change_password'.tr,
                      leading: Icon(Iconsax.key),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                      navigateTo: const EditPaswordPage()),
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

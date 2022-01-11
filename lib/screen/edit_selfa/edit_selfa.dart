import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/screen/create_selfa/component/checkbox_widget.dart';
import 'package:selfa/screen/create_selfa/component/controller/checkbox_controller.dart';
import 'package:selfa/screen/create_selfa/component/txt_field_widget.dart';
import 'package:selfa/screen/selfa_feed/model/self_model.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

class EditSelfa extends StatefulWidget {
  const EditSelfa({Key? key, required this.selfa}) : super(key: key);
  final Selfa selfa;

  @override
  State<EditSelfa> createState() => _EditSelfaState();
}

class _EditSelfaState extends State<EditSelfa> {
  late final TextEditingController _selfaAmountTextController =
      TextEditingController(text: widget.selfa.selfa_amount);
  late final TextEditingController _selfaDetailsTextController =
      TextEditingController(text: widget.selfa.selfa_description);
  final loanAmountFocusNode = FocusNode();

  final CheckController checkController = Get.put(CheckController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 16.w,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all(1.7.w),
            width: 1.w,
            height: 1.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Get.theme.listTileTheme.tileColor),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Get.theme.dividerColor,
              size: 15.sp,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Textsax(
              text: 'edit_loan'.tr, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            txtFormField(
                'loan_amount'.tr,
                Iconsax.moneys,
                TextInputType.number,
                TextInputAction.next,
                _selfaAmountTextController,
                'Enter a valid number',
                context,
                loanAmountFocusNode),
            SizedBox(
              height: 3.h,
            ),
            textarea(
                'loan_description'.tr,
                Iconsax.tag,
                TextInputType.visiblePassword,
                context,
                _selfaDetailsTextController),
            checkBox(
                checkController: checkController,
                checked: false,
                description: 'private_loan_details'.tr,
                title: 'private_loan'.tr),
            checkBox(
                checkController: checkController,
                checked: false,
                description: 'half_loan_details'.tr,
                title: 'half_loan'.tr),
            checkBox(
                checkController: checkController,
                checked: false,
                description: 'first_loan_reserve_details'.tr,
                title: 'first_loan_reserve'.tr),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: Get.back,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  elevation: 0,
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Textsax(
                            text: 'delete_loan'.tr,
                            fontSize: 14,
                            color: Colorsax.white,
                            fontWeight: FontWeight.bold)
                      ]),
                ),
                MaterialButton(
                  onPressed: Get.back,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  elevation: 0,
                  color: Colorsax.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Textsax(
                            text: 'update_loan'.tr,
                            fontSize: 14,
                            color: Colorsax.white,
                            fontWeight: FontWeight.bold)
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

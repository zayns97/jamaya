import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

import '../../home_structure.dart';
import 'component/checkbox_widget.dart';
import 'component/controller/checkbox_controller.dart';
import 'component/txt_field_widget.dart';

class CreateSelfa extends StatefulWidget {
  const CreateSelfa({Key? key}) : super(key: key);

  @override
  State<CreateSelfa> createState() => _CreateSelfaState();
}

class _CreateSelfaState extends State<CreateSelfa> {
  late final TextEditingController _selfaAmountTextController =
      TextEditingController(text: '');
  late final TextEditingController _selfaDetailsTextController =
      TextEditingController(text: '');

  final CheckController checkController = Get.put(CheckController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Textsax(
              text: 'create_loan'.tr,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            txtFormField('loan_amount'.tr, Iconsax.moneys, TextInputType.number,
                TextInputAction.next, _selfaAmountTextController),
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
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const MyHomePage()));
              },
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              elevation: 0,
              color: Colorsax.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide.none),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Textsax(
                    text: 'create_loan'.tr,
                    fontSize: 14,
                    color: context.theme.listTileTheme.textColor,
                    fontWeight: FontWeight.bold)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

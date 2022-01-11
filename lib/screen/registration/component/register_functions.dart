import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../register.dart';
import '../verifcation.dart';

bool isLoading = false;
bool obscureText = true;

void submitFormOnRegister(BuildContext context) async {
  final isValid = registerFormKey.currentState!.validate();
  FocusScope.of(context).unfocus();
  if (isValid) {
    isLoading = true;

    try {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const PhoneVerification(
                autofocus: true,
              )));
    } catch (error) {
      isLoading = false;
    }
  } else {
    print('Form not valid');
  }
  isLoading = false;
}

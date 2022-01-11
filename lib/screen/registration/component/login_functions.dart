import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../login.dart';
import '../verifcation.dart';

bool isLoading = false;
bool obscureText = true;

void submitFormOnLogin(BuildContext context) async {
  final isValid = loginFormKey.currentState!.validate();
  FocusScope.of(context).unfocus();
  if (isValid) {
    isLoading = true;

    try {
      // await _auth.signInWithEmailAndPassword(
      //     email: phoneTextController.text.toLowerCase().trim(),
      //     password: passTextController.text.trim());
      Navigator.pushReplacement(
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

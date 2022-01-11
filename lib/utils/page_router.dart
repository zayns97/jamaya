import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

PageRouter(BuildContext context,
    {required PageTransitionType pageTransitionType,
    required Widget navigateTo}) {
  return Navigator.push(
      context,
      PageTransition(
        type: pageTransitionType,
        child: navigateTo,
      ));
}

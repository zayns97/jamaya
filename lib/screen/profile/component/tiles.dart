import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/utils/text_widget.dart';

Widget Tilesax({
  required BuildContext context,
  required String title,
  required String subtitle,
  required Widget leading,
  required Widget trailing,
  required Widget navigateTo,
}) {
  return ListTile(
    title: Textsax(text: title, fontSize: 16, fontWeight: FontWeight.bold),
    subtitle: Textsax(text: subtitle, fontSize: 13.5),
    leading: leading,
    trailing: trailing,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: navigateTo,
          ));
    },
    contentPadding: const EdgeInsets.all(15),
  );
}

Widget Tilesm({
  required BuildContext context,
  required String title,
  required IconData leading,
  required Widget navigateTo,
}) {
  return ListTile(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: navigateTo,
          ));
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Textsax(text: title, fontSize: 13.5),
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        leading,
      ),
    ),
    contentPadding: const EdgeInsets.all(5),
  );
}

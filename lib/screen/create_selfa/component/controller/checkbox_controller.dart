import 'package:get/get.dart';

class CheckController extends GetxController {
  bool checked = false;
  void check() {
    checked = !checked;
    update();
  }
}

import 'package:get/get.dart';

import 'theme/theme_controller.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.put(ColorController());
  }
}

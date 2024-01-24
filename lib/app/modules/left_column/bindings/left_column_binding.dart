import 'package:get/get.dart';

import 'package:portfolio/app/modules/left_column/controllers/section_button_controller.dart';

import '../controllers/left_column_controller.dart';

class LeftColumnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SectionButtonController>(
      () => SectionButtonController(),
    );
    Get.lazyPut<LeftColumnController>(
      () => LeftColumnController(),
    );
  }
}

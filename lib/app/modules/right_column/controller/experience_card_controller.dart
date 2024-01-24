import 'package:get/get.dart';

class ExperienceCardController extends GetxController {
  static ExperienceCardController get instance => Get.find();
  var isHovering = false.obs;

  onHover(bool value) {
    isHovering.value = value;
  }
}

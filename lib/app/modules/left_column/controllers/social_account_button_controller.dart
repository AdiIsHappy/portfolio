import 'package:get/get.dart';

class SocialAccountButtonController extends GetxController {
  final isHovered = false.obs;
  setHover(bool state) {
    isHovered.value = state;
  }
}

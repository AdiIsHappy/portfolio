import 'package:get/get.dart';

class ProjectCardController extends GetxController {
  final isHovering = false.obs;
  void onHover(bool value) => isHovering.value = value;
}

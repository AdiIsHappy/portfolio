import 'package:get/get.dart';

class HoverController extends GetxController {
  final hover = false.obs;
  onHover(value) {
    hover.value = value;
  }
}

import 'package:get/get.dart';

class SectionButtonController extends GetxController {
  var isSelected = false.obs;
  var isHovered = false.obs;

  void onHover(bool hover) {
    if (isSelected.value) {
      isHovered.value = true;
    } else {
      isHovered.value = hover;
    }
  }

  void onSelect(bool select) {
    isSelected.value = select;
  }
}

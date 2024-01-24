import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/left_column/controllers/section_button_controller.dart';
import 'package:portfolio/app/utils/constants/colors.dart';

class SelectionButton extends StatelessWidget {
  final String tag;
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final double lineHeight;

  const SelectionButton(
      {Key? key,
      required this.tag,
      required this.text,
      required this.onPressed,
      required this.isSelected,
      this.lineHeight = 1.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SectionButtonController(), tag: tag);

    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        onHover: (event) => controller.onHover(true),
        onExit: (event) => controller.onHover(false),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: 100.milliseconds,
                width: controller.isHovered.value
                    ? 80.0
                    : isSelected
                        ? 80.0
                        : 40.0,
                height: lineHeight,
                color: controller.isHovered.value
                    ? TColors.light
                    : isSelected
                        ? TColors.light
                        : TColors.grey.withOpacity(0.8),
              ),
              const SizedBox(width: 10),
              AnimatedDefaultTextStyle(
                style: controller.isHovered.value
                    ? const TextStyle(
                        color: TColors.light,
                        fontWeight: FontWeight.bold,
                      )
                    : isSelected
                        ? const TextStyle(
                            color: TColors.light,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            color: TColors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                          ),
                duration: 20.milliseconds,
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

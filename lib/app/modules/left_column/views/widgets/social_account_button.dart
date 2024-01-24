import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/left_column/controllers/social_account_button_controller.dart';
import 'package:portfolio/app/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TSocialAccountButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tag;

  const TSocialAccountButton(
      {super.key, required this.icon, required this.url, required this.tag});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SocialAccountButtonController(), tag: tag);
    return MouseRegion(
      onHover: (event) => controller.setHover(true),
      onExit: (event) => controller.setHover(false),
      child: GestureDetector(
        child: Obx(
          () => Icon(icon,
              color: controller.isHovered.value ? TColors.light : TColors.grey,
              size: 24),
        ),
        onTap: () async {
          await launchUrlString(url);
        },
      ),
    );
  }
}

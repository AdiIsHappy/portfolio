import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/right_column/controller/experience_list_controller.dart';
import 'package:portfolio/app/modules/right_column/views/widgets/expereience_card.dart';

class ExperiencesList extends StatelessWidget {
  const ExperiencesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExperienceListController());
    return Column(
      children: controller.experiences
          .map((element) =>
              ExpereienceCard(expereience: element, tag: element.name))
          .toList(),
    );
  }
}

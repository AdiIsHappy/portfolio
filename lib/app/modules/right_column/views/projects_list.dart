import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/additionals/hypertext/hyper_text.dart';
import 'package:portfolio/app/modules/right_column/controller/project_list_controller.dart';
import 'package:portfolio/app/modules/right_column/views/widgets/projects_card.dart';

class ProjectsList extends StatelessWidget {
  ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectListController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: controller.projects
              .map(
                  (element) => ProjectCard(project: element, tag: element.name))
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HoverableTextSpan(
            text: "View All Projects ↗",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/right_column/controller/hover_controller.dart';
import 'package:portfolio/app/modules/right_column/models/projects.dart';
import 'package:portfolio/app/utils/constants/colors.dart';
import 'package:portfolio/app/utils/constants/sizes.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.tag});
  final Project project;
  final String tag;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HoverController(), tag: tag);
    return MouseRegion(
      onEnter: (_) => controller.onHover(true),
      onExit: (_) => controller.onHover(false),
      child: Obx(
        () => GestureDetector(
          onTap: () => launchUrlString(project.url),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: TSizes.small),
            elevation: controller.hover.value ? 10 : 0,
            color: TColors.transparent,

            // surfaceTintColor: TColors.transparent,
            shadowColor: Colors.black.withOpacity(0.2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Container(
                      width: 160,
                      padding: const EdgeInsets.symmetric(
                        vertical: TSizes.small,
                        horizontal: TSizes.small,
                      ),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: project.thumnailUrl,
                        fit: BoxFit.fitWidth,
                        fadeInDuration: 100.milliseconds,
                      )),
                  // Content
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(TSizes.small),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(project.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: controller.hover.value
                                          ? TColors.secondary
                                          : TColors.light)),
                              AnimatedSize(
                                duration: 50.milliseconds,
                                child: Icon(
                                  Icons.arrow_outward_outlined,
                                  color: controller.hover.value
                                      ? TColors.secondary
                                      : TColors.light,
                                  size: controller.hover.value ? 24 : 16,
                                ),
                              )
                            ],
                          ),
                          Text(
                            project.description,
                            style: const TextStyle(
                                color: TColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                            softWrap: true,
                          ),
                          if (project.extrasText.isNotEmpty)
                            const SizedBox(height: TSizes.spaceBtwnItems),
                          // Refrences
                          Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: List.generate(
                                  project.extrasText.length,
                                  (index) => GestureDetector(
                                        onTap: () => launchUrlString(
                                            project.extrasUrl[index]),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              project.extrasText[index],
                                              style: const TextStyle(
                                                  color: TColors.white),
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(
                                              FontAwesomeIcons
                                                  .arrowUpRightFromSquare,
                                              size: 12,
                                              color: TColors.white,
                                            )
                                          ],
                                        ),
                                      ))),
                          const SizedBox(height: TSizes.spaceBtwnItems),
                          // Tags
                          Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: project.tags
                                  .map((element) => Container(
                                      decoration: BoxDecoration(
                                        color:
                                            TColors.secondary.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Text(element,
                                          style: const TextStyle(
                                              color: TColors.secondary))))
                                  .toList()),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/right_column/controller/hover_controller.dart';
import 'package:portfolio/app/modules/right_column/models/expereince.dart';
import 'package:portfolio/app/utils/constants/colors.dart';
import 'package:portfolio/app/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExpereienceCard extends StatelessWidget {
  const ExpereienceCard(
      {super.key, required this.expereience, required this.tag});
  final Experience expereience;
  final String tag;
  @override
  Widget build(BuildContext context) {
    final hoverController = Get.put(HoverController(), tag: tag);
    return MouseRegion(
      onEnter: (_) => hoverController.onHover(true),
      onExit: (_) => hoverController.onHover(false),
      child: Obx(
        () => GestureDetector(
          onTap: () => launchUrlString(expereience.url),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: TSizes.cardMargin),
            elevation: hoverController.hover.value ? 10 : 0,
            color: TColors.transparent,
            // surfaceTintColor: TColors.transparent,
            shadowColor: Colors.black.withOpacity(0.2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Container(
                    padding: const EdgeInsets.all(TSizes.small),
                    width: 160,
                    child: Text(
                      expereience.timeline,
                      style: const TextStyle(
                          color: TColors.darkGrey, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                              Text(expereience.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: hoverController.hover.value
                                          ? TColors.secondary
                                          : TColors.light)),
                              AnimatedSize(
                                duration: 50.milliseconds,
                                child: Icon(
                                  Icons.arrow_outward_outlined,
                                  color: hoverController.hover.value
                                      ? TColors.secondary
                                      : TColors.light,
                                  size: hoverController.hover.value ? 24 : 16,
                                ),
                              )
                            ],
                          ),
                          for (int i = 0; i < expereience.role.length; i++)
                            Text(expereience.role[i],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: TColors.darkGrey)),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            expereience.description,
                            style: const TextStyle(
                                color: TColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                            softWrap: true,
                          ),
                          if (expereience.refTexts.isNotEmpty)
                            const SizedBox(height: TSizes.spaceBtwnItems),
                          // Refrences
                          Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: List.generate(
                                  expereience.refTexts.length,
                                  (index) => GestureDetector(
                                        onTap: () => launchUrlString(
                                            expereience.refUrls[index]),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              expereience.refTexts[index],
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
                              children: expereience.tags
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

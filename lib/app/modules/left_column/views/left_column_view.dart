import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/modules/left_column/views/widgets/section_button.dart';
import 'package:portfolio/app/modules/left_column/views/widgets/social_account_button.dart';
import 'package:portfolio/app/utils/constants/colors.dart';
import 'package:portfolio/app/utils/constants/sizes.dart';
import 'package:portfolio/app/utils/constants/text.dart';

class LeftColumnView extends StatelessWidget {
  final controller = HomeController.instance;

  LeftColumnView({super.key});
  // const LeftColumnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: TSizes.large, bottom: TSizes.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 350,
              // color: Colors.amber,
              // padding: const EdgeInsets.only(top: TSizes.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Intro
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Name
                      Text(TTexts.name,
                          style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: TColors.light)),
                      SizedBox(height: TSizes.spaceBtwntext),
                      // Profession
                      Text(TTexts.profession,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: TColors.light)),
                      SizedBox(height: TSizes.spaceBtwntext),
                      // SubText
                      Text(TTexts.subText,
                          style: TextStyle(fontSize: 16, color: TColors.grey)),
                    ],
                  ),

                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.sections
                          .asMap()
                          .entries
                          .map((element) => Container(
                                margin: const EdgeInsets.only(
                                    top: TSizes.spaceBtwnItems),
                                child: SelectionButton(
                                  tag: element.value,
                                  text: element.value,
                                  onPressed: () {
                                    controller.selectedSectionIndex.value =
                                        element.key;
                                  },
                                  isSelected: element.key ==
                                      controller.selectedSectionIndex.value,
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              )),

          // Social Media
          Row(
            children: controller.socialContacts
                .map(
                  (element) => Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: TSocialAccountButton(
                          icon: element[2] as IconData,
                          tag: element[0].toString(),
                          url: element[1].toString())),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

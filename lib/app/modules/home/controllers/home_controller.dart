import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/additionals/hypertext/hyper_text.dart';
import 'package:portfolio/app/modules/right_column/views/expereinces_list.dart';
import 'package:portfolio/app/modules/right_column/views/projects_list.dart';
import 'package:portfolio/app/utils/constants/sizes.dart';
import 'package:portfolio/app/utils/constants/text.dart';
import 'package:portfolio/app/utils/constants/urls.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  var sections = ['About', 'Experiences', 'Projects'].obs;
  var selectedSectionIndex = 0.obs;
  var socialContacts = [
    ['github', TUrls.github, FontAwesomeIcons.github],
    ['linkedin', TUrls.linkedin, FontAwesomeIcons.linkedin],
    ['instagram', TUrls.instagram, FontAwesomeIcons.instagram],
    ['whatsapp', TUrls.whatsapp, FontAwesomeIcons.whatsapp],
  ].obs;
  final widgets = [
    HyperText(
      TTexts.aboutMe,
      margin: const EdgeInsets.only(top: TSizes.spaceBtwnSectionsLarge),
    ),
    const ExperiencesList(),
    ProjectsList(),
    HyperText(
      TTexts.buildBy,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwnSectionsLarge),
    ),
  ];
  final itemScrollController = ItemScrollController();
  final scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void onInit() {
    // TODO: implement onInit
    itemPositionsListener.itemPositions.addListener(() {
      final pos = itemPositionsListener.itemPositions.value.first.index;
      print(pos);
      selectedSectionIndex.value = pos;
    });
    super.onInit();
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/utils/constants/sizes.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RightColumnView extends StatelessWidget {
  const RightColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    final rcvController = HomeController.instance;
    return SizedBox(
        width: max(MediaQuery.of(context).size.width * 0.45, 550),
        child: ScrollablePositionedList.separated(
            physics: const BouncingScrollPhysics(),
            scrollOffsetController: rcvController.scrollOffsetController,
            itemScrollController: rcvController.itemScrollController,
            itemCount: rcvController.widgets.length,
            itemBuilder: (context, idx) => rcvController.widgets[idx],
            separatorBuilder: (_, __) =>
                SizedBox(height: TSizes.spaceBtwnSectionsLarge)));
  }
}

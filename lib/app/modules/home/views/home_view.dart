import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app/modules/left_column/views/left_column_view.dart';
import 'package:portfolio/app/modules/right_column/views/right_column_view.dart';
import 'package:portfolio/app/utils/constants/sizes.dart';
import 'package:portfolio/app/widgets/background.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.large),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [LeftColumnView(), const RightColumnView()]),
      ),
    ));
  }
}

import 'package:get/get.dart';
import 'package:portfolio/app/modules/right_column/models/expereince.dart';

class ExperienceListController extends GetxController {
  static ExperienceListController get instance => Get.find();
  var experiences = <Experience>[
    Experience(
        name: "AR Developer",
        role: ["Intern", "Team Lead"],
        description:
            "Designed and developed a complete proof of concept for Indoor navigation system, which uses 3d rendering power of unity 3d and AR Foundation framwork to deliver a seamles navigation system",
        homeVisibility: true,
        tags: [
          'Unity 3D',
          'AR Core',
          'Firbase',
          'Flutter',
          'AWS',
          'Blender',
          'AR Core',
          'AR Kit'
        ],
        url: 'https://heydoc.co.in/',
        timeline: 'Jun — July 2021',
        refTexts: ['Demo'],
        refUrls: ['https://heydoc.co.in/']),
    Experience(
        name: "Unity Designer",
        role: ["Intern"],
        description:
            "Designed and developed a complete proof of concept for Indoor navigation system, which uses 3d rendering power of unity 3d and AR Foundation framwork to deliver a seamles navigation system",
        homeVisibility: true,
        tags: [
          'Unity 3D',
          'AR Core',
          'Firbase',
          'Flutter',
          'AWS',
          'Blender',
          'AR Core',
          'AR Kit'
        ],
        url: 'https://heydoc.co.in/',
        timeline: 'Jun — July 2021',
        refTexts: ['Demo'],
        refUrls: ['https://heydoc.co.in/']),
  ].obs;
}

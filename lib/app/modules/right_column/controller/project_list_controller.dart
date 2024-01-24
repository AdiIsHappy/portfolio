import 'package:get/get.dart';
import 'package:portfolio/app/modules/right_column/models/projects.dart';

class ProjectListController extends GetxController {
  static ProjectListController get instance => Get.find();
  var projects = <Project>[
    Project(
        name: "Robot",
        description: "a good and consise project description will come here",
        homeVisibility: true,
        thumnailUrl: 'https://picsum.photos/250?image=9',
        url: '',
        tags: ['ROS', 'Python', 'Pandas'],
        extrasUrl: [''],
        extrasText: ['Demo']),
    Project(
        name: "Robot23",
        description: "a good and consise project description will come here",
        homeVisibility: true,
        thumnailUrl: 'https://picsum.photos/250?image=9',
        url: '',
        tags: ['ROS', 'Python', 'Pandas'],
        extrasUrl: [''],
        extrasText: ['Demo']),
    Project(
        name: "Robo34t",
        description: "a good and consise project description will come here",
        homeVisibility: true,
        thumnailUrl: 'https://picsum.photos/250?image=9',
        url: '',
        tags: ['ROS', 'Python', 'Pandas'],
        extrasUrl: [''],
        extrasText: ['Demo'])
  ].obs;
}

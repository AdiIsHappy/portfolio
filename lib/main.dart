import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

/* 
Pathways
1. complete background graient effect. Done
2. complete first column of th page. Ongoind
3. make card for Experience
4. make card for Projects
5. complete second column of the page
TODO: look at how u can link scroll and buttons
5.1. make both windows for tablet
5.2. make both windows for mobile
6. link firbase and hide all keys
7. make models for Experence
8. load experience from firebase
9. make models for Projects
10. load projects from firebase
 
*/

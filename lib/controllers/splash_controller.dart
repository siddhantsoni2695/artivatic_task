import 'dart:async';

import 'package:artivatic_task/routes/route_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    splashTimer();
    super.onInit();
  }

  void splashTimer() {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAndToNamed(dashboardScreen),
    );
  }
}

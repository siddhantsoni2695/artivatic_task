import 'dart:async';

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
      () {},
    );
  }
}

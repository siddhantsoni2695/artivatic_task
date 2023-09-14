import 'package:artivatic_task/constants/color_constant.dart';
import 'package:artivatic_task/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Center(
        child: Text(
          'ACTIVATIC.AI',
          style: TextStyle(
            color: color22B966,
            fontSize: 24.sp,
          ),
        ),
      ),
    );
  }
}

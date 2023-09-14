import 'package:artivatic_task/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
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

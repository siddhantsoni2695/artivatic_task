import 'package:artivatic_task/routes/app_routes.dart';
import 'package:artivatic_task/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bindings/network_binding.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(412, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: NetworkBinding(),
          initialRoute: splashScreen,
          getPages: appRoutes,
        );
      },
    ),
  );
}

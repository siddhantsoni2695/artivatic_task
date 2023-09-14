import 'package:artivatic_task/bindings/splash_binding.dart';
import 'package:artivatic_task/routes/route_name.dart';
import 'package:artivatic_task/screens/ui/splash_screen.dart';
import 'package:get/get.dart';

// List of pages
List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: splashScreen,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
];

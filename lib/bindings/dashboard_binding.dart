import 'package:artivatic_task/providers/dashboard_provider.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardProvider());
    Get.put(DashboardController(provider: Get.find()));
  }
}

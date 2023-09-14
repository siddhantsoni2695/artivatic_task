import 'package:artivatic_task/constants/url_constant.dart';
import 'package:get/get.dart';

class DashboardProvider extends GetConnect{

  @override
  void onInit() {
    httpClient.timeout = const Duration(
      seconds: 30,
    );
    httpClient.baseUrl = baseUrl;
  }

  // Getting api response
  Future<Response> apiGetDetails() async {
    dynamic response = await get(dataApiUrl);
    return response;
  }
}
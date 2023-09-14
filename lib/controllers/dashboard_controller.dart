import 'dart:convert';

import 'package:artivatic_task/modals/dashboard_data_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/dashboard_provider.dart';

class DashboardController extends GetxController {
  final DashboardProvider provider;

  DashboardController({required this.provider});

  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isLoadingRefresh = false.obs;
  Rx<DashboardDataResponse> dataResponse = DashboardDataResponse().obs;
  RxList<Rows> listOfRow = <Rows>[].obs;

  @override
  void onInit() {
    getDashboardData(isLoading);
    super.onInit();
  }

  // Getting Dashboard Data
  void getDashboardData(RxBool loader) {
    loader(true);
    try {
      provider.apiGetDetails().then((result) {
        String jsonDataString = result.bodyString ?? '';
        debugPrint("Response Data :: $jsonDataString");
        if (jsonDataString == '') {
          loader(false);
        } else {
          try {
            final Map<String, dynamic> parsed =
                json.decode(result.bodyString.toString());
            loader(false);
            dataResponse.value = DashboardDataResponse.fromJson(parsed);
            listOfRow.value = List.of(dataResponse.value.rows ?? []);
          } catch (e) {
            debugPrint('e $e');
            loader(false);
          }
        }
      });
    } catch (e) {
      debugPrint('e $e');
      loader(false);
    }
  }

  Future<void> onRefresh() async {
    getDashboardData(isLoadingRefresh);
  }

  // For searching in list
  void onSearchTextChanged(String searchText) {
    listOfRow.clear();
    if (searchText.isEmpty) {
      listOfRow.value = List.of(dataResponse.value.rows ?? []);
      return;
    }

    dataResponse.value.rows?.asMap().forEach(
      (key, rowDetails) {
        if (rowDetails.title
                ?.toLowerCase()
                .contains(searchText.toLowerCase()) ??
            false) {
          listOfRow.add(rowDetails);
        }
      },
    );
    listOfRow.refresh();
  }
}

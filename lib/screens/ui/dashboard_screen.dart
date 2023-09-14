import 'package:artivatic_task/constants/color_constant.dart';
import 'package:artivatic_task/controllers/dashboard_controller.dart';
import 'package:artivatic_task/modals/dashboard_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/common_widgets.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: color22B966,
        title: Text(
          controller.dataResponse.value.title ?? 'Dashboard',
          style: TextStyle(
            color: colorWhite,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              controller.isLoadingRefresh.value ? loadingView() : Container(),
              searchView(),
              controller.isLoading.value
                  ? loadingView()
                  : (controller.listOfRow.length ?? 0) == 0
                      ? noDataFound()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: controller.listOfRow.length,
                            itemBuilder: (context, index) {
                              return listItem(controller.listOfRow[index]);
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for search view
  Widget searchView() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: controller.searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
            onChanged: controller.onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.searchController.clear();
              controller.onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  // List item view
  Widget listItem(Rows? row) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  imageView(row?.imageHref ?? ''),
                  SizedBox(width: 12.w),
                  Flexible(
                    child: Text(
                      row?.title ?? '',
                      style: TextStyle(
                        color: color22B966,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: (row?.description ?? '') != '',
                child: SizedBox(height: 12.w),
              ),
              Visibility(
                visible: (row?.description ?? '') != '',
                child: Text(
                  row?.description ?? '',
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

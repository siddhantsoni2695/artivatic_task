import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color_constant.dart';
import '../../utility/network_manager.dart';

// Widget for showing loading
Widget loadingView() {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 16.h,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Loading data',
          style: TextStyle(
            color: color22B966,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(width: 16.w),
        const CircularProgressIndicator(
          color: color22B966,
        )
      ],
    ),
  );
}

// Widget for when data not found
Widget noDataFound() {
  return Center(
    child: Text(
      'Sorry no data found!',
      style: TextStyle(
        color: color22B966,
        fontSize: 24.sp,
      ),
    ),
  );
}

// Widget for image view from network
Widget imageView(String imageUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24.r),
    child: Image.network(
      imageUrl,
      height: 100.w,
      width: 100.w,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 100.w,
          width: 100.w,
          decoration: BoxDecoration(
            color: color22B966,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(
            child: Text(
              'Not Found',
              style: TextStyle(
                color: colorWhite,
                fontSize: 12.sp,
              ),
            ),
          ),
        );
      },
    ),
  );
}

// Widget for check network connectivity
Widget checkConnection() {
  return GetBuilder<GetXNetworkManager>(builder: (builder) {
    return (Get.find<GetXNetworkManager>().connectionType == 0)
        ? Text(
            'No Internet',
            style: TextStyle(
              fontSize: 24.sp,
              color: colorRed,
            ),
          )
        : Container();
  });
}

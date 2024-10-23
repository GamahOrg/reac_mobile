import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';

import '../my_app.dart';
import 'text_style.dart';

Widget loadingView() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 10.h,
          height: 10.h,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
        Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                MyApp.tr.loading,
                style: AppTextStyle.normal,
                textAlign: TextAlign.center,
              )),
        )
      ],
    ),
  );
}

Widget buildEmptyView() {
  return Center(
    child: Text(
      MyApp.tr.noResults,
      style: TextStyle(fontSize: 15.sp),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/my_app.dart';

import '../../app/app_assets.dart';
import '../domain/models/rating_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Center(),
      ),
    );
  }

  Container detectionArbitrators() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: const Color(0xFFA5AEB1),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 21,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'محمد عبدالعزيز الدوسري',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xffFFFFFF)),
          ),
          SvgPicture.asset(AppAssets.icSort)
        ],
      ),
    );
  }
}

List ratingList = [
  RatingModel(
      image: AppAssets.bgSatistiedFace, text: MyApp.tr.completelySatisfied),
  RatingModel(image: AppAssets.bgSatistiedFace, text: MyApp.tr.satisfied),
  RatingModel(image: AppAssets.bgSatistiedFace, text: MyApp.tr.neutral),
  RatingModel(image: AppAssets.bgSatistiedFace, text: MyApp.tr.notSatisfied),
  RatingModel(
      image: AppAssets.bgSatistiedFace, text: MyApp.tr.notSatisfiedAtAll),
];

import 'package:flutter/material.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';

import '../../../../app/app_assets.dart';
import '../../../../app/custom_bottom_sheet.dart';
import '../../../../app/default_button.dart';
import '../../../../my_app.dart';
import '../../../domain/models/rating_model.dart';

class RatingBottomSheet extends StatefulWidget {
  final String title;
  final List<RatingModel> ratingList;
  final Function onCancel;
  final Function(int) onSend;

  const RatingBottomSheet({
    super.key,
    required this.title,
    required this.ratingList,
    required this.onCancel,
    required this.onSend,
  });

  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
  static show(BuildContext context, Function(int) onSend) {
    return CustomBottomSheet.show(context,
        child: RatingBottomSheet(
          title: MyApp.tr.evaluationOfTheAuditStage,
          ratingList: [
            RatingModel(
                image: AppAssets.bgSatistiedFace,
                text: MyApp.tr.completelySatisfied),
            RatingModel(image: AppAssets.bgSmailFace, text: MyApp.tr.satisfied),
            RatingModel(image: AppAssets.bgNaturalFace, text: MyApp.tr.neutral),
            RatingModel(
                image: AppAssets.bgNotSatisfiedFace,
                text: MyApp.tr.notSatisfied),
            RatingModel(
                image: AppAssets.bgAngryFace, text: MyApp.tr.notSatisfiedAtAll),
          ],
          onCancel: () {
            Navigator.pop(context);
          },
          onSend: (int value) {
            onSend.call(value);
            Navigator.pop(context);
          },
        ),
        isClose: false);
  }
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.TextBlack),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 7.5.h,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 58,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.appSecondWhite,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        ),
                      ],
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [AppColors.appSecondblue, AppColors.selectedTextTab],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : const LinearGradient(
                              colors: [Colors.white, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image:
                              AssetImage("${widget.ratingList[index].image}"),
                          color: isSelected
                              ? AppColors.white
                              : AppColors.appThirdblue,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "${widget.ratingList[index].text}",
                          style: TextStyle(
                              fontSize: 6.sp,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.selectedTextTab),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 1.5.w,
                );
              },
              itemCount: widget.ratingList.length,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DefaultButton(
                  radius: 30,
                  firstGradientColor: Colors.white,
                  secondGradientColor: Colors.white,
                  title: MyApp.tr.cancellation,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.selectedTextTab,
                  onTap: () {
                    widget.onCancel();
                  },
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                flex: 2,
                child: DefaultButton(
                  radius: 30,
                  firstGradientColor: AppColors.selectedTextTab,
                  secondGradientColor: AppColors.selectedTextTab,
                  title: MyApp.tr.send,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  onTap: () {
                    widget.onSend(selectedIndex);
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          )
        ],
      ),
    );
  }
}

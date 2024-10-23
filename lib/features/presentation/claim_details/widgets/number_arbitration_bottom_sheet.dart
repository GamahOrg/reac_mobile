import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';
import 'package:reac/features/presentation/manager/get_number_of_arbitration_panel_cubit.dart';
import '../../../../app/app_assets.dart';
import '../../../../app/custom_bottom_sheet.dart';
import '../../../../app/default_button.dart';
import '../../../../my_app.dart';
import '../../../domain/models/claim_model/number_of_arbitrations_request_model.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_drop_down_button_text_field.dart';

class NumberArbitrationBottomSheet extends StatefulWidget {
  NumberArbitrationBottomSheet({super.key, required this.requestId});

  String? requestId;

  static show(BuildContext context, requestId) {
    CustomBottomSheet.show(context, child: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return NumberArbitrationBottomSheet(
          requestId: requestId,
        );
      },
    ), backgroundColor: AppColors.selectedTabBackground, isClose: false);
  }

  @override
  State<NumberArbitrationBottomSheet> createState() =>
      _NumberArbitrationBottomSheetState();
}

class _NumberArbitrationBottomSheetState
    extends State<NumberArbitrationBottomSheet> {
  String? selectedVal;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NumberOfArbitrationPanelCubit>()
        ..executeNumberOfArbitration(),
      child: BlocConsumer<NumberOfArbitrationPanelCubit, ClaimStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.watch<NumberOfArbitrationPanelCubit>();
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: AppColors.selectedTabBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  child: Text(
                    MyApp.tr.determineTheNumberOfArbitrationPanels,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.TextBlack),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                          vertical: 1.5.h,
                          text: MyApp.tr.arbitratorsFees,
                          color: const Color(0xffFFF7D9),
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp,
                          textColor: AppColors.textTitleLightGrey),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text(
                          MyApp.tr.numberOfArbitrationPanel,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.TextBlack),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      CustomDropdownButtonFormField(
                        borderColor: AppColors.lightColor,
                        radius: 50,
                        items: cubit.numberOfArbitrationsModel
                            .orEmpty()
                            .map((e) => e.arbitratorCount.toString())
                            .toList(),
                        hintText: MyApp.tr.chooseTheNumber,
                        suffixIconPath: AppAssets.icArrowUp,
                        onChanged: (String? newValue) {
                          selectedVal = newValue;
                          print('Selected value: $newValue');
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                 Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 2.h),
                            child: Container(
                                height: 50,
                                child: Row(
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
                                          Navigator.pop(context);
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
                                        firstGradientColor:
                                            AppColors.selectedTextTab,
                                        secondGradientColor:
                                            AppColors.selectedTextTab,
                                        title: MyApp.tr.send,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        textColor: Colors.white,
                                        onTap: () {
                                         Navigator.pop(context, cubit.executeNumberOfArbitrationRequest(numberOfArbitractionsRequestModel:
                                             NumberOfArbitractionsRequestModel(
                                                 requestId: widget.requestId,
                                                 arbitratorCount: int.tryParse(
                                                     selectedVal!))));
                                        },
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),

                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

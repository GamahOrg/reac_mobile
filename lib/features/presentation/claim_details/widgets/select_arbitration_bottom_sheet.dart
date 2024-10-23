import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';

import '../../../../app/app_assets.dart';
import '../../../../app/custom_bottom_sheet.dart';
import '../../../../app/default_button.dart';
import '../../../../my_app.dart';
import '../../../domain/models/claim_model/details_response_model.dart';
import '../../../domain/models/claim_model/selection_arbitrator_body.dart';
import '../../manager/selection_arbitrator_cubit.dart';


class appointmentOfMembersOfTheArbitrationBottomSheet extends StatefulWidget {
  appointmentOfMembersOfTheArbitrationBottomSheet({super.key, this.litigationRequestId});

  String? litigationRequestId;

  @override
  State<appointmentOfMembersOfTheArbitrationBottomSheet> createState() =>
      _appointmentOfMembersOfTheArbitrationBottomSheetState();

  static show(BuildContext context, litigationRequestId) {
    CustomBottomSheet.show(context, child: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return appointmentOfMembersOfTheArbitrationBottomSheet(
            litigationRequestId: litigationRequestId);
      },
    ), backgroundColor: AppColors.selectedTabBackground, isClose: false);
  }
}

class _appointmentOfMembersOfTheArbitrationBottomSheetState
    extends State<appointmentOfMembersOfTheArbitrationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<AppointmentMembersArbitrationPanelCubit>()
        ..executeGetArbitrator(requestId: widget.litigationRequestId),
      child: BlocConsumer<AppointmentMembersArbitrationPanelCubit, ClaimStates>(
        listener: (Context, state) {},
        builder: (context, state) {
          final cubit = context.watch<AppointmentMembersArbitrationPanelCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    MyApp.tr.identificationOfArbitrators,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: AppColors.TextBlack),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    MyApp.tr
                        .optionalDragTheNameOfTheArbitratorsAndArrangethemAtTheTop,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff61686B)),
                  ),
                ),
                ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: (int oldIndex, int newIndex) {

                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final arbitrator = cubit
                        .arbitratorsModelGet!.citizenArbitratorShortStatusDtos!
                        .removeAt(oldIndex);
                    cubit.arbitratorsModelGet!.citizenArbitratorShortStatusDtos!
                        .insert(newIndex, arbitrator);
                    setState(() {});
                  },
                  itemCount: cubit.arbitratorsModelGet
                      ?.citizenArbitratorShortStatusDtos
                      .orEmpty()
                      .length ?? 0,
                  itemBuilder: (context, index) {
                    if (cubit.arbitratorsModelGet == null ||
                        cubit.arbitratorsModelGet!
                            .citizenArbitratorShortStatusDtos ==
                            null ||
                        cubit.arbitratorsModelGet!
                            .citizenArbitratorShortStatusDtos!.isEmpty) {
                      return const SizedBox.shrink();
                    }else{
                      return Container(
                        key: ValueKey(cubit.arbitratorsModelGet!
                            .citizenArbitratorShortStatusDtos![index].id),
                        child: detectionArbitrators(
                          cubit.arbitratorsModelGet!
                              .citizenArbitratorShortStatusDtos![index],
                          index,
                        ),
                      );
                    }

                  },
                ),
                SizedBox(
                  height: 3.h,
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
                        firstGradientColor: AppColors.selectedTextTab,
                        secondGradientColor: AppColors.selectedTextTab,
                        title: MyApp.tr.send,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onTap: () {
                          cubit.createNumberedList();
                          final priorities = cubit.numberedList;
                          Navigator.pop(context,cubit.executeAddArbitrator(
                              selectionArbitratorRequest: SelectionArbitratorRequest(
                                requestId: widget.litigationRequestId,
                                arbitratorNominationListRequestItems: [
                                  ...List.generate(
                                    cubit.arbitratorsModelGet?.citizenArbitratorShortStatusDtos?.length ?? 0,
                                        (i) => ArbitratorNominationListRequestItems(
                                      arbitratorListId: cubit.arbitratorsModelGet?.citizenArbitratorShortStatusDtos?[i].id,
                                      priority: (i < priorities.length) ? priorities[i] : 0,
                                    ),
                                  ),
                                ],
                              )
                          ));
                        },
                      ),
                    )
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
  Container detectionArbitrators(
      CitizenArbitratorShortStatusDtos citizenArbitratorShortStatusDtos,
      index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: const Color(0xFFdce0e4),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${citizenArbitratorShortStatusDtos.fullName}",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.TextBlack),
          ),
          SvgPicture.asset(AppAssets.icSort, color: AppColors.TextBlack)
        ],
      ),
    );
  }


}

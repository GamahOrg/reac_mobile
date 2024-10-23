import 'package:flutter/material.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/models/claim_model/details_response_model.dart';
import '../../../../app/app_assets.dart';
import '../../../../my_app.dart';
import '../../../app/app_colors.dart';
import '../widgets/custom_extention_tile.dart';
import '../widgets/custom_row.dart';

class ClaimDataShortWidget extends StatelessWidget {
  ClaimStatus? status;

  ClaimDataShortWidget({super.key, required this.generalModel, this.typeStep});

  StepsClaims? typeStep;
  DetailsResponseModel? generalModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        typeStep ==StepsClaims.determineTheNumberOfArbitrators&&generalModel?.allowAdd==false||typeStep == StepsClaims.appointmentOfMembersOfTheArbitrationPanel&&generalModel?.allowAdd==false?    SizedBox(
        height: 3.h,
      ):const SizedBox(),
        typeStep ==StepsClaims.determineTheNumberOfArbitrators&&generalModel?.allowAdd==false
            ? CustomExpansionTile(
                isLoading: true,
                isPaddingTitle: true,
                initiallyExpanded: true,
                expandedIcon: AppAssets.icArrowDown,
                collapsedIcon: AppAssets.icArrowUp,
                title: MyApp.tr.determineTheNumberOfArbitrators,
                leading: Image(
                  image: AssetImage(AppAssets.icClaimsInfo),
                ),
                children: [
                    CustomRow(
                        dm: CustomRowDM(
                            value:
                                (generalModel?.arbitratorsCount?.toString() ??
                                    "") as String?,
                            label: MyApp.tr.numberOfArbitrators)),
                  ])
            : const SizedBox(),
        typeStep == StepsClaims.appointmentOfMembersOfTheArbitrationPanel&&generalModel?.allowAdd==false
            ? CustomExpansionTile(
                isLoading: true,
                isPaddingTitle: true,
            initiallyExpanded: true,
            expandedIcon: AppAssets.icArrowDown,
                collapsedIcon: AppAssets.icArrowUp,
                title: MyApp.tr.arbitratorsRanking,
                leading: Image(
                  image: AssetImage(AppAssets.icClaimsInfo),
                ),
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: buildDivider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                MyApp.tr.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.sp,
                                  color: AppColors.darkPinputColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                MyApp.tr.orderOfPriority,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.sp,
                                  color: AppColors.darkPinputColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                MyApp.tr.brief,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.sp,
                                  color: AppColors.darkPinputColor,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: buildDivider(),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: generalModel?.citizenArbitratorShortStatusDtos?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:  EdgeInsets.symmetric(vertical: 1.2.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      generalModel?.citizenArbitratorShortStatusDtos![index].fullName ?? "",
                                      style: TextStyle(fontSize: 9.sp),
                                    ),
                                  ),
                                  Expanded(flex:1,
                                    child: Text(
                                      generalModel?.citizenArbitratorShortStatusDtos![index].value.toString() ?? "",
                                      style: TextStyle(fontSize: 9.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      generalModel?.citizenArbitratorShortStatusDtos![index].brief ?? "",
                                      style: TextStyle(fontSize: 9.sp),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )

                ])
            : const SizedBox(),
        SizedBox(
          height: 3.h,
        ),
        CustomExpansionTile(
            isLoading: true,
            isPaddingTitle: true,
            expandedIcon: AppAssets.icArrowDown,
            collapsedIcon: AppAssets.icArrowUp,
            title: MyApp.tr.claimantData,
            leading: Image(
              image: AssetImage(AppAssets.icClaimsInfo),
            ),
            children: [
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.fullName ??
                          "",
                      label: MyApp.tr.plaintiff)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.fax ??
                          "",
                      label: MyApp.tr.fax)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.homeTelephone ??
                          "",
                      label: MyApp.tr.homeTele)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.workTelephone ??
                          "",
                      label: MyApp.tr.workTele)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.identityNumber ??
                          "",
                      label: MyApp.tr.idNumber)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCapacity ??
                          "",
                      label: MyApp.tr.plaintiffStatus)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.mobile ??
                          "",
                      label: MyApp.tr.mobileNumber)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.firstPartyCitizen?.email ??
                          "",
                      label: MyApp.tr.email)),
            ]),
        SizedBox(
          height: 3.h,
        ),
        CustomExpansionTile(
            isLoading: true,
            isPaddingTitle: true,
            initiallyExpanded: false,
            title: MyApp.tr.defendantData,
            leading: Image(
              image: AssetImage(AppAssets.icClaimsInfo),
            ),
            expandedIcon: AppAssets.icArrowDown,
            collapsedIcon: AppAssets.icArrowUp,
            children: [
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.fullName ??
                          "",
                      label: MyApp.tr.fullName)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCapacity ??
                          "",
                      label: MyApp.tr.characteristicsOfTheDefendant)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.fax ??
                          "",
                      label: MyApp.tr.fax)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.homeTelephone ??
                          "",
                      label: MyApp.tr.homeTele)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.workTelephone ??
                          "",
                      label: MyApp.tr.workTele)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.mobile ??
                          "",
                      label: MyApp.tr.mobileNumber)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.email ??
                          "",
                      label: MyApp.tr.email)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.secondPartyCitizen?.identityNumber ??
                          "",
                      label: MyApp.tr.idNumber)),
            ]),
        SizedBox(
          height: 3.h,
        ),
        CustomExpansionTile(
            isLoading: true,
            isPaddingTitle: true,
            initiallyExpanded: false,
            title: MyApp.tr.claimData,
            leading: Image(
              image: AssetImage(AppAssets.icClaimsInfo),
            ),
            expandedIcon: AppAssets.icArrowDown,
            collapsedIcon: AppAssets.icArrowUp,
            children: [
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel
                              ?.litigationRequestShortDto?.requestCode ??
                          "",
                      label: MyApp.tr.caseCode)),
              CustomRow(
                  dm: CustomRowDM(
                      value:
                          generalModel?.litigationRequestShortDto?.cityName ??
                              "",
                      label: MyApp.tr.theCity)),
              CustomRow(
                  dm: CustomRowDM(
                      value:
                          generalModel?.litigationRequestShortDto?.areaName ??
                              "",
                      label: MyApp.tr.area)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel
                              ?.litigationRequestShortDto?.contractAddress ??
                          "",
                      label: MyApp.tr.caseTitle)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto?.contract
                              ?.litigationRequestContractType?.typeName ??
                          "",
                      label: MyApp.tr.caseTitle)),
              CustomRow(
                  dm: CustomRowDM(
                      value: generalModel?.litigationRequestShortDto
                              ?.litigationRequestCategory?.categoryName ??
                          "",
                      label: MyApp.tr.requestType)),
            ]),
      ],
    );
  }

  Divider buildDivider() {
    return const Divider(
                          height: 2,
                          color: AppColors.dividerColor,
                        );
  }

  String getContractNumberText(int? contractTypeId) {
    final contractTypeMap = {
      82: MyApp.tr.leaseContractNumber,
      66: MyApp.tr.brokerageContractNumber,
      78: MyApp.tr.otherContractNumber,
      79: MyApp.tr.contractNumberAngel,
      87: MyApp.tr.theContractNumberIsWafi,
    };

    return contractTypeMap[contractTypeId] ?? "";
  }

  Widget _buildDataRow(
    String name,
    int priority,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: AppColors.pinputColor.withOpacity(0.6)),
          ),
          Text(
            priority.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: AppColors.pinputColor.withOpacity(0.6)),
          ),
          Text(
            description,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: AppColors.pinputColor.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/helpers/date_time_helper.dart';

import '../../../../app/app_assets.dart';
import '../../../../my_app.dart';
import '../../../domain/models/claim_model/claim_details_model.dart';
import '../../widgets/custom_extention_tile.dart';
import '../../widgets/custom_row.dart';
import 'files.dart';

class ClaimDataWidget extends StatelessWidget {
  ClaimStatus? status;

  ClaimDataWidget({super.key, required this.claimDetailsModel});

  ClaimDetailsModel? claimDetailsModel;

  @override
  Widget build(BuildContext context) {
    String contractNumberText = getContractNumberText(
        claimDetailsModel?.contract?.litigationRequestContractTypeId);
    return Column(
      children: [
        SizedBox(
          height: 2.h,
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
                      value: claimDetailsModel
                              ?.contract?.firstPartyCitizen?.fullName ??
                          "",
                      label: MyApp.tr.plaintiff)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                              ?.contract?.firstPartyCitizen?.identityNumber ??
                          "",
                      label: MyApp.tr.idNumber)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                              ?.contract?.firstPartyCitizen?.fullName ??
                          "",
                      label: MyApp.tr.claimantName)),
              CustomRow(
                  dm: CustomRowDM(
                      value:
                          claimDetailsModel?.contract?.firstPartyCapacity ?? "",
                      label: MyApp.tr.plaintiffStatus)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                              ?.contract?.firstPartyCitizen?.mobile ??
                          "",
                      label: MyApp.tr.mobileNumber)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.contract?.firstPartyCitizen
                              ?.nationality?.nationalityName ??
                          "",
                      label: MyApp.tr.nationality)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                                  ?.contract?.firstPartyCitizen?.birthDate !=
                              null
                          ? DateTimeHelper.formatStringToNewFormat(
                              claimDetailsModel!
                                  .contract!.firstPartyCitizen!.birthDate)
                          : "",
                      label: MyApp.tr.dateOfBirth)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                              ?.contract?.firstPartyCitizen?.email ??
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
                      value: claimDetailsModel?.contract?.secondPartyCapacity ??
                          "",
                      label: MyApp.tr.characteristicsOfTheDefendant)),
              claimDetailsModel?.contract?.litigationRequestContractTypeId !=
                      LitigationRequestContractType.wafi.value
                  ? Column(
                      children: [
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel?.contract
                                        ?.secondPartyCitizen?.identityNumber ??
                                    "",
                                label: MyApp.tr.idNumber)),
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel?.contract
                                        ?.secondPartyCitizen?.mobile ??
                                    "",
                                label: MyApp.tr.mobileNumber)),
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel
                                        ?.contract
                                        ?.secondPartyCitizen
                                        ?.nationality
                                        ?.nationalityName ??
                                    "",
                                label: MyApp.tr.nationality)),
                        CustomRow(
                          dm: CustomRowDM(
                            value: claimDetailsModel?.contract
                                        ?.secondPartyCitizen?.birthDate !=
                                    null
                                ? DateTimeHelper.formatStringToNewFormat(
                                    claimDetailsModel!.contract!
                                        .secondPartyCitizen!.birthDate)
                                : "",
                            label: MyApp.tr.dateOfBirth,
                          ),
                        ),
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel
                                        ?.contract?.secondPartyCitizen?.email ??
                                    "",
                                label: MyApp.tr.email)),
                      ],
                    )
                  : const SizedBox(),
              claimDetailsModel?.contract?.litigationRequestContractTypeId ==
                      LitigationRequestContractType.wafi.value
                  ? Column(
                      children: [
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel
                                        ?.contract
                                        ?.secondPartyFacility
                                        ?.arabicFacilityName ??
                                    "",
                                label: MyApp.tr.nameOfEstablishment)),
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel
                                        ?.contract
                                        ?.secondPartyFacility
                                        ?.commercialRegisterNumber ??
                                    "",
                                label: MyApp.tr.commercialRegistrationNumber)),
                        CustomRow(
                            dm: CustomRowDM(
                                value: claimDetailsModel
                                        ?.contract
                                        ?.secondPartyFacility
                                        ?.facility700Number ??
                                    "",
                                label: MyApp.tr.establishmentNumber)),
                      ],
                    )
                  : SizedBox()
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
                      value: claimDetailsModel?.contract?.versionNumber ?? "",
                      label: MyApp.tr.versionNumber)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.contract?.contractKey ?? "",
                      label: contractNumberText)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.contractAddress ?? "",
                      label: MyApp.tr.theAddress)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.description ?? "",
                      label: MyApp.tr.descriptionOfTheClaim)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.title ?? "",
                      label: MyApp.tr.caseTitle)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.isFinancialLitigation != null
                          ? claimDetailsModel!.isFinancialLitigation == true
                              ? "مالى"
                              : "غير مالى"
                          : "",
                      label: MyApp.tr.typeOfConflict)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                              ?.litigationRequestAmount?.litigationAmount ??
                          "",
                      label: MyApp.tr.disputeAmount)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.area?.areaName ?? "",
                      label: MyApp.tr.area)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.city?.cityName ?? "",
                      label: MyApp.tr.theCity)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel
                              ?.litigationRequestCategory?.categoryName ??
                          "",
                      label: MyApp.tr.requestType)),
              CustomRow(
                  dm: CustomRowDM(
                      value: claimDetailsModel?.litigationRequestRequests
                              ?.map((e) => e.requestContent)
                              .join(', ') ??
                          '',
                      label: MyApp.tr.claimRequests)),
              claimDetailsModel?.contract?.litigationRequestContractTypeId !=
                          LitigationRequestContractType.otherServices.value &&
                      claimDetailsModel
                              ?.contract?.litigationRequestContractTypeId !=
                          LitigationRequestContractType.properties.value
                  ? CustomRow(
                      dm: CustomRowDM(
                          lastIcon: claimDetailsModel
                                      ?.contract?.contractFile?.filePath !=
                                  null
                              ? AppAssets.icEye
                              : "",
                          onTap1: () {
                            Files.openFileFromUrl(
                                "http://192.168.194.171:3333/${claimDetailsModel?.contract?.contractFile?.filePath ?? ""}");
                          },
                          value: claimDetailsModel
                                  ?.contract?.contractFile?.fileDescription ??
                              "",
                          label: claimDetailsModel?.contract
                                      ?.litigationRequestContractTypeId ==
                                  LitigationRequestContractType.rent.value
                              ? MyApp.tr.leaseContractFile
                              : claimDetailsModel?.contract
                                          ?.litigationRequestContractTypeId ==
                                      LitigationRequestContractType
                                          .realEstateBrokerage.value
                                  ? MyApp.tr.mediationContractFile
                                  : MyApp.tr.comprehensiveContractFile))
                  : const SizedBox(),
              claimDetailsModel?.contract?.litigationRequestContractTypeId ==
                      LitigationRequestContractType.properties.value
                  ? Column(
                      children: [
                        CustomRow(
                            dm: CustomRowDM(
                                onTap1: () {
                                  Files.openFileFromUrl(
                                      "http://192.168.194.171:3333/${claimDetailsModel?.contract?.associationRegistrationCertificateFile?.filePath ?? ""}");
                                },
                                lastIcon: claimDetailsModel
                                            ?.contract
                                            ?.associationRegistrationCertificateFile
                                            ?.filePath !=
                                        null
                                    ? AppAssets.icEye
                                    : "",
                                value: claimDetailsModel
                                        ?.contract
                                        ?.associationRegistrationCertificateFile
                                        ?.fileDescription ??
                                    '',
                                label: MyApp
                                    .tr.associationRegistrationCertificate)),
                        CustomRow(
                            dm: CustomRowDM(
                                onTap1: () {
                                  Files.openFileFromUrl(
                                      "http://192.168.194.171:3333/${claimDetailsModel?.contract?.internalRegulationsFile?.filePath ?? ''}");
                                },
                                lastIcon: claimDetailsModel
                                            ?.contract
                                            ?.internalRegulationsFile
                                            ?.filePath !=
                                        null
                                    ? AppAssets.icEye
                                    : "",
                                value: claimDetailsModel
                                        ?.contract
                                        ?.internalRegulationsFile
                                        ?.fileDescription ??
                                    '',
                                label: MyApp
                                    .tr.theAssociationInternalRegulations)),
                        CustomRow(
                            dm: CustomRowDM(
                                onTap1: () {
                                  Files.openFileFromUrl(
                                      "http://192.168.194.171:3333/${claimDetailsModel?.contract?.foundingLetterFile?.filePath ?? ''}");
                                },
                                lastIcon: claimDetailsModel?.contract
                                            ?.foundingLetterFile?.filePath !=
                                        null
                                    ? AppAssets.icEye
                                    : null,
                                value: claimDetailsModel?.contract
                                        ?.foundingLetterFile?.fileDescription ??
                                    '',
                                label: MyApp
                                    .tr.letterOfIncorporationOfTheAssociation)),
                      ],
                    )
                  : const SizedBox(),
              CustomRow(
                  dm: CustomRowDM(
                      lastIcon: (claimDetailsModel?.litigationRequestGrounds
                          ?.any((ground) => ground.litigationRequestGroundFiles
                          ?.any((file) => file.fileManager?.filePath?.isNotEmpty ?? false) ?? false)
                          ?? false)

                          ? AppAssets.icEye
                          : "",
                      onTap1: () {
                        final url = "http://192.168.194.171:3333/${claimDetailsModel?.litigationRequestGrounds?.expand((e) => e.litigationRequestGroundFiles ?? []).map((file) => file.fileManager?.filePath).join(",")}";
                        Files.openFileFromUrl(url);
                      },
                      value: claimDetailsModel?.litigationRequestGrounds!
                              .map((e) => e.title)
                              .join(', ') ??
                          '',
                      label: MyApp.tr.attributions)),
            ]),
      ],
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
}

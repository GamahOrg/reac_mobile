import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_row.dart';

import '../../../app/app_assets.dart';
import '../../../app/constants.dart';
import '../../../app/default_button.dart';
import '../../../my_app.dart';
import '../auth_screens/widgets.dart';

class ClaimDetailsSCreen extends StatelessWidget {
  const ClaimDetailsSCreen({super.key});

  static const String id = "ClaimDetailsSCreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,MyApp.tr.caseDetails),
      body: buildContent(),
    );
  }

  SingleChildScrollView buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
        child: Column(
          children: [
            buildCard(),
            SizedBox(
              height: 3.h,
            ),
            CustomExpansionTile(
                isLoading: true,
                isPaddingTitle: true,
                initiallyExpanded: false,
                title: MyApp.tr.leaseContractInformation,
                leading: Image(
                  image: AssetImage(AppAssets.icClaimsInfo),
                ),
                expandedIcon: AppAssets.icArrowDown,
                collapsedIcon: AppAssets.icArrowUp,
                children: [
                  CustomRow(
                      dm: CustomRowDM(
                          value: '346780435678', label: 'رقم النسخة')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '5678453', label: 'رقم عقد الإيجار')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'مقدم عن نفسه', label: 'مقدم الدعوى')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'العنوان الوطني', label: 'العنوان الوطني')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '0137483967', label: 'رقم الهوية')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي')),
                  CustomRow(
                      dm: CustomRowDM(value: 'مستأجر', label: 'صفة المدعي')),
                  CustomRow(
                      dm: CustomRowDM(value: '054895964', label: 'رقم الجوال')),
                  CustomRow(dm: CustomRowDM(value: 'سعودي', label: 'الجنسية')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '1989/8/17', label: 'تاريخ الميلاد')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'sara@gmail.com', label: 'البريد الإلكتروني')),
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
                          value: '346780435678', label: 'رقم النسخة')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '5678453', label: 'رقم عقد الإيجار')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'مقدم عن نفسه', label: 'مقدم الدعوى')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'العنوان الوطني', label: 'العنوان الوطني')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '0137483967', label: 'رقم الهوية')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي')),
                  CustomRow(
                      dm: CustomRowDM(value: 'مستأجر', label: 'صفة المدعي')),
                  CustomRow(
                      dm: CustomRowDM(value: '054895964', label: 'رقم الجوال')),
                  CustomRow(dm: CustomRowDM(value: 'سعودي', label: 'الجنسية')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '1989/8/17', label: 'تاريخ الميلاد')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'sara@gmail.com', label: 'البريد الإلكتروني')),
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
                          value: '346780435678', label: 'رقم النسخة')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '5678453', label: 'رقم عقد الإيجار')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'مقدم عن نفسه', label: 'مقدم الدعوى')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'العنوان الوطني', label: 'العنوان الوطني')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '0137483967', label: 'رقم الهوية')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي')),
                  CustomRow(
                      dm: CustomRowDM(value: 'مستأجر', label: 'صفة المدعي')),
                  CustomRow(
                      dm: CustomRowDM(value: '054895964', label: 'رقم الجوال')),
                  CustomRow(dm: CustomRowDM(value: 'سعودي', label: 'الجنسية')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: '1989/8/17', label: 'تاريخ الميلاد')),
                  CustomRow(
                      dm: CustomRowDM(
                          value: 'sara@gmail.com', label: 'البريد الإلكتروني')),
                ]),
            SizedBox(
              height: 5.h,
            ),
            DefaultButton(
              onTap: () {},
              radius: 30,
              firstGradientColor: const Color(0xff002F56),
              secondGradientColor: const Color(0xff002F56),
              title: MyApp.tr.paymentOfFees,
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              width: 90.w,
            ),
          ],
        ),
      ),
    );
  }



  Card buildCard() {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: const Color(0xff0000000).withOpacity(0.4),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.icRisk,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'لم يتم تسديد الرسوم الإدارية للدعوى',
                      style: TextStyle(
                        color: Color(0xffBE4949),
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    Text(
                      'برجاء سداد الرسوم الإدارية للدعوى لإرسالها لمرحلة التدقيق',
                      style: TextStyle(
                          color: const Color(0xff222325),
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

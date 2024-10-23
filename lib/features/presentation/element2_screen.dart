import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/features/presentation/scalpel_model_screen.dart';
import 'package:reac/features/presentation/widgets/custom_card.dart';
import 'package:reac/features/presentation/widgets/custom_container.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_row.dart';

import '../../app/app_assets.dart';
import '../../my_app.dart';
import 'auth_screens/widgets.dart';
import 'mailing_list_screen.dart';

class Elements2Screen extends StatefulWidget {
  const Elements2Screen({super.key});

  @override
  State<Elements2Screen> createState() => _Elements2ScreenState();
}

class _Elements2ScreenState extends State<Elements2Screen> {
  bool firstSelect = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, MyApp.tr.caseDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
          child: Column(
            children: [
              firstSelect
                  ? CustomContainer(
                      text: MyApp.tr.participationRegistration,
                      color: const Color(0xffD8B934).withOpacity(0.20),
                      icon: AppAssets.icClock,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      textColor: Color(0xffd8b934),
                      vertical: 1.5.h,
                    )
                  : CustomContainer(
                      text: MyApp.tr.participationRegistration,
                      color: const Color(0xffD8B934).withOpacity(0.15),
                      icon: AppAssets.icClock,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      textColor: Color(0xffd8b934),
                      vertical: 2.h,
                    ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          firstSelect = true;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Text(
                        MyApp.tr.claimData,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: firstSelect
                              ? Color(0xff002F56)
                              : Color(0xff879094),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          firstSelect = false;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Text(
                       MyApp.tr.eventsOfTheCase,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: firstSelect
                              ? Color(0xff879094)
                              : Color(0xff002F56),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              firstSelect ? claimData() : eventsOfTheCase(),
            ],
          ),
        ),
      ),
    );
  }

  Column claimData() {
    return Column(
      children: [
        CustomCard(
            title: "نموذج المشارطة",
            description: "برجاء الرد على طلب المشارطة  المقدم من مدقق الدعوى.",
            buttonText: MyApp.tr.viewTheForm,
            onButtonTap: () {
              Navigator.pushNamed(context, ScalpelModelScreen.id);
            }),
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
            children: _buildRows([
              CustomRowDM(value: '346780435678', label: 'رقم النسخة'),
              CustomRowDM(value: '5678453', label: 'رقم عقد الإيجار'),
              CustomRowDM(value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق'),
              CustomRowDM(value: 'مقدم عن نفسه', label: 'مقدم الدعوى'),
              CustomRowDM(value: 'العنوان الوطني', label: 'العنوان الوطني'),
              CustomRowDM(value: '0137483967', label: 'رقم الهوية'),
              CustomRowDM(value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي'),
              CustomRowDM(value: 'مستأجر', label: 'صفة المدعي'),
              CustomRowDM(value: '054895964', label: 'رقم الجوال'),
              CustomRowDM(value: 'سعودي', label: 'الجنسية'),
              CustomRowDM(value: '1989/8/17', label: 'تاريخ الميلاد'),
              CustomRowDM(value: 'sara@gmail.com', label: 'البريد الإلكتروني'),
            ])),
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
            children: _buildRows([
              CustomRowDM(value: '346780435678', label: 'رقم النسخة'),
              CustomRowDM(value: '5678453', label: 'رقم عقد الإيجار'),
              CustomRowDM(value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق'),
              CustomRowDM(value: 'مقدم عن نفسه', label: 'مقدم الدعوى'),
              CustomRowDM(value: 'العنوان الوطني', label: 'العنوان الوطني'),
              CustomRowDM(value: '0137483967', label: 'رقم الهوية'),
              CustomRowDM(value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي'),
              CustomRowDM(value: 'مستأجر', label: 'صفة المدعي'),
              CustomRowDM(value: '054895964', label: 'رقم الجوال'),
              CustomRowDM(value: 'سعودي', label: 'الجنسية'),
              CustomRowDM(value: '1989/8/17', label: 'تاريخ الميلاد'),
              CustomRowDM(value: 'sara@gmail.com', label: 'البريد الإلكتروني'),
            ])),
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
            children: _buildRows([
              CustomRowDM(value: '346780435678', label: 'رقم النسخة'),
              CustomRowDM(value: '5678453', label: 'رقم عقد الإيجار'),
              CustomRowDM(value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق'),
              CustomRowDM(value: 'مقدم عن نفسه', label: 'مقدم الدعوى'),
              CustomRowDM(value: 'العنوان الوطني', label: 'العنوان الوطني'),
              CustomRowDM(value: '0137483967', label: 'رقم الهوية'),
              CustomRowDM(value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي'),
              CustomRowDM(value: 'مستأجر', label: 'صفة المدعي'),
              CustomRowDM(value: '054895964', label: 'رقم الجوال'),
              CustomRowDM(value: 'سعودي', label: 'الجنسية'),
              CustomRowDM(value: '1989/8/17', label: 'تاريخ الميلاد'),
              CustomRowDM(value: 'sara@gmail.com', label: 'البريد الإلكتروني'),
            ])),
      ],
    );
  }

  Column eventsOfTheCase() {
    return Column(children: [
      CustomCard(
          title: "نموذج المشارطة",
          description: "برجاء الرد على طلب المشارطة  المقدم من مدقق الدعوى.",
          buttonText: MyApp.tr.viewTheForm,
          onButtonTap: () {
            Navigator.pushNamed(context, ScalpelModelScreen.id);
          }),
      SizedBox(
        height: 3.h,
      ),
      CustomExpansionTile(
          isLoading: true,
          isPaddingTitle: true,
          initiallyExpanded: false,
          title: "مرحلة تقديم وقبول الدعوى",
          leading: Image(
            image: AssetImage(AppAssets.icClaimsInfo),
          ),
          expandedIcon: AppAssets.icArrowDown,
          collapsedIcon: AppAssets.icArrowUp,
          children: _buildRows([
            CustomRowDM(value: '346780435678', label: 'رقم النسخة'),
            CustomRowDM(value: '5678453', label: 'رقم عقد الإيجار'),
            CustomRowDM(value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق'),
            CustomRowDM(value: 'مقدم عن نفسه', label: 'مقدم الدعوى'),
            CustomRowDM(value: 'العنوان الوطني', label: 'العنوان الوطني'),
            CustomRowDM(value: '0137483967', label: 'رقم الهوية'),
            CustomRowDM(value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي'),
            CustomRowDM(value: 'مستأجر', label: 'صفة المدعي'),
            CustomRowDM(value: '054895964', label: 'رقم الجوال'),
            CustomRowDM(value: 'سعودي', label: 'الجنسية'),
            CustomRowDM(value: '1989/8/17', label: 'تاريخ الميلاد'),
            CustomRowDM(value: 'sara@gmail.com', label: 'البريد الإلكتروني'),
          ])),
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
          children: _buildRows([
            CustomRowDM(value: '346780435678', label: 'رقم النسخة'),
            CustomRowDM(value: '5678453', label: 'رقم عقد الإيجار'),
            CustomRowDM(value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق'),
            CustomRowDM(value: 'مقدم عن نفسه', label: 'مقدم الدعوى'),
            CustomRowDM(value: 'العنوان الوطني', label: 'العنوان الوطني'),
            CustomRowDM(value: '0137483967', label: 'رقم الهوية'),
            CustomRowDM(value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي'),
            CustomRowDM(value: 'مستأجر', label: 'صفة المدعي'),
            CustomRowDM(value: '054895964', label: 'رقم الجوال'),
            CustomRowDM(value: 'سعودي', label: 'الجنسية'),
            CustomRowDM(value: '1989/8/17', label: 'تاريخ الميلاد'),
            CustomRowDM(value: 'sara@gmail.com', label: 'البريد الإلكتروني'),
          ])),
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
        children: _buildRows([
          CustomRowDM(value: '346780435678', label: 'رقم النسخة'),
          CustomRowDM(value: '5678453', label: 'رقم عقد الإيجار'),
          CustomRowDM(value: 'pdf:اسم الملف يكون هنا.', label: 'مرفق'),
          CustomRowDM(value: 'مقدم عن نفسه', label: 'مقدم الدعوى'),
          CustomRowDM(value: 'العنوان الوطني', label: 'العنوان الوطني'),
          CustomRowDM(value: '0137483967', label: 'رقم الهوية'),
          CustomRowDM(value: 'سارة إبراهيم أحمد الجراحي', label: 'المدعي'),
          CustomRowDM(value: 'مستأجر', label: 'صفة المدعي'),
          CustomRowDM(value: '054895964', label: 'رقم الجوال'),
          CustomRowDM(value: 'سعودي', label: 'الجنسية'),
          CustomRowDM(value: '1989/8/17', label: 'تاريخ الميلاد'),
          CustomRowDM(value: 'sara@gmail.com', label: 'البريد الإلكتروني')
        ]),
      ),
      SizedBox(
        height: 3.h,
      ),
       Padding(
         padding:  EdgeInsets.symmetric(horizontal: 3.w),
         child: Row(
          children: [
            Image(image: AssetImage(AppAssets.icClaimsInfo)),
            SizedBox(width: 4.w,),
            Text(MyApp.tr.mailingList,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w700,color: const Color(0xff222325)),),
            const Spacer(),
            TextButton(child: Text(MyApp.tr.viewList,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: const Color(0xff002F56))),onPressed: (){
         Navigator.pushNamed(context, MailingListScreen.id);

            },)
          ],
               ),
       )
    ]);
  }
}

List<CustomRow> _buildRows(List<CustomRowDM> items) {
  return items.map((item) {
    return CustomRow(
      dm: item,
    );
  }).toList();
}



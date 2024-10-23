import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../app/app_assets.dart';
import '../../../app/app_colors.dart';
import '../../../design/widget/language_direction.dart';
import '../widgets/custom_text_form_field.dart';

GradientText requiredSymbolInputWidget() {
  return GradientText(
    "*",
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    colors: const [
      AppColors.darkBlue,
      AppColors.lightBlue,
      AppColors.thirdBlue
    ],
  );
}

AppBar buildAppBar(BuildContext context, String text) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: LanguageDirection(
          child: SvgPicture.asset(
            AppAssets.icBack,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    ),
    leadingWidth: 20.w,
    title: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15.sp,
          color: const Color(0xffFFFFFF),
        ),
      ),
    ),
    centerTitle: true,
    toolbarHeight: 7.h,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff03598D),
            Color(0xff002F56),
          ],
        ),
      ),
    ),
  );
}


Column emptyView() {
  return Column(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
          AppAssets.bgEmptyView),
      SizedBox(
        height: 2.h,
      ),
      Text(
        "لا توجد دعاوى حالية",
        style: TextStyle(
            fontFamily: 'Readex Pro',
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xffB7B7B7)),
      ),
    ],
  );}


Column loginTextEditing(String title, String hint, bool isPassword,
    TextEditingController controller, bool isVisible, String errorMessage,TextInputAction textInputAction,  {String? Function(String?)? validate,} ) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                color: AppColors.TextBlack),
          ),
          SizedBox(
            width: 0.5.h,
          ),
          requiredSymbolInputWidget()
        ],
      ),
      SizedBox(
        height: 0.1.h,
      ),
      CustomTextFormField(
        validator: validate,
        textInputAction: textInputAction,
        controller: controller,
        hinText: hint,
        borderRadiusEnable: 50,
        borderColorFocused: AppColors.selectedTextTab,
        borderColorEnable: Color(0xffE6E7EC),
        borderRadiusFocused: 50,
        maxLine: 1,
        fontWeight: FontWeight.w400,
        fontSize: 10.sp,
        hinTextColor: AppColors.lightGray,
        textInputType: TextInputType.text,
        obsureText: isPassword,  // Ensure this is false for multiline text fields
        suffixIcon: InkWell(
          onTap: () {
            controller.clear();
          },
          child: SvgPicture.asset(
            AppAssets.icCloseCircle,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),

      Visibility(
        visible: isVisible,
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 12)),
          ),
        ),
      ),

    ],
  );
}

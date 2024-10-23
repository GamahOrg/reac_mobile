import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/constants.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/lawsuit_card.dart';
import 'package:reac/features/presentation/agreement_list_screen.dart';
import 'package:reac/features/presentation/auth_screens/login/login_screen.dart';
import 'package:reac/features/presentation/claim_details/claim_details.dart';
import 'package:reac/features/presentation/home/home_cubit.dart';
import 'package:reac/features/presentation/home/model/filter_model.dart';
import 'package:reac/features/presentation/interpretation_list.dart';
import 'package:reac/features/presentation/manager/notification_cubit.dart';
import 'package:reac/features/presentation/number_arbitrators_list.dart';
import 'package:reac/features/presentation/reconcilition_list.dart';
import 'package:reac/features/presentation/setting_screen.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_text_form_field.dart';
import 'package:reac/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app_colors.dart';
import '../../../app/custom_bottom_sheet.dart';
import '../../../app/default_button.dart';
import '../../../app_cubit.dart';
import '../appointment_members_arbitration_panel_list.dart';
import '../arbitration_awards_list.dart';
import '../auth_screens/widgets.dart';
import '../claim_details/widgets/resuable_cube.dart';
import '../manager/get_claim_states.dart';

class ClaimsScreen extends StatefulWidget {
  const ClaimsScreen({super.key});

  static const String id = "ClaimsScreen";

  @override
  State<ClaimsScreen> createState() => _ClaimsScreenState();
}

TextEditingController searchController = TextEditingController();

class _ClaimsScreenState extends State<ClaimsScreen> {
  final cubit = getIt<HomeCubit>();

  void loadMore() async {
    if (cubit.hasNextPage) {
      cubit.pageIndex++;
      await cubit.execute(
        searchKey: searchController.text,
      );
    } else {
      dPrint("Conditions not met for loading more data");
    }
  }

  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 10) {
        {
          dPrint("Triggered loadMore()");
          loadMore();
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => cubit),
          BlocProvider(
              create: (context) => getIt<NotificationCubit>()..execute())
        ],
        child: BlocConsumer<HomeCubit, ClaimStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final claimResults = cubit.claimResponse?.results ?? [];
              var notificationCubit = NotificationCubit.get(context);
              if (state is IdleState) {
                cubit.execute();
              }
                  return Scaffold(
                    drawer: Drawer(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: const Color(0xffF4F5F9),
                      child: Column(
                        children: [
                          Container(
                            height: 10.h,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff03598D),
                                    Color(0xFF002F56),
                                  ],
                                  begin: FractionalOffset(1.0, 0.0),
                                  end: FractionalOffset(1.0, 1.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 6.w, right: 6.w, top: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, SettingScreen.id);
                                      },
                                      child: SvgPicture.asset(
                                          AppAssets.icSetting)),
                                  Row(
                                    children: [
                                      Text(
                                        'احمد الدوسري',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: '29LT Bukra',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      CircleAvatar(
                                        radius: 21,
                                        backgroundImage:
                                            AssetImage(AppAssets.bgOwner),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  _buildMenuItem(MyApp.tr.home, () {
                                    Navigator.pushNamed(
                                        context, ClaimsScreen.id);
                                  }),
                                  _buildMenuItem(MyApp.tr.requestsForAContract,
                                      () {
                                    Navigator.pushNamed(
                                        context, AgreementListScreen.id);
                                  }),
                                  // _buildMenuItem(
                                  //     MyApp.tr.listOfReconciliationSessions, () {}),
                                  _buildMenuItem(
                                      MyApp.tr.minutesOfTheSettlement, () {
                                    Navigator.pushNamed(
                                        context, ReconciliationList.id);
                                  }),
                                  // _buildMenuItem(
                                  //     MyApp.tr.listOfArbitrationSessions, () {}),
                                  _buildMenuItem(
                                      MyApp.tr.determineTheNumberOfArbitrators,
                                      () {
                                    Navigator.pushNamed(
                                        context, NumberArbitratorsList.id);
                                  }),
                                  _buildMenuItem(
                                      MyApp.tr
                                          .appointmentOfMembersOfTheArbitrationPanel,
                                      () {
                                    Navigator.pushNamed(
                                        context,
                                        AppointmentMembersArbitrationPanelList
                                            .id);
                                  }),
                                  _buildMenuItem(MyApp.tr.arbitrationAwards,
                                      () {
                                    Navigator.pushNamed(
                                        context, ArbitrationAwardsList.id);
                                  }),
                                  _buildMenuItem(
                                      MyApp.tr
                                          .requestsForInterpretationOfRulings,
                                      () {
                                    Navigator.pushNamed(
                                        context, InterpretationListScreen.id);
                                  }),
                                  // _buildMenuItem(
                                  //     MyApp.tr.requestForArbitratorResponse, () {}),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 8.h),
                            child: Column(
                              children: [
                                const Divider(
                                  color: Color(0xffE6E7EC),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                DefaultButton(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11.sp,
                                  textColor: const Color(0xff61686B),
                                  radius: 30,
                                  onTap: () {
                                    Navigator.pop(context);
                                    CustomBottomSheet.show(
                                      isClose: false,
                                      context,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.w, vertical: 2.h),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 4.h),
                                            SvgPicture.asset(AppAssets.icExit),
                                            SizedBox(height: 4.h),
                                            Text(
                                              MyApp.tr.doYouWantToLogOut,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.TextBlack,
                                              ),
                                            ),
                                            SizedBox(height: 6.h),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: DefaultButton(
                                                    radius: 30,
                                                    height: 6.h,
                                                    firstGradientColor:
                                                        AppColors.white,
                                                    secondGradientColor:
                                                        AppColors.white,
                                                    title: MyApp.tr.no,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w700,
                                                    textColor: AppColors
                                                        .selectedTextTab,
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                  ),
                                                ),
                                                SizedBox(width: 2.w),
                                                Expanded(
                                                  flex: 2,
                                                  child: DefaultButton(
                                                    radius: 30,
                                                    height: 6.h,
                                                    firstGradientColor:
                                                        AppColors
                                                            .selectedTextTab,
                                                    secondGradientColor:
                                                        AppColors
                                                            .selectedTextTab,
                                                    title: MyApp.tr.yes,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w700,
                                                    textColor: Colors.white,
                                                    onTap: () async{
                                                      final prefs = await SharedPreferences.getInstance();
                                                      await prefs.remove(Constants.appPreferencesToken);
                                                      Navigator.pushNamed(context, LoginScreen.id);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 1.h),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  title: MyApp.tr.logOut,
                                  firstGradientColor: Colors.transparent,
                                  secondGradientColor: Colors.transparent,
                                  borderColor: const Color(0xff222325),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customAppBar(context, notificationCubit),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, right: 5.w, top: 2.5.h, bottom: 1.h),
                          child: Text(
                            MyApp.tr.home,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: const Color(0xff222325),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            children: [
                              searchField(context),
                              SizedBox(
                                width: 2.w,
                              ),
                              filterContent(context)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 1.h),
                            child: state is LoadingState || state is IdleState
                                ? const Center(child: RotatingLoader())
                                : claimResults.isNotEmpty
                                    ? ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        controller: _scrollController,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return LawsuitCard(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, ClaimDetails.id,
                                                    arguments:
                                                        ClaimDetailsArgements(
                                                      typeStep:
                                                          StepsClaims.home,
                                                      litigationId:
                                                          claimResults[index]
                                                                  .id ??
                                                              "",
                                                      status: claimResults[
                                                                  index]
                                                              .externalStatusId ??
                                                          0,
                                                      isDetailsFromHome: true,
                                                    ));
                                              },
                                              isDetailsFromHome: true,
                                              results: claimResults[index]);
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 16,
                                          );
                                        },
                                        itemCount: claimResults.length,
                                      )
                                    : Center(
                                        child: emptyView(),
                                      ),
                          ),
                        ),
                        if (state is LoadingMoreState)
                          const Center(
                              child: CircularProgressIndicator(
                            color: AppColors.selectedTextTab,
                          ))
                      ],
                    ),
                  );
                },
              )
    );
  }

  Expanded filterContent(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          CustomBottomSheet.show(
            context,
            child: StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        child: Text(
                          MyApp.tr.filter,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.TextBlack,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                claimType(),
                                SizedBox(height: 1.h),
                                claimState(),
                                // Remove or adjust unnecessary spacing
                                // SizedBox(height: 10.h), // This line was causing extra space
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Fixed action buttons at the bottom
                      Padding(
                        padding: EdgeInsets.all(6.w),
                        child: actionFilter(cubit),
                      ),
                    ],
                  ),
                );
              },
            ),
            backgroundColor: AppColors.selectedTabBackground,
            isClose: false,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffE6E7EC)),
          ),
          child: SvgPicture.asset(
            AppAssets.icFilter,
            height: 5.8.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }


  Widget actionFilter(HomeCubit cubit) {
    return Builder(builder: (context) {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: DefaultButton(
              radius: 30,
              firstGradientColor: Colors.white,
              secondGradientColor: Colors.white,
              title: MyApp.tr.cancellation,
              fontSize: 11.sp,
              height: 6.h,
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
              height: 6.h,
              firstGradientColor: AppColors.selectedTextTab,
              secondGradientColor: AppColors.selectedTextTab,
              title: MyApp.tr.filterApply,
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onTap: () {
                Navigator.pop(context, cubit.execute());
              },
            ),
          )
        ],
      );
    });
  }

  CustomExpansionTile claimState() {
    return CustomExpansionTile(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: AppColors.black,
      isPaddingTitle: false,
      isLoading: false,
      isShadow: false,
      initiallyExpanded: true,
      title: MyApp.tr.claimStates,
      expandedIcon: AppAssets.icArrowDown,
      collapsedIcon: AppAssets.icArrowUp,
      children: [
        const Divider(
          height: 1,
          color: Color.fromARGB(100, 228, 233, 242),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.litigationStates.length,
          itemBuilder: (context, index) {
            return customFilter(index, cubit.litigationStates);
          },
        ),
      ],
    );
  }

  CustomExpansionTile claimType() {
    return CustomExpansionTile(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: AppColors.black,
      isPaddingTitle: false,
      isLoading: false,
      isShadow: false,
      initiallyExpanded: true,
      title: MyApp.tr.claimType,
      expandedIcon: AppAssets.icArrowDown,
      collapsedIcon: AppAssets.icArrowUp,
      children: [
        const Divider(
          height: 1,
          color: Color.fromARGB(100, 228, 233, 242),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.litigationTypes.length,
          itemBuilder: (context, index) {
            return customFilter(index, cubit.litigationTypes);
          },
        ),
      ],
    );
  }

  Expanded searchField(context) {
    return Expanded(
      flex: 6,
      child: CustomTextFormField(
        maxLine: null,
        controller: searchController,
        onFieldSubmitted: (value) {
          cubit.pageIndex = 1;
          cubit.execute(searchKey: searchController.text);
        },
        hinText: MyApp.tr.search_,
        textInputAction: TextInputAction.search,
        textInputType: TextInputType.text,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        suffixIcon: InkWell(
          child: SvgPicture.asset(
            AppAssets.icCloseCircle,
            fit: BoxFit.scaleDown,
          ),
          onTap: () {
            setState(() {
              searchController.clear();
            });
          },
        ),
        hinTextColor: AppColors.unSelectedTextTab,
        borderRadiusEnable: 10,
        borderColorEnable: const Color(0xffE6E7EC),
        borderColorFocused: AppColors.selectedTextTab,
        borderRadiusFocused: 10,
        prefixIcon: Image(image: AssetImage(AppAssets.icSearchNormal)),
      ),
    );
  }

  Widget customAppBar(
      BuildContext context, NotificationCubit notificationCubit) {
    return Builder(builder: (context) {
      return AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 12.5.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff03598D),
                Color(0xFF002F56),
              ],
              begin: FractionalOffset(1.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Image(
          image: AssetImage(AppAssets.bgLogoReac),
        ),
        centerTitle: true,
        leadingWidth: 25.w,
        leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              AppAssets.icMenu,
              fit: BoxFit.scaleDown,
              //  fit: BoxFit.scaleDown,
            ))
      );
    });
  }

  Widget customFilter(int index, List<FilterModel> filterList) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return InkWell(
          onTap: () {
            setState(() {
              filterList[index].selected =
                  !(filterList[index].selected ?? false);
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      filterList[index].selected =
                          !(filterList[index].selected ?? false);
                    });
                  },
                  child: custemCheckBox(filterList, index),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(
                    child: Text(
                  filterList[index].name ?? "",
                  style: TextStyle(
                      color: AppColors.unSelectedTextTab,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  Container custemCheckBox(List<FilterModel> filterList, int index) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: filterList[index].selected ?? false
            ? AppColors.selectedTextTab
            : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.selectedTextTab, // Border color when unchecked
          width: 2.0,
        ),
      ),
      child: filterList[index].selected ?? false
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 16.0,
            )
          : null,
    );
  }

  Widget _buildMenuItem(String title, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 4.w),
        child: Text(
          title,
          style: TextStyle(
              color: const Color(0xff222325),
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              fontFamily: '29LT Bukra'),
          textDirection: TextDirection.rtl, // Ensure RTL layout
        ),
      ),
    );
  }
}


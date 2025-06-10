import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/lawsuit_card.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/presentation/manager/get_interpretation_rule_cubit.dart';
import 'package:reac/my_app.dart';
import '../../../app/app_colors.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/widgets/resuable_cube.dart';
import 'interpretation_of_ the _arbitration _award.dart';
import 'manager/get_claim_states.dart';
import 'manager/get_number_of_arbitration_panel_cubit.dart';
class ArbitrationAwardsList extends StatefulWidget {
  const ArbitrationAwardsList({super.key});

  static const String id = "ArbitrationAwardsList";

  @override
  State<ArbitrationAwardsList> createState() => _ArbitrationAwardsListState();
}


class _ArbitrationAwardsListState extends State<ArbitrationAwardsList> {
  final cubit = getIt<InterpretationRulingCubit>();

  void loadMore() async {
    if (cubit.hasNextPage) {
      cubit.pageIndex++;
      final currentPosition = _scrollController.position.pixels;

      await cubit.execute();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(currentPosition);
        }
      });
    }
  }

  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 10) {
        loadMore();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit,
        child: BlocConsumer<InterpretationRulingCubit, ClaimStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is IdleState) {
              cubit.execute();
            }
            final interpretationList = cubit.interpretationList?.results ?? [];
            return Scaffold(
              appBar: buildAppBar(context,MyApp.tr.arbitrationAwards),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: state is LoadingState || state is IdleState
                          ?  const Center(
                          child:RotatingLoader())
                          :interpretationList.isNotEmpty? ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return LawsuitCard(
                                onTap: (){
                                  Navigator.pushNamed(
                                          context,
                                          InterpretationOfTheArbitrationAward.id,
                                          arguments: InterpretationOfTheArbitrationAwardArguments(
                                              litigationRequestId:interpretationList[index].id,
                                              status:  int.parse(interpretationList[index].status??""),
                                              typeStep:StepsClaims.arbitrationAwards.text));
                                },
                                isDetailsFromHome: false,
                                results:cubit.interpretationList?.results?[index]
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 16,
                              );
                            },
                            itemCount: interpretationList.length,
                          ):Center(child: emptyView()),
                    ),
                  ),
                  if (state is LoadingMoreState)
                    const Center(
                        child:RotatingLoader())
                ],
              ),
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/lawsuit_card.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/my_app.dart';
import '../../../app/app_colors.dart';
import '../../app/app_enums.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/claim_details.dart';
import 'claim_details/widgets/resuable_cube.dart';
import 'manager/get_claim_states.dart';
import 'manager/get_number_of_arbitration_panel_cubit.dart';
import 'manager/selection_arbitrator_cubit.dart';
class AppointmentMembersArbitrationPanelList extends StatefulWidget {
  const AppointmentMembersArbitrationPanelList({super.key});

  static const String id = "AppointmentMembersArbitrationPanelList";

  @override
  State<AppointmentMembersArbitrationPanelList> createState() => _AppointmentMembersArbitrationPanelListState();
}


class _AppointmentMembersArbitrationPanelListState extends State<AppointmentMembersArbitrationPanelList> {
  final cubit = getIt<AppointmentMembersArbitrationPanelCubit>();

  void loadMore() async {
    if (cubit.hasNextPage) {
      cubit.pageIndex++;
      await cubit.execute(
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
        child: BlocConsumer<AppointmentMembersArbitrationPanelCubit, ClaimStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is IdleState) {
              cubit.execute();
            }
            final appointmentMembersArbitrationPanelCubit = cubit.arbitratorsNominationList?.results ?? [];
            return Scaffold(
              appBar: buildAppBar(context,MyApp.tr.appointmentOfMembersOfTheArbitrationPanel),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: state is LoadingState || state is IdleState
                          ?  const Center(
                          child: RotatingLoader())
                          :appointmentMembersArbitrationPanelCubit.isNotEmpty? ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return LawsuitCard(
                                onTap: (){
                                  Navigator.pushNamed(context, ClaimDetails.id,
                                      arguments: ClaimDetailsArgements(
                                        typeStep: StepsClaims.appointmentOfMembersOfTheArbitrationPanel,
                                        litigationId: appointmentMembersArbitrationPanelCubit[index].id?? "",
                                        status: int.parse(appointmentMembersArbitrationPanelCubit[index].status??""),
                                        isDetailsFromHome: false,
                                      ));
                                },
                                isDetailsFromHome: false,
                                  results:Results(
                                    status: appointmentMembersArbitrationPanelCubit[index].status,
                                    requestCode: appointmentMembersArbitrationPanelCubit[index].requestCode,
                                    createdOn: appointmentMembersArbitrationPanelCubit[index].requestDate,
                                    secondPartyName: appointmentMembersArbitrationPanelCubit[index].secondPartyName,
                                    id: appointmentMembersArbitrationPanelCubit[index].id,
                                    litigationRequestContractType: appointmentMembersArbitrationPanelCubit[index].requestTypeName,
                                  ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 16,
                              );
                            },
                            itemCount: appointmentMembersArbitrationPanelCubit.length,
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

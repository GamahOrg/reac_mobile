import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/lawsuit_card.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/presentation/manager/agreement_cubit.dart';
import 'package:reac/features/presentation/scalpel_model_screen.dart';
import 'package:reac/my_app.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/widgets/resuable_cube.dart';
import 'manager/get_claim_states.dart';
class AgreementListScreen extends StatefulWidget {
  const AgreementListScreen({super.key});

  static const String id = "AgreementListScreen";

  @override
  State<AgreementListScreen> createState() => _AgreementListScreenState();
}


class _AgreementListScreenState extends State<AgreementListScreen> {
  final agreementCubit = getIt<AgreementCubit>();

  void loadMore() async {
    if (agreementCubit.hasNextPage) {
      agreementCubit.pageIndex++;
      await agreementCubit.execute(
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
        create: (context) => agreementCubit,
        child: BlocConsumer<AgreementCubit, ClaimStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is IdleState) {
              agreementCubit.execute();
            }
            final agreementList = agreementCubit.agreementList?.results ?? [];
            return Scaffold(
              appBar: buildAppBar(context,MyApp.tr.requestsForAContract),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: state is LoadingState || state is IdleState
                          ? const Center(
                          child: RotatingLoader())
                          : agreementList.isNotEmpty? ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return LawsuitCard(
                                onTap: (){
                                  Navigator.pushNamed(context, ScalpelModelScreen.id,
                                            arguments: ScalpelModelScreenArguments(
                                              requestId: agreementList[index].id,
                                              status: int.parse(agreementList[index].status.toString()),
                                            ));
                                },
                                isDetailsFromHome: false,
                                results:Results(
                                  status: agreementList[index].status,
                                  requestCode: agreementList[index].requestCode,
                                  createdOn: agreementList[index].requestDate,
                                  secondPartyName: agreementList[index].secondPartyName,
                                  id: agreementList[index].id,
                                  litigationRequestContractType:agreementList[index].requestTypeName,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 16,
                              );
                            },
                            itemCount: agreementList.length,
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

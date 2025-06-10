import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/lawsuit_card.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/presentation/auth_screens/widgets.dart';
import 'package:reac/features/presentation/claim_details/widgets/resuable_cube.dart';
import 'package:reac/features/presentation/manager/GetLitigationRequestForAllSessionCubit.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';
import 'package:reac/my_app.dart';
import 'package:url_launcher/url_launcher.dart';

class GetLitigationRequestForAllSessionScreen extends StatefulWidget {
  const GetLitigationRequestForAllSessionScreen({super.key});

  static const String id = "GetLitigationRequestForAllSessionScreen";

  @override
  State<GetLitigationRequestForAllSessionScreen> createState() => _GetLitigationRequestForAllSessionScreenState();
}


class _GetLitigationRequestForAllSessionScreenState extends State<GetLitigationRequestForAllSessionScreen> {
  final getLitigationsCubit = getIt<GetLitigationRequestForAllSessionCubit>();

  void loadMore() async {
    if (getLitigationsCubit.hasNextPage) {
      getLitigationsCubit.pageIndex++;
      final currentPosition = _scrollController.position.pixels;

      await getLitigationsCubit.execute();

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
        create: (context) => getLitigationsCubit,
        child: BlocConsumer<GetLitigationRequestForAllSessionCubit, ClaimStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is IdleState) {
              getLitigationsCubit.execute();
            }
            final reconciliationSessionsModel = getLitigationsCubit.reconciliationSessionsModel?.results ?? [];

            return Scaffold(
              appBar: buildAppBar(context,MyApp.tr.listOfReconciliationSessions),
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
                          : reconciliationSessionsModel.isNotEmpty? ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return LawsuitCard(
                            onTap: () async {
                              Future<void> _launchURL() async {
                                final Uri url = Uri.parse(reconciliationSessionsModel[index].url.orEmpty());
                                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                                  throw Exception('Could not launch $url');
                                }
                              }

                              await _launchURL();
                              // Navigator.pushNamed(context, ScalpelModelScreen.id,
                              //     arguments: ScalpelModelScreenArguments(
                              //       requestId: reconciliationSessionsModel[index].id,
                              //       status: int.parse(reconciliationSessionsModel[index].status.toString()),
                              //     ));
                            },
                            isDetailsFromHome: false,
                            results:Results(
                              status: "0",
                              requestCode: reconciliationSessionsModel[index].requestCode,
                              createdOn: reconciliationSessionsModel[index].requestDate,
                              secondPartyName: reconciliationSessionsModel[index].secondPartyName,
                              id: reconciliationSessionsModel[index].id,
                              litigationRequestContractType:reconciliationSessionsModel[index].requestTypeName,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: reconciliationSessionsModel.length,
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

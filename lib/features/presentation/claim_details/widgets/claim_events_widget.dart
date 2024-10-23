import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/app/helpers/date_time_helper.dart';
import 'package:reac/features/domain/models/claim_model/claim_event_model.dart';
import 'package:reac/features/presentation/manager/claim_details_cubit.dart';

import '../../../../app/app_assets.dart';
import '../../../../my_app.dart';
import '../../widgets/custom_extention_tile.dart';
import '../../widgets/custom_row.dart';
import '../../widgets/custom_row_column.dart';

class ClaimEventsWidget extends StatelessWidget {
   ClaimEventsWidget({super.key,this.claimEventModels});
List<ClaimEventModel>? claimEventModels=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        CustomExpansionTile(
          isLoading: true,
          isPaddingTitle: true,
          expandedIcon: AppAssets.icArrowDown,
          collapsedIcon: AppAssets.icArrowUp,
          title: MyApp.tr.detailsOfTheInvitationEvents,
          leading: Image(
            image: AssetImage(AppAssets.icClaimsInfo),
          ),
          children: [
             CustomRowColumn(
               isIcon: false,
               values: claimEventModels?.map((e) => "${e.logMessage} ${MyApp.tr.date} ${DateTimeHelper.formatStringToNewFormat(e.createdOn)}")
                     .toList()
            )
          ],
        ),

      ],
    );
  }
}
int? selectedIndex;
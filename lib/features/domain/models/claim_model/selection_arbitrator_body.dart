import 'package:freezed_annotation/freezed_annotation.dart';
part 'selection_arbitrator_body.g.dart';
part 'selection_arbitrator_body.freezed.dart';

@freezed
class SelectionArbitratorRequest with _$SelectionArbitratorRequest {

  factory SelectionArbitratorRequest(
      {
        String? requestId,
        List<ArbitratorNominationListRequestItems>? arbitratorNominationListRequestItems,
      }
      ) = _SelectionArbitratorRequest;

  factory SelectionArbitratorRequest.fromJson(Map<String, dynamic> json) => _$SelectionArbitratorRequestFromJson(json);
}


@freezed
class ArbitratorNominationListRequestItems with _$ArbitratorNominationListRequestItems {

  factory ArbitratorNominationListRequestItems(
      {
        String? arbitratorListId,
        int? priority,
      }
      ) = _ArbitratorNominationListRequestItems;

  factory ArbitratorNominationListRequestItems.fromJson(Map<String, dynamic> json) => _$ArbitratorNominationListRequestItemsFromJson(json);
}

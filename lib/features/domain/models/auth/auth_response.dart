class TransactionResponse {
  bool? isDraftAccount;
  TransactionDM? data;
  String? error;

  TransactionResponse({this.isDraftAccount, this.data, this.error});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    isDraftAccount = json['isDraftAccount'];
    data =
    json['data'] != null ? TransactionDM.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isDraftAccount'] = isDraftAccount;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['error'] = error;
    return data;
  }
}

class TransactionDM {
  String? transId;
  String? random;

  TransactionDM({required this.transId, required this.random});

  TransactionDM.fromJson(Map<String, dynamic> json) {
    transId = json['transId'];
    random = json['random'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transId'] = transId;
    data['random'] = random;
    return data;
  }
}
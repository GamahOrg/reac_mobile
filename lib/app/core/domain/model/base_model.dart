class BaseDM<T> {
  String? message;
  T? data;
  bool? isDone;
  BaseDM(
      { this.message, required this.data, this.isDone = true});

  BaseDM.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['isDone'] = this.isDone;
    return data;
  }
}


class OrderModel {
  bool? status;
  String? message;
  int? pages;
  int? rows;
  List<dynamic>? data;

  OrderModel({this.status, this.message, this.pages, this.rows, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["pages"] is int) {
      pages = json["pages"];
    }
    if(json["rows"] is int) {
      rows = json["rows"];
    }
    if(json["data"] is List) {
      data = json["data"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["pages"] = pages;
    _data["rows"] = rows;
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}
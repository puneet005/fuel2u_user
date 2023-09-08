
class StateListModelData {

  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  StateListModelData({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  StateListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    code = json['code']?.toString();
    name = json['name']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class StateListModel {
/*
{
  "status": true,
  "message": "States found successfully.",
  "data": [
    {
      "id": 1,
      "code": "DC",
      "name": "District of Columbia",
      "created_at": "",
      "updated_at": "",
      "deleted_at": ""
    }
  ]
} 
*/

  bool? status;
  String? message;
  List<StateListModelData>? data;

  StateListModel({
    this.status,
    this.message,
    this.data,
  });
  StateListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <StateListModelData>[];
  v.forEach((v) {
  arr0.add(StateListModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v.toJson());
  });
      data['data'] = arr0;
    }
    return data;
  }
}

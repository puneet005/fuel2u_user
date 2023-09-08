
class CarModelData {


  int? id;
  int? makeId;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CarModelData({
    this.id,
    this.makeId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  CarModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    makeId = json['make_id']?.toInt();
    name = json['name']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['make_id'] = makeId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class CarModel {
/*
{
  "status": true,
  "message": "Models found successfully.",
  "data": [
    {
      "id": 1,
      "make_id": 1,
      "name": "Outlander SE SUV",
      "created_at": "2023-08-21 06:31:46",
      "updated_at": "2023-08-21 06:31:46",
      "deleted_at": ""
    }
  ]
} 
*/

  bool? status;
  String? message;
  List<CarModelData>? data;

  CarModel({
    this.status,
    this.message,
    this.data,
  });
  CarModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <CarModelData>[];
  v.forEach((v) {
  arr0.add(CarModelData.fromJson(v));
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

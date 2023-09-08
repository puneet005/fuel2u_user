class AddLocationModelData {
  int? id;
  String? name;
  String? address;
  String? city;
  String? stateId;
  String? zipcode;
  String? latitude;
  String? longitude;
  int? userId;
  String? updatedAt;
  String? createdAt;

  AddLocationModelData({
    this.id,
    this.name,
    this.address,
    this.city,
    this.stateId,
    this.zipcode,
    this.latitude,
    this.longitude,
    this.userId,
    this.updatedAt,
    this.createdAt,
  });
  AddLocationModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    address = json['address']?.toString();
    city = json['city']?.toString();
    stateId = json['state_id']?.toString();
    zipcode = json['zipcode']?.toString();
    latitude = json['latitude']?.toString();
    longitude = json['longitude']?.toString();
    userId = json['user_id']?.toInt();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['state_id'] = stateId;
    data['zipcode'] = zipcode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}

class AddLocationModel {


  bool? status;
  String? message;
  AddLocationModelData? data;

  AddLocationModel({
    this.status,
    this.message,
    this.data,
  });
  AddLocationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? AddLocationModelData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

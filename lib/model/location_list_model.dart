class LocationListModelDataState {


  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LocationListModelDataState({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  LocationListModelDataState.fromJson(Map<String, dynamic> json) {
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

class LocationListModelData {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? city;
  int? stateId;
  String? zipcode;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  LocationListModelDataState? state;

  LocationListModelData({
    this.id,
    this.userId,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.city,
    this.stateId,
    this.zipcode,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.state,
  });
  LocationListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    name = json['name']?.toString();
    address = json['address']?.toString();
    latitude = json['latitude']?.toString();
    longitude = json['longitude']?.toString();
    city = json['city']?.toString();
    stateId = json['state_id']?.toInt();
    zipcode = json['zipcode']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    state = (json['state'] != null) ? LocationListModelDataState.fromJson(json['state']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['city'] = city;
    data['state_id'] = stateId;
    data['zipcode'] = zipcode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}

class LocationListModel {
  bool? status;
  String? message;
  int? pages;
  int? rows;
  List<LocationListModelData>? data;

  LocationListModel({
    this.status,
    this.message,
    this.pages,
    this.rows,
    this.data,
  });
  LocationListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    pages = json['pages']?.toInt();
    rows = json['rows']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <LocationListModelData>[];
  v.forEach((v) {
  arr0.add(LocationListModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['pages'] = pages;
    data['rows'] = rows;
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
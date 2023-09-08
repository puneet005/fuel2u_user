
import 'package:fuel2u_user/model/vehicle/car_model.dart';
import 'package:fuel2u_user/model/vehicle/make_model.dart';

class VehicleListModelDataState {


  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  VehicleListModelDataState({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  VehicleListModelDataState.fromJson(Map<String, dynamic> json) {
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

class VehicleListModelDataColor {


  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  VehicleListModelDataColor({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  VehicleListModelDataColor.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class VehicleListModelDataModel {


  int? id;
  int? makeId;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  VehicleListModelDataModel({
    this.id,
    this.makeId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  VehicleListModelDataModel.fromJson(Map<String, dynamic> json) {
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

class VehicleListModelDataMake {


  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  VehicleListModelDataMake({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  VehicleListModelDataMake.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class VehicleListModelDataUser {

  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? phoneNumberVerifiedAt;
  int? businessId;
  String? promocode;
  String? subscriptionId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  VehicleListModelDataUser({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.phoneNumberVerifiedAt,
    this.businessId,
    this.promocode,
    this.subscriptionId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  VehicleListModelDataUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    image = json['image']?.toString();
    email = json['email']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    phoneNumber = json['phone_number']?.toString();
    phoneNumberVerifiedAt = json['phone_number_verified_at']?.toString();
    businessId = json['business_id']?.toInt();
    promocode = json['promocode']?.toString();
    subscriptionId = json['subscription_id']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_number'] = phoneNumber;
    data['phone_number_verified_at'] = phoneNumberVerifiedAt;
    data['business_id'] = businessId;
    data['promocode'] = promocode;
    data['subscription_id'] = subscriptionId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class VehicleListModelData {


  int? id;
  int? userId;
  String? name;
  int? makeId;
  int? modelId;
  int? colorId;
  String? licensePlate;
  int? stateId;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  VehicleListModelDataUser? user;
  // VehicleListModelDataMake? make;
  MakeModelData? make;
  CarModelData? model;
  // VehicleListModelDataModel? model;
  VehicleListModelDataColor? color;
  VehicleListModelDataState? state;
  bool seeMore = false;

  VehicleListModelData({
    this.id,
    this.userId,
    this.name,
    this.makeId,
    this.modelId,
    this.colorId,
    this.licensePlate,
    this.stateId,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.make,
    this.model,
    this.color,
    this.state,
    this.seeMore= false,
    
  }); 
  VehicleListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    name = json['name']?.toString();
    makeId = json['make_id']?.toInt();
    modelId = json['model_id']?.toInt();
    colorId = json['color_id']?.toInt();
    licensePlate = json['license_plate']?.toString();
    stateId = json['state_id']?.toInt();
    image = json['image']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    user = (json['user'] != null) ? VehicleListModelDataUser.fromJson(json['user']) : null;
    make = (json['make'] != null) ? MakeModelData?.fromJson(json['make']) : null;
    model = (json['model'] != null)? CarModelData?.fromJson(json['model']) : null;
    // model = (json['model'] != null) ? VehicleListModelDataModel.fromJson(json['model']) : null;
    color = (json['color'] != null) ? VehicleListModelDataColor.fromJson(json['color']) : null;
    state = (json['state'] != null) ? VehicleListModelDataState.fromJson(json['state']) : null;
    seeMore = json['see_more'] ?? false;
  } 
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['make_id'] = makeId;
    data['model_id'] = modelId;
    data['color_id'] = colorId;
    data['license_plate'] = licensePlate;
    data['state_id'] = stateId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['see_more'] = seeMore;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (make != null) {
      data['make'] = make!.toJson();
    }
    if (model != null) {
      data['model'] = model!.toJson();
    }
    if (color != null) {
      data['color'] = color!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}

class VehicleListModel {
/*
{
  "status": true,
  "message": "Vehicles found successfully.",
  "pages": 1,
  "rows": 1,
  "data": [
    {
      "id": 5,
      "user_id": 19,
      "name": "My Car",
      "make_id": 1,
      "model_id": 1,
      "color_id": 1,
      "license_plate": "78145ddd",
      "state_id": 1,
      "image": "",
      "created_at": "2023-09-06 05:56:28",
      "updated_at": "2023-09-06 05:56:28",
      "deleted_at": "",
      "user": {
        "id": 19,
        "first_name": "test",
        "last_name": "jon",
        "image": "",
        "email": "",
        "email_verified_at": "",
        "phone_number": "+14104394860",
        "phone_number_verified_at": "2023-09-05 05:01:24",
        "business_id": 8,
        "promocode": "",
        "subscription_id": "",
        "status": "Active",
        "created_at": "2023-09-05T05:01:24.000000Z",
        "updated_at": "2023-09-05T08:50:05.000000Z",
        "deleted_at": ""
      },
      "make": {
        "id": 1,
        "name": "MITSUBISHI",
        "created_at": "2023-08-21 06:31:28",
        "updated_at": "2023-08-21 06:31:28",
        "deleted_at": ""
      },
      "model": {
        "id": 1,
        "make_id": 1,
        "name": "Outlander SE SUV",
        "created_at": "2023-08-21 06:31:46",
        "updated_at": "2023-08-21 06:31:46",
        "deleted_at": ""
      },
      "color": {
        "id": 1,
        "name": "White",
        "created_at": "2023-08-21 06:33:18",
        "updated_at": "2023-08-22 04:11:13",
        "deleted_at": ""
      },
      "state": {
        "id": 1,
        "code": "DC",
        "name": "District of Columbia",
        "created_at": "",
        "updated_at": "",
        "deleted_at": ""
      }
    }
  ]
} 
*/

  bool? status;
  String? message;
  int? pages;
  int? rows;
  List<VehicleListModelData>? data;

  VehicleListModel({
    this.status,
    this.message,
    this.pages,
    this.rows,
    this.data,
  });
  VehicleListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    pages = json['pages']?.toInt();
    rows = json['rows']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <VehicleListModelData>[];
  v.forEach((v) {
  arr0.add(VehicleListModelData.fromJson(v));
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

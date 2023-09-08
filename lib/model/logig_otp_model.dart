
class LogigOtpModelData {


  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? phoneNumberVerifiedAt;
  String? businessId;
  String? promocode;
  String? subscriptionId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? accessToken;

  LogigOtpModelData({
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
    this.accessToken,
  });
  LogigOtpModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    image = json['image']?.toString();
    email = json['email']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    phoneNumber = json['phone_number']?.toString();
    phoneNumberVerifiedAt = json['phone_number_verified_at']?.toString();
    businessId = json['business_id']?.toString();
    promocode = json['promocode']?.toString();
    subscriptionId = json['subscription_id']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    accessToken = json['access_token']?.toString();
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
    data['access_token'] = accessToken;
    return data;
  }
}

class LogigOtpModel {
/*
{
  "status": true,
  "message": "Your are login successfully.",
  "data": {
    "id": 10,
    "first_name": "Jon",
    "last_name": "Sen",
    "image": "",
    "email": "",
    "email_verified_at": "",
    "phone_number": "+16512121212",
    "phone_number_verified_at": "2023-09-04 07:41:54",
    "business_id": "",
    "promocode": "",
    "subscription_id": "",
    "status": "Active",
    "created_at": "2023-09-04T07:41:54.000000Z",
    "updated_at": "2023-09-04T07:41:54.000000Z",
    "deleted_at": "",
    "access_token": "12|TYczSdwsoihPv5UbzlAa7LBPah5h2tsLAYYDvSbG"
  }
} 
*/

  bool? status;
  String? message;
  LogigOtpModelData? data;

  LogigOtpModel({
    this.status,
    this.message,
    this.data,
  });
  LogigOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? LogigOtpModelData.fromJson(json['data']) : null;
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

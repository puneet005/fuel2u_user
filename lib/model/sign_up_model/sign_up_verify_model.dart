
class SignUpVerifyModelData {
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? phoneNumberVerifiedAt;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? accessToken;

  SignUpVerifyModelData({
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.phoneNumberVerifiedAt,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.accessToken,
  });
  SignUpVerifyModelData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    phoneNumber = json['phone_number']?.toString();
    phoneNumberVerifiedAt = json['phone_number_verified_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
    accessToken = json['access_token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_number'] = phoneNumber;
    data['phone_number_verified_at'] = phoneNumberVerifiedAt;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['access_token'] = accessToken;
    return data;
  }
}

class SignUpVerifyModel {
  bool? status;
  String? message;
  SignUpVerifyModelData? data;

  SignUpVerifyModel({
    this.status,
    this.message,
    this.data,
  });
  SignUpVerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? SignUpVerifyModelData.fromJson(json['data']) : null;
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

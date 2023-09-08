
class SignInModelData {


  int? id;
  String? phoneNumber;
  String? token;
  String? otp;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? msgStatus;
  int? otpText;

  SignInModelData({
    this.id,
    this.phoneNumber,
    this.token,
    this.otp,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.msgStatus,
    this.otpText,
  });
  SignInModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    phoneNumber = json['phone_number']?.toString();
    token = json['token']?.toString();
    otp = json['otp']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    msgStatus = json['msg_status'];
    otpText = json['otp_text']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['phone_number'] = phoneNumber;
    data['token'] = token;
    data['otp'] = otp;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['msg_status'] = msgStatus;
    data['otp_text'] = otpText;
    return data;
  }
}

class SignInModel {
  bool? status;
  String? message;
  SignInModelData? data;

  SignInModel({
    this.status,
    this.message,
    this.data,
  });
  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? SignInModelData.fromJson(json['data']) : null;
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

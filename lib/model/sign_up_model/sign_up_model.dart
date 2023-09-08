class SignUpModelData {
/*
{
  "id": 1,
  "first_name": "Rock",
  "last_name": "",
  "phone_number": "",
  "email": "rock2@gmail.com",
  "token": "X8WFPRT24Q29exA3sKq83AWw4s98NoA7F1VTM7zu.1693314425",
  "otp": "bd3ef5c19067fe179f71c8b86ea4b39b",
  "created_at": "2023-08-29 13:07:05",
  "updated_at": "2023-08-29 13:07:05",
  "deleted_at": "",
  "msg_status": false,
  "otp_text": 4012
} 
*/

  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? token;
  String? otp;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  bool? msgStatus;
  int? otpText;

  SignUpModelData({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.token,
    this.otp,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.msgStatus,
    this.otpText,
  });
  SignUpModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    phoneNumber = json['phone_number']?.toString();
    email = json['email']?.toString();
    token = json['token']?.toString();
    otp = json['otp']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    msgStatus = json['msg_status'];
    otpText = json['otp_text']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['token'] = token;
    data['otp'] = otp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['msg_status'] = msgStatus;
    data['otp_text'] = otpText;
    return data;
  }
}

class SignUpModel {
/*
{
  "status": true,
  "message": "OTP successfully send on your phone number/email.",
  "data": {
    "id": 1,
    "first_name": "Rock",
    "last_name": "",
    "phone_number": "",
    "email": "rock2@gmail.com",
    "token": "X8WFPRT24Q29exA3sKq83AWw4s98NoA7F1VTM7zu.1693314425",
    "otp": "bd3ef5c19067fe179f71c8b86ea4b39b",
    "created_at": "2023-08-29 13:07:05",
    "updated_at": "2023-08-29 13:07:05",
    "deleted_at": "",
    "msg_status": false,
    "otp_text": 4012
  }
} 
*/

  bool? status;
  String? message;
  SignUpModelData? data;

  SignUpModel({
    this.status,
    this.message,
    this.data,
  });
  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? SignUpModelData.fromJson(json['data']) : null;
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

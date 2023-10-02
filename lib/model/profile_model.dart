class ProfileModelDataSubscription {
/*
{
  "id": 29,
  "user_id": 27,
  "plan_id": 1,
  "payment_status": "Paid",
  "subscription_id": "sub_1NvJKsDT8acp4IieNrcpgB2o",
  "created_at": "2023-09-18 10:24:49",
  "updated_at": "2023-09-28 12:28:55",
  "deleted_at": null
} 
*/

  int? id;
  int? userId;
  int? planId;
  String? paymentStatus;
  String? subscriptionId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ProfileModelDataSubscription({
    this.id,
    this.userId,
    this.planId,
    this.paymentStatus,
    this.subscriptionId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  ProfileModelDataSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    planId = json['plan_id']?.toInt();
    paymentStatus = json['payment_status']?.toString();
    subscriptionId = json['subscription_id']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['plan_id'] = planId;
    data['payment_status'] = paymentStatus;
    data['subscription_id'] = subscriptionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}


class ProfileModelData {
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
  int? subscriptionId;
  String? customerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? userType;
  List<String>? deliveryDay;
  String? deliveryFrom;
  String? deliveryTo;
  ProfileModelDataSubscription? subscription;

  ProfileModelData({
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
    this.customerId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userType,
    this.deliveryDay,
    this.deliveryFrom,
    this.deliveryTo,
    this.subscription,
  });
  ProfileModelData.fromJson(Map<String, dynamic> json) {
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
    subscriptionId = json['subscription_id']?.toInt();
    customerId = json['customer_id']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    userType = json['user_type']?.toString();
    subscription = (json['subscription'] != null) ? ProfileModelDataSubscription.fromJson(json['subscription']) : null;

  if (json['delivery_day'] != null) {
  final v = json['delivery_day'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    deliveryDay = arr0;
    }
    deliveryFrom = json['delivery_from']?.toString();
    deliveryTo = json['delivery_to']?.toString();
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
    data['customer_id'] = customerId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['user_type'] = userType;
    if (deliveryDay != null) {
      final v = deliveryDay;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['delivery_day'] = arr0;
    }
    data['delivery_from'] = deliveryFrom;
    data['delivery_to'] = deliveryTo;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class ProfileModel {
/*
{
  "status": true,
  "message": "Profile data found successfully.",
  "data": {
    "id": 27,
    "first_name": "Harry",
    "last_name": "Porter",
    "image": null,
    "email": null,
    "email_verified_at": null,
    "phone_number": "2025052222",
    "phone_number_verified_at": "2023-09-18 10:24:48",
    "business_id": null,
    "promocode": "P123123",
    "subscription_id": 69,
    "customer_id": "cus_Oeyagdn7n58TnE",
    "status": "Active",
    "created_at": "2023-09-18T10:24:48.000000Z",
    "updated_at": "2023-09-28T04:36:11.000000Z",
    "deleted_at": null,
    "user_type": "Employee",
    "delivery_day": [
      "Monday"
    ],
    "delivery_from": null,
    "delivery_to": null
  }
} 
*/

  bool? status;
  String? message;
  ProfileModelData? data;

  ProfileModel({
    this.status,
    this.message,
    this.data,
  });
  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? ProfileModelData.fromJson(json['data']) : null;
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



// class ProfileModelData {

//   int? id;
//   String? firstName;
//   String? lastName;
//   String? image;
//   String? email;
//   String? emailVerifiedAt;
//   String? phoneNumber;
//   String? phoneNumberVerifiedAt;
//   // int? businessId;
//   String? businessId;
//   String? promocode;
//   int? subscriptionId;
//   String? status;
//   String? userType;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   ProfileModelData({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.image,
//     this.email,
//     this.emailVerifiedAt,
//     this.phoneNumber,
//     this.phoneNumberVerifiedAt,
//     this.businessId,
//     this.promocode,
//     this.subscriptionId,
//     this.status,
//     this.userType,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//   ProfileModelData.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     firstName = json['first_name']?.toString();
//     lastName = json['last_name']?.toString();
//     image = json['image']?.toString();
//     email = json['email']?.toString();
//     emailVerifiedAt = json['email_verified_at']?.toString();
//     phoneNumber = json['phone_number']?.toString();
//     phoneNumberVerifiedAt = json['phone_number_verified_at']?.toString();
//     businessId = json['business_id']?.toString();
//     promocode = json['promocode']?.toString();
//     subscriptionId = json['subscription_id']?.toInt();
//     status = json['status']?.toString();
//     userType = json['user_type']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['image'] = image;
//     data['email'] = email;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['phone_number'] = phoneNumber;
//     data['phone_number_verified_at'] = phoneNumberVerifiedAt;
//     data['business_id'] = businessId;
//     data['promocode'] = promocode;
//     data['subscription_id'] = subscriptionId;
//     data['status'] = status;
//     data['user_type'] = userType;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class ProfileModel {
//   bool? status;
//   String? message;
//   ProfileModelData? data;

//   ProfileModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//   ProfileModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message']?.toString();
//     data = (json['data'] != null) ? ProfileModelData.fromJson(json['data']) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

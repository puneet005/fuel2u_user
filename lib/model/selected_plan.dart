
class SelectedPlanDataSubscriptionPlan {


  int? id;
  String? name;
  int? monthlyFee;
  int? deliveryFee;
  int? cancelFee;
  String? createdAt;
  String? updatedAt;

  SelectedPlanDataSubscriptionPlan({
    this.id,
    this.name,
    this.monthlyFee,
    this.deliveryFee,
    this.cancelFee,
    this.createdAt,
    this.updatedAt,
  });
  SelectedPlanDataSubscriptionPlan.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    monthlyFee = json['monthly_fee']?.toInt();
    deliveryFee = json['delivery_fee']?.toInt();
    cancelFee = json['cancel_fee']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['monthly_fee'] = monthlyFee;
    data['delivery_fee'] = deliveryFee;
    data['cancel_fee'] = cancelFee;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SelectedPlanDataSubscription {


  int? id;
  int? userId;
  int? planId;
  String? createdAt;
  String? updatedAt;
  SelectedPlanDataSubscriptionPlan? plan;

  SelectedPlanDataSubscription({
    this.id,
    this.userId,
    this.planId,
    this.createdAt,
    this.updatedAt,
    this.plan,
  });
  SelectedPlanDataSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    planId = json['plan_id']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    plan = (json['plan'] != null) ? SelectedPlanDataSubscriptionPlan.fromJson(json['plan']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['plan_id'] = planId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class SelectedPlanData {


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
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  SelectedPlanDataSubscription? subscription;

  SelectedPlanData({
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
    this.subscription,
  });
  SelectedPlanData.fromJson(Map<String, dynamic> json) {
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
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    subscription = (json['subscription'] != null) ? SelectedPlanDataSubscription.fromJson(json['subscription']) : null;
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
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class SelectedPlan {


  bool? status;
  String? message;
  SelectedPlanData? data;

  SelectedPlan({
    this.status,
    this.message,
    this.data,
  });
  SelectedPlan.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? SelectedPlanData.fromJson(json['data']) : null;
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

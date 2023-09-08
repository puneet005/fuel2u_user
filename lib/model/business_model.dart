
class BusinessModelData {
  String? employerName;
  String? deliveryAddress;
  String? deliveryCity;
  String? deliveryStateId;
  String? deliveryZipcode;
  String? deliveryInstructions;
  String? promocode;
  String? deliveryDay;
  String? contactName;
  String? contactEmail;
  String? contactPhoneNumber;
  String? sameAsDelivery;
  String? billingAddress;
  String? billingCity;
  String? billingStateId;
  String? billingZipcode;
  String? updatedAt;
  String? createdAt;
  int? id;

  BusinessModelData({
    this.employerName,
    this.deliveryAddress,
    this.deliveryCity,
    this.deliveryStateId,
    this.deliveryZipcode,
    this.deliveryInstructions,
    this.promocode,
    this.deliveryDay,
    this.contactName,
    this.contactEmail,
    this.contactPhoneNumber,
    this.sameAsDelivery,
    this.billingAddress,
    this.billingCity,
    this.billingStateId,
    this.billingZipcode,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  BusinessModelData.fromJson(Map<String, dynamic> json) {
    employerName = json['employer_name']?.toString();
    deliveryAddress = json['delivery_address']?.toString();
    deliveryCity = json['delivery_city']?.toString();
    deliveryStateId = json['delivery_state_id']?.toString();
    deliveryZipcode = json['delivery_zipcode']?.toString();
    deliveryInstructions = json['delivery_instructions']?.toString();
    promocode = json['promocode']?.toString();
    deliveryDay = json['delivery_day']?.toString();
    contactName = json['contact_name']?.toString();
    contactEmail = json['contact_email']?.toString();
    contactPhoneNumber = json['contact_phone_number']?.toString();
    sameAsDelivery = json['same_as_delivery']?.toString();
    billingAddress = json['billing_address']?.toString();
    billingCity = json['billing_city']?.toString();
    billingStateId = json['billing_state_id']?.toString();
    billingZipcode = json['billing_zipcode']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['employer_name'] = employerName;
    data['delivery_address'] = deliveryAddress;
    data['delivery_city'] = deliveryCity;
    data['delivery_state_id'] = deliveryStateId;
    data['delivery_zipcode'] = deliveryZipcode;
    data['delivery_instructions'] = deliveryInstructions;
    data['promocode'] = promocode;
    data['delivery_day'] = deliveryDay;
    data['contact_name'] = contactName;
    data['contact_email'] = contactEmail;
    data['contact_phone_number'] = contactPhoneNumber;
    data['same_as_delivery'] = sameAsDelivery;
    data['billing_address'] = billingAddress;
    data['billing_city'] = billingCity;
    data['billing_state_id'] = billingStateId;
    data['billing_zipcode'] = billingZipcode;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class BusinessModel {


  bool? status;
  String? message;
  BusinessModelData? data;

  BusinessModel({
    this.status,
    this.message,
    this.data,
  });
  BusinessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? BusinessModelData.fromJson(json['data']) : null;
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

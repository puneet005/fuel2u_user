class OrderCreatingModelData {
  int? id;
  String? locationId;
  String? vehicleId;
  String? fuelTypeId;
  String? fuelQuantity;
  String? instructions;
  String? deliveryDate;
  String? paymentMethod;
  int? userId;
  String? orderNumber;
  String? date;
  int? subscriptionId;
  int? businessId;
  String? status;
  String? updatedAt;
  String? createdAt;

  OrderCreatingModelData({
    this.id,
    this.locationId,
    this.vehicleId,
    this.fuelTypeId,
    this.fuelQuantity,
    this.instructions,
    this.deliveryDate,
    this.paymentMethod,
    this.userId,
    this.orderNumber,
    this.date,
    this.subscriptionId,
    this.businessId,
    this.status,
    this.updatedAt,
    this.createdAt,
  });
  OrderCreatingModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    locationId = json['location_id']?.toString();
    vehicleId = json['vehicle_id']?.toString();
    fuelTypeId = json['fuel_type_id']?.toString();
    fuelQuantity = json['fuel_quantity']?.toString();
    instructions = json['instructions']?.toString();
    deliveryDate = json['delivery_date']?.toString();
    paymentMethod = json['payment_method']?.toString();
    userId = json['user_id']?.toInt();
    orderNumber = json['order_number']?.toString();
    date = json['date']?.toString();
    subscriptionId = json['subscription_id']?.toInt();
    businessId = json['business_id']?.toInt();
    status = json['status']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['location_id'] = locationId;
    data['vehicle_id'] = vehicleId;
    data['fuel_type_id'] = fuelTypeId;
    data['fuel_quantity'] = fuelQuantity;
    data['instructions'] = instructions;
    data['delivery_date'] = deliveryDate;
    data['payment_method'] = paymentMethod;
    data['user_id'] = userId;
    data['order_number'] = orderNumber;
    data['date'] = date;
    data['subscription_id'] = subscriptionId;
    data['business_id'] = businessId;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}

class OrderCreatingModel {
  bool? status;
  String? message;
  OrderCreatingModelData? data;

  OrderCreatingModel({
    this.status,
    this.message,
    this.data,
  });
  OrderCreatingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? OrderCreatingModelData.fromJson(json['data']) : null;
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

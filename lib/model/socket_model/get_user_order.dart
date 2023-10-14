

class GetUserOrderDataOrderRating {


  int? id;
  int? orderId;
  int? driverId;
  int? rating;
  String? feedback;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataOrderRating({
    this.id,
    this.orderId,
    this.driverId,
    this.rating,
    this.feedback,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataOrderRating.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    orderId = json['order_id']?.toInt();
    driverId = json['driver_id']?.toInt();
    rating = json['rating']?.toInt();
    feedback = json['feedback']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['driver_id'] = driverId;
    data['rating'] = rating;
    data['feedback'] = feedback;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class GetUserOrderDataSubscriptionPlan {
/*
{
  "id": 1,
  "name": "Pay as You Go",
  "monthly_fee": 0,
  "delivery_fee": 25,
  "cancel_fee": 0,
  "prod_id": "prod_OfjfOzeUEG2NGv",
  "price_id": "price_1NsOCaDT8acp4IieJ7DlKpcG",
  "created_at": "2023-08-21 05:57:45",
  "updated_at": "2023-08-21 05:57:45",
  "deleted_at": null
} 
*/

  int? id;
  String? name;
  int? monthlyFee;
  int? deliveryFee;
  int? cancelFee;
  String? prodId;
  String? priceId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataSubscriptionPlan({
    this.id,
    this.name,
    this.monthlyFee,
    this.deliveryFee,
    this.cancelFee,
    this.prodId,
    this.priceId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataSubscriptionPlan.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    monthlyFee = json['monthly_fee']?.toInt();
    deliveryFee = json['delivery_fee']?.toInt();
    cancelFee = json['cancel_fee']?.toInt();
    prodId = json['prod_id']?.toString();
    priceId = json['price_id']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['monthly_fee'] = monthlyFee;
    data['delivery_fee'] = deliveryFee;
    data['cancel_fee'] = cancelFee;
    data['prod_id'] = prodId;
    data['price_id'] = priceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class GetUserOrderDataSubscription {
/*
{
  "id": 13,
  "user_id": 18,
  "plan_id": 1,
  "payment_status": "Pending",
  "subscription_id": null,
  "created_at": "2023-09-13 13:18:32",
  "updated_at": "2023-09-13 13:18:32",
  "deleted_at": null,
  "plan": {
    "id": 1,
    "name": "Pay as You Go",
    "monthly_fee": 0,
    "delivery_fee": 25,
    "cancel_fee": 0,
    "prod_id": "prod_OfjfOzeUEG2NGv",
    "price_id": "price_1NsOCaDT8acp4IieJ7DlKpcG",
    "created_at": "2023-08-21 05:57:45",
    "updated_at": "2023-08-21 05:57:45",
    "deleted_at": null
  }
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
  GetUserOrderDataSubscriptionPlan? plan;

  GetUserOrderDataSubscription({
    this.id,
    this.userId,
    this.planId,
    this.paymentStatus,
    this.subscriptionId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.plan,
  });
  GetUserOrderDataSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    planId = json['plan_id']?.toInt();
    paymentStatus = json['payment_status']?.toString();
    subscriptionId = json['subscription_id']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    plan = (json['plan'] != null) ? GetUserOrderDataSubscriptionPlan.fromJson(json['plan']) : null;
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
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class GetUserOrderDataBusiness {
/*
{
  "id": 4,
  "employer_name": "Testing",
  "delivery_address": "Vel ut sit veniam u",
  "delivery_city": "Est quasi aut et te",
  "delivery_state_id": 33,
  "delivery_zipcode": "38641",
  "delivery_instructions": "Quis nihil nemo tene",
  "promocode": "PROMO1234",
  "delivery_day": "Monday",
  "status": "Active",
  "contact_name": "Hannah Odonnell",
  "contact_email": "fataqu@mailinator.com",
  "contact_phone_number": "3034564654",
  "same_as_delivery": 1,
  "billing_address": null,
  "billing_city": null,
  "billing_state_id": null,
  "billing_zipcode": null,
  "created_at": "2023-09-04 06:01:19",
  "updated_at": "2023-09-04 10:07:56",
  "deleted_at": null
} 
*/

  int? id;
  String? employerName;
  String? deliveryAddress;
  String? deliveryCity;
  int? deliveryStateId;
  String? deliveryZipcode;
  String? deliveryInstructions;
  String? promocode;
  String? deliveryDay;
  String? status;
  String? contactName;
  String? contactEmail;
  String? contactPhoneNumber;
  int? sameAsDelivery;
  String? billingAddress;
  String? billingCity;
  String? billingStateId;
  String? billingZipcode;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataBusiness({
    this.id,
    this.employerName,
    this.deliveryAddress,
    this.deliveryCity,
    this.deliveryStateId,
    this.deliveryZipcode,
    this.deliveryInstructions,
    this.promocode,
    this.deliveryDay,
    this.status,
    this.contactName,
    this.contactEmail,
    this.contactPhoneNumber,
    this.sameAsDelivery,
    this.billingAddress,
    this.billingCity,
    this.billingStateId,
    this.billingZipcode,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataBusiness.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    employerName = json['employer_name']?.toString();
    deliveryAddress = json['delivery_address']?.toString();
    deliveryCity = json['delivery_city']?.toString();
    deliveryStateId = json['delivery_state_id']?.toInt();
    deliveryZipcode = json['delivery_zipcode']?.toString();
    deliveryInstructions = json['delivery_instructions']?.toString();
    promocode = json['promocode']?.toString();
    deliveryDay = json['delivery_day']?.toString();
    status = json['status']?.toString();
    contactName = json['contact_name']?.toString();
    contactEmail = json['contact_email']?.toString();
    contactPhoneNumber = json['contact_phone_number']?.toString();
    sameAsDelivery = json['same_as_delivery']?.toInt();
    billingAddress = json['billing_address']?.toString();
    billingCity = json['billing_city']?.toString();
    billingStateId = json['billing_state_id']?.toString();
    billingZipcode = json['billing_zipcode']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['employer_name'] = employerName;
    data['delivery_address'] = deliveryAddress;
    data['delivery_city'] = deliveryCity;
    data['delivery_state_id'] = deliveryStateId;
    data['delivery_zipcode'] = deliveryZipcode;
    data['delivery_instructions'] = deliveryInstructions;
    data['promocode'] = promocode;
    data['delivery_day'] = deliveryDay;
    data['status'] = status;
    data['contact_name'] = contactName;
    data['contact_email'] = contactEmail;
    data['contact_phone_number'] = contactPhoneNumber;
    data['same_as_delivery'] = sameAsDelivery;
    data['billing_address'] = billingAddress;
    data['billing_city'] = billingCity;
    data['billing_state_id'] = billingStateId;
    data['billing_zipcode'] = billingZipcode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class GetUserOrderDataVehicleColor {
/*
{
  "id": 1,
  "name": "White",
  "created_at": "2023-08-21 06:33:18",
  "updated_at": "2023-08-22 04:11:13",
  "deleted_at": null
} 
*/

  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataVehicleColor({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataVehicleColor.fromJson(Map<String, dynamic> json) {
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

class GetUserOrderDataVehicleModel {
/*
{
  "id": 1,
  "make_id": 1,
  "name": "Outlander SE SUV",
  "created_at": "2023-08-21 06:31:46",
  "updated_at": "2023-08-21 06:31:46",
  "deleted_at": null
} 
*/

  int? id;
  int? makeId;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataVehicleModel({
    this.id,
    this.makeId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataVehicleModel.fromJson(Map<String, dynamic> json) {
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

class GetUserOrderDataVehicleMake {
/*
{
  "id": 1,
  "name": "Chevrolet",
  "created_at": "2023-08-21 06:31:28",
  "updated_at": "2023-08-21 06:31:28",
  "deleted_at": null
} 
*/

  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataVehicleMake({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataVehicleMake.fromJson(Map<String, dynamic> json) {
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

class GetUserOrderDataVehicle {
/*
{
  "id": 7,
  "user_id": 18,
  "name": "Mery’s Car",
  "make_id": 1,
  "model_id": 1,
  "color_id": 1,
  "license_plate": "KHA211",
  "state_id": 33,
  "image": "storage/images/R4SxY4aQTkG5NVVqgP6ybfObjwhcYYOyaAYR2xRT.jpg",
  "created_at": "2023-09-06 11:07:50",
  "updated_at": "2023-09-06 11:07:50",
  "deleted_at": null,
  "make": {
    "id": 1,
    "name": "Chevrolet",
    "created_at": "2023-08-21 06:31:28",
    "updated_at": "2023-08-21 06:31:28",
    "deleted_at": null
  },
  "model": {
    "id": 1,
    "make_id": 1,
    "name": "Outlander SE SUV",
    "created_at": "2023-08-21 06:31:46",
    "updated_at": "2023-08-21 06:31:46",
    "deleted_at": null
  },
  "color": {
    "id": 1,
    "name": "White",
    "created_at": "2023-08-21 06:33:18",
    "updated_at": "2023-08-22 04:11:13",
    "deleted_at": null
  }
} 
*/

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
  GetUserOrderDataVehicleMake? make;
  GetUserOrderDataVehicleModel? model;
  GetUserOrderDataVehicleColor? color;

  GetUserOrderDataVehicle({
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
    this.make,
    this.model,
    this.color,
  });
  GetUserOrderDataVehicle.fromJson(Map<String, dynamic> json) {
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
    make = (json['make'] != null) ? GetUserOrderDataVehicleMake.fromJson(json['make']) : null;
    model = (json['model'] != null) ? GetUserOrderDataVehicleModel.fromJson(json['model']) : null;
    color = (json['color'] != null) ? GetUserOrderDataVehicleColor.fromJson(json['color']) : null;
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
    if (make != null) {
      data['make'] = make!.toJson();
    }
    if (model != null) {
      data['model'] = model!.toJson();
    }
    if (color != null) {
      data['color'] = color!.toJson();
    }
    return data;
  }
}

class GetUserOrderDataFuelType {
/*
{
  "id": 2,
  "type": "Octane 88",
  "price": "25.00",
  "created_at": "2023-08-18 05:17:17",
  "updated_at": "2023-08-18 05:17:33",
  "deleted_at": null
} 
*/

  int? id;
  String? type;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataFuelType({
    this.id,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataFuelType.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    type = json['type']?.toString();
    price = json['price']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class GetUserOrderDataTruck {
/*
{
  "id": 3,
  "name": "EV TRUCK",
  "license_plate": "CAA 123 244",
  "driver_id": 3,
  "no_of_tanks": 1,
  "availability": 1,
  "created_at": "2023-09-18 05:01:21",
  "updated_at": "2023-09-18 05:01:21",
  "deleted_at": null,
  "sum_of_capacity": "1000"
} 
*/

  int? id;
  String? name;
  String? licensePlate;
  int? driverId;
  int? noOfTanks;
  int? availability;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? sumOfCapacity;

  GetUserOrderDataTruck({
    this.id,
    this.name,
    this.licensePlate,
    this.driverId,
    this.noOfTanks,
    this.availability,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.sumOfCapacity,
  });
  GetUserOrderDataTruck.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    licensePlate = json['license_plate']?.toString();
    driverId = json['driver_id']?.toInt();
    noOfTanks = json['no_of_tanks']?.toInt();
    availability = json['availability']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    sumOfCapacity = json['sum_of_capacity']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['license_plate'] = licensePlate;
    data['driver_id'] = driverId;
    data['no_of_tanks'] = noOfTanks;
    data['availability'] = availability;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['sum_of_capacity'] = sumOfCapacity;
    return data;
  }
}

class GetUserOrderDataDriver {
/*
{
  "id": 3,
  "first_name": "Micky",
  "last_name": "Peters",
  "image": "storage/images/profile/uyFudYj2yQBysD5ahnuhvM0Se9bSTTk1OOnevVyT.jpg",
  "email": "rock@gmail.com",
  "email_verified_at": "2023-09-08 12:48:00",
  "phone_number": "2569958255",
  "phone_number_verified_at": "2023-09-08 12:48:00",
  "password": "$2y$10$sqPZlAq5rIQeiTlXbanWXOCQCZrFHRdF18HaUG5tFf41nA7r5el9W",
  "dl_number": "768",
  "latitude": null,
  "longitude": null,
  "status": "Active",
  "remember_token": null,
  "created_at": "2023-09-08 12:48:00",
  "updated_at": "2023-09-18 08:52:04",
  "deleted_at": null,
  "average_rating": 0
} 
*/

  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? phoneNumberVerifiedAt;
  String? password;
  String? dlNumber;
  String? latitude;
  String? longitude;
  String? status;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? averageRating;

  GetUserOrderDataDriver({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.phoneNumberVerifiedAt,
    this.password,
    this.dlNumber,
    this.latitude,
    this.longitude,
    this.status,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.averageRating,
  });
  GetUserOrderDataDriver.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    image = json['image']?.toString();
    email = json['email']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    phoneNumber = json['phone_number']?.toString();
    phoneNumberVerifiedAt = json['phone_number_verified_at']?.toString();
    password = json['password']?.toString();
    dlNumber = json['dl_number']?.toString();
    latitude = json['latitude']?.toString();
    longitude = json['longitude']?.toString();
    status = json['status']?.toString();
    rememberToken = json['remember_token']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    averageRating = json['average_rating']?.toInt();
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
    data['password'] = password;
    data['dl_number'] = dlNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['average_rating'] = averageRating;
    return data;
  }
}

class GetUserOrderDataLocationState {
/*
{
  "id": 6,
  "code": "CA",
  "name": "California",
  "created_at": null,
  "updated_at": null,
  "deleted_at": null
} 
*/

  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GetUserOrderDataLocationState({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataLocationState.fromJson(Map<String, dynamic> json) {
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

class GetUserOrderDataLocation {
/*
{
  "id": 6,
  "user_id": 18,
  "name": "Mery’s Mom home",
  "address": "1 Stockton St",
  "latitude": "37.785834",
  "longitude": "-122.406417",
  "city": "San Francisco",
  "state_id": 6,
  "zipcode": "94108",
  "created_at": "2023-09-12 05:58:10",
  "updated_at": "2023-09-12 05:58:10",
  "deleted_at": null,
  "state": {
    "id": 6,
    "code": "CA",
    "name": "California",
    "created_at": null,
    "updated_at": null,
    "deleted_at": null
  }
} 
*/

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
  GetUserOrderDataLocationState? state;

  GetUserOrderDataLocation({
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
  GetUserOrderDataLocation.fromJson(Map<String, dynamic> json) {
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
    state = (json['state'] != null) ? GetUserOrderDataLocationState.fromJson(json['state']) : null;
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

class GetUserOrderDataUserSubscription {
/*
{
  "id": 12,
  "user_id": 18,
  "plan_id": 1,
  "payment_status": "Pending",
  "subscription_id": null,
  "created_at": "2023-09-05 04:50:55",
  "updated_at": "2023-09-05 04:50:55",
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

  GetUserOrderDataUserSubscription({
    this.id,
    this.userId,
    this.planId,
    this.paymentStatus,
    this.subscriptionId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  GetUserOrderDataUserSubscription.fromJson(Map<String, dynamic> json) {
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

class GetUserOrderDataUser {
/*
{
  "id": 18,
  "first_name": "Jael",
  "last_name": "Peters",
  "image": null,
  "email": null,
  "email_verified_at": null,
  "phone_number": "6512100022",
  "phone_number_verified_at": "2023-09-05 04:50:37",
  "business_id": null,
  "promocode": null,
  "subscription_id": 12,
  "customer_id": "cus_OdA7x0B93C0zuG",
  "status": "Active",
  "created_at": "2023-09-05T04:50:37.000000Z",
  "updated_at": "2023-09-20T05:41:02.000000Z",
  "deleted_at": null,
  "user_type": "User",
  "delivery_day": "",
  "subscription": {
    "id": 12,
    "user_id": 18,
    "plan_id": 1,
    "payment_status": "Pending",
    "subscription_id": null,
    "created_at": "2023-09-05 04:50:55",
    "updated_at": "2023-09-05 04:50:55",
    "deleted_at": null
  }
} 
*/

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
  String? deliveryDay;
  GetUserOrderDataUserSubscription? subscription;

  GetUserOrderDataUser({
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
    this.subscription,
  });
  GetUserOrderDataUser.fromJson(Map<String, dynamic> json) {
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
    deliveryDay = json['delivery_day']?.toString();
    subscription = (json['subscription'] != null) ? GetUserOrderDataUserSubscription.fromJson(json['subscription']) : null;
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
    data['delivery_day'] = deliveryDay;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class GetUserOrderData {
/*
{
  "id": 28,
  "user_id": 18,
  "order_number": "ODR-06",
  "date": "2023-09-21",
  "subscription_id": 13,
  "location_id": 6,
  "vehicle_id": 7,
  "fuel_type_id": 2,
  "fuel_quantity": "Fill the tank",
  "business_id": 4,
  "truck_id": 3,
  "driver_id": 3,
  "instructions": "testing",
  "reason": null,
  "delivery_date": "2023-09-14",
  "order_sequence": 1,
  "payment_method": "pm_1Npks7DbCQcF6xccU2XRR255",
  "fuel_cost": null,
  "monthly_fee": null,
  "delivery_fee": null,
  "cancel_fee": null,
  "total_fee": null,
  "status": "Out for Delivery",
  "created_at": "2023-09-13 13:18:54",
  "updated_at": "2023-09-18 05:02:39",
  "deleted_at": null,
  "order_delivery_day": "Thu 14",
  "user": {
    "id": 18,
    "first_name": "Jael",
    "last_name": "Peters",
    "image": null,
    "email": null,
    "email_verified_at": null,
    "phone_number": "6512100022",
    "phone_number_verified_at": "2023-09-05 04:50:37",
    "business_id": null,
    "promocode": null,
    "subscription_id": 12,
    "customer_id": "cus_OdA7x0B93C0zuG",
    "status": "Active",
    "created_at": "2023-09-05T04:50:37.000000Z",
    "updated_at": "2023-09-20T05:41:02.000000Z",
    "deleted_at": null,
    "user_type": "User",

    "delivery_day": "",
    "subscription": {
      "id": 12,
      "user_id": 18,
      "plan_id": 1,
      "payment_status": "Pending",
      "subscription_id": null,
      "created_at": "2023-09-05 04:50:55",
      "updated_at": "2023-09-05 04:50:55",
      "deleted_at": null
    }
  },
  "location": {
    "id": 6,
    "user_id": 18,
    "name": "Mery’s Mom home",
    "address": "1 Stockton St",
    "latitude": "37.785834",
    "longitude": "-122.406417",
    "city": "San Francisco",
    "state_id": 6,
    "zipcode": "94108",
    "created_at": "2023-09-12 05:58:10",
    "updated_at": "2023-09-12 05:58:10",
    "deleted_at": null,
    "state": {
      "id": 6,
      "code": "CA",
      "name": "California",
      "created_at": null,
      "updated_at": null,
      "deleted_at": null
    }
  },
  "driver": {
    "id": 3,
    "first_name": "Micky",
    "last_name": "Peters",
    "image": "storage/images/profile/uyFudYj2yQBysD5ahnuhvM0Se9bSTTk1OOnevVyT.jpg",
    "email": "rock@gmail.com",
    "email_verified_at": "2023-09-08 12:48:00",
    "phone_number": "2569958255",
    "phone_number_verified_at": "2023-09-08 12:48:00",
    "password": "$2y$10$sqPZlAq5rIQeiTlXbanWXOCQCZrFHRdF18HaUG5tFf41nA7r5el9W",
    "dl_number": "768",
    "latitude": null,
    "longitude": null,
    "status": "Active",
    "remember_token": null,
    "created_at": "2023-09-08 12:48:00",
    "updated_at": "2023-09-18 08:52:04",
    "deleted_at": null,
    "average_rating": 0
  },
  "truck": {
    "id": 3,
    "name": "EV TRUCK",
    "license_plate": "CAA 123 244",
    "driver_id": 3,
    "no_of_tanks": 1,
    "availability": 1,
    "created_at": "2023-09-18 05:01:21",
    "updated_at": "2023-09-18 05:01:21",
    "deleted_at": null,
    "sum_of_capacity": "1000"
  },
  "fuel_type": {
    "id": 2,
    "type": "Octane 88",
    "price": "25.00",
    "created_at": "2023-08-18 05:17:17",
    "updated_at": "2023-08-18 05:17:33",
    "deleted_at": null
  },
  "vehicle": {
    "id": 7,
    "user_id": 18,
    "name": "Mery’s Car",
    "make_id": 1,
    "model_id": 1,
    "color_id": 1,
    "license_plate": "KHA211",
    "state_id": 33,
    "image": "storage/images/R4SxY4aQTkG5NVVqgP6ybfObjwhcYYOyaAYR2xRT.jpg",
    "created_at": "2023-09-06 11:07:50",
    "updated_at": "2023-09-06 11:07:50",
    "deleted_at": null,
    "make": {
      "id": 1,
      "name": "Chevrolet",
      "created_at": "2023-08-21 06:31:28",
      "updated_at": "2023-08-21 06:31:28",
      "deleted_at": null
    },
    "model": {
      "id": 1,
      "make_id": 1,
      "name": "Outlander SE SUV",
      "created_at": "2023-08-21 06:31:46",
      "updated_at": "2023-08-21 06:31:46",
      "deleted_at": null
    },
    "color": {
      "id": 1,
      "name": "White",
      "created_at": "2023-08-21 06:33:18",
      "updated_at": "2023-08-22 04:11:13",
      "deleted_at": null
    }
  },
  "business": {
    "id": 4,
    "employer_name": "Testing",
    "delivery_address": "Vel ut sit veniam u",
    "delivery_city": "Est quasi aut et te",
    "delivery_state_id": 33,
    "delivery_zipcode": "38641",
    "delivery_instructions": "Quis nihil nemo tene",
    "promocode": "PROMO1234",
    "delivery_day": "Monday",
    "status": "Active",
    "contact_name": "Hannah Odonnell",
    "contact_email": "fataqu@mailinator.com",
    "contact_phone_number": "3034564654",
    "same_as_delivery": 1,
    "billing_address": null,
    "billing_city": null,
    "billing_state_id": null,
    "billing_zipcode": null,
    "created_at": "2023-09-04 06:01:19",
    "updated_at": "2023-09-04 10:07:56",
    "deleted_at": null
  },
  "subscription": {
    "id": 13,
    "user_id": 18,
    "plan_id": 1,
    "payment_status": "Pending",
    "subscription_id": null,
    "created_at": "2023-09-13 13:18:32",
    "updated_at": "2023-09-13 13:18:32",
    "deleted_at": null,
    "plan": {
      "id": 1,
      "name": "Pay as You Go",
      "monthly_fee": 0,
      "delivery_fee": 25,
      "cancel_fee": 0,
      "prod_id": "prod_OfjfOzeUEG2NGv",
      "price_id": "price_1NsOCaDT8acp4IieJ7DlKpcG",
      "created_at": "2023-08-21 05:57:45",
      "updated_at": "2023-08-21 05:57:45",
      "deleted_at": null
    }
  },
  "order_rating": {
    "id": 1,
    "order_id": 28,
    "driver_id": 1,
    "rating": 4,
    "feedback": null,
    "created_at": "2023-09-14 12:51:45",
    "updated_at": "2023-09-14 12:51:45",
    "deleted_at": null
  }
} 
*/

  int? id;
  int? userId;
  String? orderNumber;
  String? date;
  int? subscriptionId;
  int? locationId;
  int? vehicleId;
  int? fuelTypeId;
  String? fuelQuantity;
  int? businessId;
  int? truckId;
  int? driverId;
  String? instructions;
  String? reason;
  String? deliveryDate;
  int? orderSequence;
  String? paymentMethod;
  String? fuelCost;
  String? monthlyFee;
  String? deliveryFee;
  String? cancelFee;
  String? totalFee;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  double? driverDistance;
  String? orderDeliveryDay;
  GetUserOrderDataUser? user;
  GetUserOrderDataLocation? location;
  GetUserOrderDataDriver? driver;
  GetUserOrderDataTruck? truck;
  GetUserOrderDataFuelType? fuelType;
  GetUserOrderDataVehicle? vehicle;
  GetUserOrderDataBusiness? business;
  GetUserOrderDataSubscription? subscription;
  GetUserOrderDataOrderRating? orderRating;

  GetUserOrderData({
    this.id,
    this.userId,
    this.orderNumber,
    this.date,
    this.subscriptionId,
    this.locationId,
    this.vehicleId,
    this.fuelTypeId,
    this.fuelQuantity,
    this.businessId,
    this.truckId,
    this.driverId,
    this.instructions,
    this.reason,
    this.deliveryDate,
    this.orderSequence,
    this.paymentMethod,
    this.fuelCost,
    this.monthlyFee,
    this.deliveryFee,
    this.cancelFee,
    this.totalFee,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.orderDeliveryDay,
    this.driverDistance,
    this.user,
    this.location,
    this.driver,
    this.truck,
    this.fuelType,
    this.vehicle,
    this.business,
    this.subscription,
    this.orderRating,
  });
  GetUserOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    orderNumber = json['order_number']?.toString();
    date = json['date']?.toString();
    subscriptionId = json['subscription_id']?.toInt();
    locationId = json['location_id']?.toInt();
    vehicleId = json['vehicle_id']?.toInt();
    fuelTypeId = json['fuel_type_id']?.toInt();
    fuelQuantity = json['fuel_quantity']?.toString();
    businessId = json['business_id']?.toInt();
    truckId = json['truck_id']?.toInt();
    driverId = json['driver_id']?.toInt();
    instructions = json['instructions']?.toString();
    reason = json['reason']?.toString();
    deliveryDate = json['delivery_date']?.toString();
    orderSequence = json['order_sequence']?.toInt();
    paymentMethod = json['payment_method']?.toString();
    fuelCost = json['fuel_cost']?.toString();
    monthlyFee = json['monthly_fee']?.toString();
    deliveryFee = json['delivery_fee']?.toString();
    cancelFee = json['cancel_fee']?.toString();
    totalFee = json['total_fee']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    driverDistance = json['driver_distance']?.toDouble();
    orderDeliveryDay = json['order_delivery_day']?.toString();
    user = (json['user'] != null) ? GetUserOrderDataUser.fromJson(json['user']) : null;
    location = (json['location'] != null) ? GetUserOrderDataLocation.fromJson(json['location']) : null;
    driver = (json['driver'] != null) ? GetUserOrderDataDriver.fromJson(json['driver']) : null;
    truck = (json['truck'] != null) ? GetUserOrderDataTruck.fromJson(json['truck']) : null;
    fuelType = (json['fuel_type'] != null) ? GetUserOrderDataFuelType.fromJson(json['fuel_type']) : null;
    vehicle = (json['vehicle'] != null) ? GetUserOrderDataVehicle.fromJson(json['vehicle']) : null;
    business = (json['business'] != null) ? GetUserOrderDataBusiness.fromJson(json['business']) : null;
    subscription = (json['subscription'] != null) ? GetUserOrderDataSubscription.fromJson(json['subscription']) : null;
    orderRating = (json['order_rating'] != null) ? GetUserOrderDataOrderRating.fromJson(json['order_rating']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_number'] = orderNumber;
    data['date'] = date;
    data['subscription_id'] = subscriptionId;
    data['location_id'] = locationId;
    data['vehicle_id'] = vehicleId;
    data['fuel_type_id'] = fuelTypeId;
    data['fuel_quantity'] = fuelQuantity;
    data['business_id'] = businessId;
    data['truck_id'] = truckId;
    data['driver_id'] = driverId;
    data['instructions'] = instructions;
    data['reason'] = reason;
    data['delivery_date'] = deliveryDate;
    data['order_sequence'] = orderSequence;
    data['payment_method'] = paymentMethod;
    data['fuel_cost'] = fuelCost;
    data['monthly_fee'] = monthlyFee;
    data['delivery_fee'] = deliveryFee;
    data['cancel_fee'] = cancelFee;
    data['total_fee'] = totalFee;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['driver_distance'] = driverDistance;
    data['order_delivery_day'] = orderDeliveryDay;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    if (truck != null) {
      data['truck'] = truck!.toJson();
    }
    if (fuelType != null) {
      data['fuel_type'] = fuelType!.toJson();
    }
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    if (business != null) {
      data['business'] = business!.toJson();
    }
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    if (orderRating != null) {
      data['order_rating'] = orderRating!.toJson();
    }
    return data;
  }
}

class GetUserOrder {
/*
{
  "status": true,
  "message": "Order data found successfully.",
  "data": {
    "id": 28,
    "user_id": 18,
    "order_number": "ODR-06",
    "date": "2023-09-21",
    "subscription_id": 13,
    "location_id": 6,
    "vehicle_id": 7,
    "fuel_type_id": 2,
    "fuel_quantity": "Fill the tank",
    "business_id": 4,
    "truck_id": 3,
    "driver_id": 3,
    "instructions": "testing",
    "reason": null,
    "delivery_date": "2023-09-14",
    "order_sequence": 1,
    "payment_method": "pm_1Npks7DbCQcF6xccU2XRR255",
    "fuel_cost": null,
    "monthly_fee": null,
    "delivery_fee": null,
    "cancel_fee": null,
    "total_fee": null,
    "status": "Out for Delivery",
    "created_at": "2023-09-13 13:18:54",
    "updated_at": "2023-09-18 05:02:39",
    "deleted_at": null,
    "order_delivery_day": "Thu 14",
    "user": {
      "id": 18,
      "first_name": "Jael",
      "last_name": "Peters",
      "image": null,
      "email": null,
      "email_verified_at": null,
      "phone_number": "6512100022",
      "phone_number_verified_at": "2023-09-05 04:50:37",
      "business_id": null,
      "promocode": null,
      "subscription_id": 12,
      "customer_id": "cus_OdA7x0B93C0zuG",
      "status": "Active",
      "created_at": "2023-09-05T04:50:37.000000Z",
      "updated_at": "2023-09-20T05:41:02.000000Z",
      "deleted_at": null,
      "user_type": "User",
      "delivery_day": "",
      "subscription": {
        "id": 12,
        "user_id": 18,
        "plan_id": 1,
        "payment_status": "Pending",
        "subscription_id": null,
        "created_at": "2023-09-05 04:50:55",
        "updated_at": "2023-09-05 04:50:55",
        "deleted_at": null
      }
    },
    "location": {
      "id": 6,
      "user_id": 18,
      "name": "Mery’s Mom home",
      "address": "1 Stockton St",
      "latitude": "37.785834",
      "longitude": "-122.406417",
      "city": "San Francisco",
      "state_id": 6,
      "zipcode": "94108",
      "created_at": "2023-09-12 05:58:10",
      "updated_at": "2023-09-12 05:58:10",
      "deleted_at": null,
      "state": {
        "id": 6,
        "code": "CA",
        "name": "California",
        "created_at": null,
        "updated_at": null,
        "deleted_at": null
      }
    },
    "driver": {
      "id": 3,
      "first_name": "Micky",
      "last_name": "Peters",
      "image": "storage/images/profile/uyFudYj2yQBysD5ahnuhvM0Se9bSTTk1OOnevVyT.jpg",
      "email": "rock@gmail.com",
      "email_verified_at": "2023-09-08 12:48:00",
      "phone_number": "2569958255",
      "phone_number_verified_at": "2023-09-08 12:48:00",
      "password": "$2y$10$sqPZlAq5rIQeiTlXbanWXOCQCZrFHRdF18HaUG5tFf41nA7r5el9W",
      "dl_number": "768",
      "latitude": null,
      "longitude": null,
      "status": "Active",
      "remember_token": null,
      "created_at": "2023-09-08 12:48:00",
      "updated_at": "2023-09-18 08:52:04",
      "deleted_at": null,
      "average_rating": 0
    },
    "truck": {
      "id": 3,
      "name": "EV TRUCK",
      "license_plate": "CAA 123 244",
      "driver_id": 3,
      "no_of_tanks": 1,
      "availability": 1,
      "created_at": "2023-09-18 05:01:21",
      "updated_at": "2023-09-18 05:01:21",
      "deleted_at": null,
      "sum_of_capacity": "1000"
    },
    "fuel_type": {
      "id": 2,
      "type": "Octane 88",
      "price": "25.00",
      "created_at": "2023-08-18 05:17:17",
      "updated_at": "2023-08-18 05:17:33",
      "deleted_at": null
    },
    "vehicle": {
      "id": 7,
      "user_id": 18,
      "name": "Mery’s Car",
      "make_id": 1,
      "model_id": 1,
      "color_id": 1,
      "license_plate": "KHA211",
      "state_id": 33,
      "image": "storage/images/R4SxY4aQTkG5NVVqgP6ybfObjwhcYYOyaAYR2xRT.jpg",
      "created_at": "2023-09-06 11:07:50",
      "updated_at": "2023-09-06 11:07:50",
      "deleted_at": null,
      "make": {
        "id": 1,
        "name": "Chevrolet",
        "created_at": "2023-08-21 06:31:28",
        "updated_at": "2023-08-21 06:31:28",
        "deleted_at": null
      },
      "model": {
        "id": 1,
        "make_id": 1,
        "name": "Outlander SE SUV",
        "created_at": "2023-08-21 06:31:46",
        "updated_at": "2023-08-21 06:31:46",
        "deleted_at": null
      },
      "color": {
        "id": 1,
        "name": "White",
        "created_at": "2023-08-21 06:33:18",
        "updated_at": "2023-08-22 04:11:13",
        "deleted_at": null
      }
    },
    "business": {
      "id": 4,
      "employer_name": "Testing",
      "delivery_address": "Vel ut sit veniam u",
      "delivery_city": "Est quasi aut et te",
      "delivery_state_id": 33,
      "delivery_zipcode": "38641",
      "delivery_instructions": "Quis nihil nemo tene",
      "promocode": "PROMO1234",
      "delivery_day": "Monday",
      "status": "Active",
      "contact_name": "Hannah Odonnell",
      "contact_email": "fataqu@mailinator.com",
      "contact_phone_number": "3034564654",
      "same_as_delivery": 1,
      "billing_address": null,
      "billing_city": null,
      "billing_state_id": null,
      "billing_zipcode": null,
      "created_at": "2023-09-04 06:01:19",
      "updated_at": "2023-09-04 10:07:56",
      "deleted_at": null
    },
    "subscription": {
      "id": 13,
      "user_id": 18,
      "plan_id": 1,
      "payment_status": "Pending",
      "subscription_id": null,
      "created_at": "2023-09-13 13:18:32",
      "updated_at": "2023-09-13 13:18:32",
      "deleted_at": null,
      "plan": {
        "id": 1,
        "name": "Pay as You Go",
        "monthly_fee": 0,
        "delivery_fee": 25,
        "cancel_fee": 0,
        "prod_id": "prod_OfjfOzeUEG2NGv",
        "price_id": "price_1NsOCaDT8acp4IieJ7DlKpcG",
        "created_at": "2023-08-21 05:57:45",
        "updated_at": "2023-08-21 05:57:45",
        "deleted_at": null
      }
    },
    "order_rating": {
      "id": 1,
      "order_id": 28,
      "driver_id": 1,
      "rating": 4,
      "feedback": null,
      "created_at": "2023-09-14 12:51:45",
      "updated_at": "2023-09-14 12:51:45",
      "deleted_at": null
    }
  }
} 
*/

  bool? status;
  String? message;
  GetUserOrderData? data;

  GetUserOrder({
    this.status,
    this.message,
    this.data,
  });
  GetUserOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? GetUserOrderData.fromJson(json['data']) : null;
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

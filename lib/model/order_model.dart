class OrderListModelDataSubscriptionPlan {
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

  OrderListModelDataSubscriptionPlan({
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
  OrderListModelDataSubscriptionPlan.fromJson(Map<String, dynamic> json) {
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

class OrderListModelDataSubscription {
/*
{
  "id": 13,
  "user_id": 18,
  "plan_id": 1,
  "created_at": "2023-09-13 13:18:32",
  "updated_at": "2023-09-13 13:18:32",
  "deleted_at": "",
  "plan": {
    "id": 1,
    "name": "Pay as You Go",
    "monthly_fee": 0,
    "delivery_fee": 25,
    "cancel_fee": 0,
    "prod_id": "prod_ObAXXUtz6amWZT",
    "price_id": "price_1NnyCADbCQcF6xccSBaAyWaD",
    "created_at": "2023-08-21 05:57:45",
    "updated_at": "2023-08-21 05:57:45",
    "deleted_at": ""
  }
} 
*/

  int? id;
  int? userId;
  int? planId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  OrderListModelDataSubscriptionPlan? plan;

  OrderListModelDataSubscription({
    this.id,
    this.userId,
    this.planId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.plan,
  });
  OrderListModelDataSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toInt();
    planId = json['plan_id']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    plan = (json['plan'] != null) ? OrderListModelDataSubscriptionPlan.fromJson(json['plan']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['plan_id'] = planId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class OrderListModelDataBusiness {
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
  "billing_address": "",
  "billing_city": "",
  "billing_state_id": "",
  "billing_zipcode": "",
  "created_at": "2023-09-04 06:01:19",
  "updated_at": "2023-09-04 10:07:56",
  "deleted_at": ""
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

  OrderListModelDataBusiness({
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
  OrderListModelDataBusiness.fromJson(Map<String, dynamic> json) {
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

class OrderListModelDataVehicle {
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
  "deleted_at": ""
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

  OrderListModelDataVehicle({
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
  });
  OrderListModelDataVehicle.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class OrderListModelDataFuelType {
/*
{
  "id": 2,
  "type": "Octane 88",
  "price": "25.00",
  "created_at": "2023-08-18 05:17:17",
  "updated_at": "2023-08-18 05:17:33",
  "deleted_at": ""
} 
*/

  int? id;
  String? type;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  OrderListModelDataFuelType({
    this.id,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  OrderListModelDataFuelType.fromJson(Map<String, dynamic> json) {
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

class OrderListModelDataTruck {
/*
{
  "id": 2,
  "name": "Testing Truck",
  "license_plate": "Lic435435",
  "driver_id": 1,
  "no_of_tanks": 1,
  "availability": 0,
  "created_at": "2023-08-25 10:24:12",
  "updated_at": "2023-08-25 10:24:49",
  "deleted_at": "",
  "sum_of_capacity": "52"
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

  OrderListModelDataTruck({
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
  OrderListModelDataTruck.fromJson(Map<String, dynamic> json) {
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

class OrderListModelDataDriver {
/*
{
  "id": 1,
  "first_name": "Driver",
  "last_name": "Truck",
  "image": "",
  "email": "driver@yopmail.com",
  "email_verified_at": "",
  "phone_number": "3035025432",
  "phone_number_verified_at": "",
  "password": "$2a$12$AOHYvUf1i/ZmahmrJfys.OSfkeqhs.nl1un0O1ycpeb8jr6fa.IB2",
  "dl_number": "us2323",
  "status": "Inactive",
  "remember_token": "",
  "created_at": "2023-08-18 10:51:54",
  "updated_at": "2023-09-05 05:44:40",
  "deleted_at": "",
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
  String? status;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? averageRating;

  OrderListModelDataDriver({
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
    this.status,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.averageRating,
  });
  OrderListModelDataDriver.fromJson(Map<String, dynamic> json) {
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
    data['status'] = status;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['average_rating'] = averageRating;
    return data;
  }
}

class OrderListModelDataLocation {
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

  OrderListModelDataLocation({
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
  });
  OrderListModelDataLocation.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class OrderListModelData {
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
  String? truckId;
  String? driverId;
  String? instructions;
  String? reason;
  String? deliveryDate;
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
  OrderListModelDataLocation? location;
  OrderListModelDataDriver? driver;
  OrderListModelDataTruck? truck;
  OrderListModelDataFuelType? fuelType;
  OrderListModelDataVehicle? vehicle;
  OrderListModelDataBusiness? business;
  OrderListModelDataSubscription? subscription;

  OrderListModelData({
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
    this.location,
    this.driver,
    this.truck,
    this.fuelType,
    this.vehicle,
    this.business,
    this.subscription,
  });
  OrderListModelData.fromJson(Map<String, dynamic> json) {
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
    truckId = json['truck_id']?.toString();
    driverId = json['driver_id']?.toString();
    instructions = json['instructions']?.toString();
    reason = json['reason']?.toString();
    deliveryDate = json['delivery_date']?.toString();
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
    location = (json['location'] != null) ? OrderListModelDataLocation.fromJson(json['location']) : null;
    driver = (json['driver'] != null && json['driver'] != "") ? OrderListModelDataDriver.fromJson(json['driver']) : null;
    truck = (json['truck'] != null && json['truck'] != "") ? OrderListModelDataTruck.fromJson(json['truck']) : null;
    fuelType = (json['fuel_type'] != null && json['fuel_type'] != "") ? OrderListModelDataFuelType.fromJson(json['fuel_type']) : null;
    vehicle = (json['vehicle'] != null && json['vehicle'] != "" )  ? OrderListModelDataVehicle.fromJson(json['vehicle']) : null;
    business = (json['business'] != null && json['business'] != "" ) ? OrderListModelDataBusiness.fromJson(json['business']) : null;
    subscription = (json['subscription'] != null && json['business'] != "" ) ? OrderListModelDataSubscription.fromJson(json['subscription']) : null;
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
    return data;
  }
}

class OrderListModel {
  bool? status;
  String? message;
  int? pages;
  int? rows;
  List<OrderListModelData>? data;

  OrderListModel({
    this.status,
    this.message,
    this.pages,
    this.rows,
    this.data,
  });
  OrderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    pages = json['pages']?.toInt();
    rows = json['rows']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <OrderListModelData>[];
  v.forEach((v) {
  arr0.add(OrderListModelData.fromJson(v));
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








// class OrderListModelDataSubscriptionPlan {
//   int? id;
//   String? name;
//   int? monthlyFee;
//   int? deliveryFee;
//   int? cancelFee;
//   String? prodId;
//   String? priceId;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   OrderListModelDataSubscriptionPlan({
//     this.id,
//     this.name,
//     this.monthlyFee,
//     this.deliveryFee,
//     this.cancelFee,
//     this.prodId,
//     this.priceId,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//   OrderListModelDataSubscriptionPlan.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     name = json['name']?.toString();
//     monthlyFee = json['monthly_fee']?.toInt();
//     deliveryFee = json['delivery_fee']?.toInt();
//     cancelFee = json['cancel_fee']?.toInt();
//     prodId = json['prod_id']?.toString();
//     priceId = json['price_id']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['monthly_fee'] = monthlyFee;
//     data['delivery_fee'] = deliveryFee;
//     data['cancel_fee'] = cancelFee;
//     data['prod_id'] = prodId;
//     data['price_id'] = priceId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class OrderListModelDataSubscription {
//   int? id;
//   int? userId;
//   int? planId;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   OrderListModelDataSubscriptionPlan? plan;

//   OrderListModelDataSubscription({
//     this.id,
//     this.userId,
//     this.planId,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.plan,
//   });
//   OrderListModelDataSubscription.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     userId = json['user_id']?.toInt();
//     planId = json['plan_id']?.toInt();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//     plan = (json['plan'] != null) ? OrderListModelDataSubscriptionPlan.fromJson(json['plan']) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['plan_id'] = planId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (plan != null) {
//       data['plan'] = plan!.toJson();
//     }
//     return data;
//   }
// }

// class OrderListModelDataBusiness {


//   int? id;
//   String? employerName;
//   String? deliveryAddress;
//   String? deliveryCity;
//   int? deliveryStateId;
//   String? deliveryZipcode;
//   String? deliveryInstructions;
//   String? promocode;
//   String? deliveryDay;
//   String? status;
//   String? contactName;
//   String? contactEmail;
//   String? contactPhoneNumber;
//   int? sameAsDelivery;
//   String? billingAddress;
//   String? billingCity;
//   String? billingStateId;
//   String? billingZipcode;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   OrderListModelDataBusiness({
//     this.id,
//     this.employerName,
//     this.deliveryAddress,
//     this.deliveryCity,
//     this.deliveryStateId,
//     this.deliveryZipcode,
//     this.deliveryInstructions,
//     this.promocode,
//     this.deliveryDay,
//     this.status,
//     this.contactName,
//     this.contactEmail,
//     this.contactPhoneNumber,
//     this.sameAsDelivery,
//     this.billingAddress,
//     this.billingCity,
//     this.billingStateId,
//     this.billingZipcode,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//   OrderListModelDataBusiness.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     employerName = json['employer_name']?.toString();
//     deliveryAddress = json['delivery_address']?.toString();
//     deliveryCity = json['delivery_city']?.toString();
//     deliveryStateId = json['delivery_state_id']?.toInt();
//     deliveryZipcode = json['delivery_zipcode']?.toString();
//     deliveryInstructions = json['delivery_instructions']?.toString();
//     promocode = json['promocode']?.toString();
//     deliveryDay = json['delivery_day']?.toString();
//     status = json['status']?.toString();
//     contactName = json['contact_name']?.toString();
//     contactEmail = json['contact_email']?.toString();
//     contactPhoneNumber = json['contact_phone_number']?.toString();
//     sameAsDelivery = json['same_as_delivery']?.toInt();
//     billingAddress = json['billing_address']?.toString();
//     billingCity = json['billing_city']?.toString();
//     billingStateId = json['billing_state_id']?.toString();
//     billingZipcode = json['billing_zipcode']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['employer_name'] = employerName;
//     data['delivery_address'] = deliveryAddress;
//     data['delivery_city'] = deliveryCity;
//     data['delivery_state_id'] = deliveryStateId;
//     data['delivery_zipcode'] = deliveryZipcode;
//     data['delivery_instructions'] = deliveryInstructions;
//     data['promocode'] = promocode;
//     data['delivery_day'] = deliveryDay;
//     data['status'] = status;
//     data['contact_name'] = contactName;
//     data['contact_email'] = contactEmail;
//     data['contact_phone_number'] = contactPhoneNumber;
//     data['same_as_delivery'] = sameAsDelivery;
//     data['billing_address'] = billingAddress;
//     data['billing_city'] = billingCity;
//     data['billing_state_id'] = billingStateId;
//     data['billing_zipcode'] = billingZipcode;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class OrderListModelDataVehicle {


//   int? id;
//   int? userId;
//   String? name;
//   int? makeId;
//   int? modelId;
//   int? colorId;
//   String? licensePlate;
//   int? stateId;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   OrderListModelDataVehicle({
//     this.id,
//     this.userId,
//     this.name,
//     this.makeId,
//     this.modelId,
//     this.colorId,
//     this.licensePlate,
//     this.stateId,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//   OrderListModelDataVehicle.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     userId = json['user_id']?.toInt();
//     name = json['name']?.toString();
//     makeId = json['make_id']?.toInt();
//     modelId = json['model_id']?.toInt();
//     colorId = json['color_id']?.toInt();
//     licensePlate = json['license_plate']?.toString();
//     stateId = json['state_id']?.toInt();
//     image = json['image']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['name'] = name;
//     data['make_id'] = makeId;
//     data['model_id'] = modelId;
//     data['color_id'] = colorId;
//     data['license_plate'] = licensePlate;
//     data['state_id'] = stateId;
//     data['image'] = image;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class OrderListModelDataFuelType {


//   int? id;
//   String? type;
//   String? price;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   OrderListModelDataFuelType({
//     this.id,
//     this.type,
//     this.price,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//   OrderListModelDataFuelType.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     type = json['type']?.toString();
//     price = json['price']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['type'] = type;
//     data['price'] = price;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class OrderListModelDataLocation {


//   int? id;
//   int? userId;
//   String? name;
//   String? address;
//   String? latitude;
//   String? longitude;
//   String? city;
//   int? stateId;
//   String? zipcode;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   OrderListModelDataLocation({
//     this.id,
//     this.userId,
//     this.name,
//     this.address,
//     this.latitude,
//     this.longitude,
//     this.city,
//     this.stateId,
//     this.zipcode,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//   OrderListModelDataLocation.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     userId = json['user_id']?.toInt();
//     name = json['name']?.toString();
//     address = json['address']?.toString();
//     latitude = json['latitude']?.toString();
//     longitude = json['longitude']?.toString();
//     city = json['city']?.toString();
//     stateId = json['state_id']?.toInt();
//     zipcode = json['zipcode']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['name'] = name;
//     data['address'] = address;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['city'] = city;
//     data['state_id'] = stateId;
//     data['zipcode'] = zipcode;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class OrderListModelData {
//   int? id;
//   int? userId;
//   String? orderNumber;
//   String? date;
//   int? subscriptionId;
//   int? locationId;
//   int? vehicleId;
//   int? fuelTypeId;
//   String? fuelQuantity;
//   int? businessId;
//   String? truckId;
//   String? driverId;
//   String? instructions;
//   String? reason;
//   String? deliveryDate;
//   String? fuelCost;
//   String? monthlyFee;
//   String? deliveryFee;
//   String? cancelFee;
//   String? totalFee;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   OrderListModelDataLocation? location;
//   String? driver;
//   String? truck;
//   OrderListModelDataFuelType? fuelType;
//   OrderListModelDataVehicle? vehicle;
//   OrderListModelDataBusiness? business;
//   OrderListModelDataSubscription? subscription;

//   OrderListModelData({
//     this.id,
//     this.userId,
//     this.orderNumber,
//     this.date,
//     this.subscriptionId,
//     this.locationId,
//     this.vehicleId,
//     this.fuelTypeId,
//     this.fuelQuantity,
//     this.businessId,
//     this.truckId,
//     this.driverId,
//     this.instructions,
//     this.reason,
//     this.deliveryDate,
//     this.fuelCost,
//     this.monthlyFee,
//     this.deliveryFee,
//     this.cancelFee,
//     this.totalFee,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.location,
//     this.driver,
//     this.truck,
//     this.fuelType,
//     this.vehicle,
//     this.business,
//     this.subscription,
//   });
//   OrderListModelData.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     userId = json['user_id']?.toInt();
//     orderNumber = json['order_number']?.toString();
//     date = json['date']?.toString();
//     subscriptionId = json['subscription_id']?.toInt();
//     locationId = json['location_id']?.toInt();
//     vehicleId = json['vehicle_id']?.toInt();
//     fuelTypeId = json['fuel_type_id']?.toInt();
//     fuelQuantity = json['fuel_quantity']?.toString();
//     businessId = json['business_id']?.toInt();
//     truckId = json['truck_id']?.toString();
//     driverId = json['driver_id']?.toString();
//     instructions = json['instructions']?.toString();
//     reason = json['reason']?.toString();
//     deliveryDate = json['delivery_date']?.toString();
//     fuelCost = json['fuel_cost']?.toString();
//     monthlyFee = json['monthly_fee']?.toString();
//     deliveryFee = json['delivery_fee']?.toString();
//     cancelFee = json['cancel_fee']?.toString();
//     totalFee = json['total_fee']?.toString();
//     status = json['status']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//     location = (json['location'] != null) ? OrderListModelDataLocation.fromJson(json['location']) : null;
//     driver = json['driver']?.toString();
//     truck = json['truck']?.toString();
//     fuelType = (json['fuel_type'] != null) ? OrderListModelDataFuelType.fromJson(json['fuel_type']) : null;
//     vehicle = (json['vehicle'] != null) ? OrderListModelDataVehicle.fromJson(json['vehicle']) : null;
//     business = (json['business'] != null) ? OrderListModelDataBusiness.fromJson(json['business']) : null;
//     subscription = (json['subscription'] != null) ? OrderListModelDataSubscription.fromJson(json['subscription']) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['order_number'] = orderNumber;
//     data['date'] = date;
//     data['subscription_id'] = subscriptionId;
//     data['location_id'] = locationId;
//     data['vehicle_id'] = vehicleId;
//     data['fuel_type_id'] = fuelTypeId;
//     data['fuel_quantity'] = fuelQuantity;
//     data['business_id'] = businessId;
//     data['truck_id'] = truckId;
//     data['driver_id'] = driverId;
//     data['instructions'] = instructions;
//     data['reason'] = reason;
//     data['delivery_date'] = deliveryDate;
//     data['fuel_cost'] = fuelCost;
//     data['monthly_fee'] = monthlyFee;
//     data['delivery_fee'] = deliveryFee;
//     data['cancel_fee'] = cancelFee;
//     data['total_fee'] = totalFee;
//     data['status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     data['driver'] = driver;
//     data['truck'] = truck;
//     if (fuelType != null) {
//       data['fuel_type'] = fuelType!.toJson();
//     }
//     if (vehicle != null) {
//       data['vehicle'] = vehicle!.toJson();
//     }
//     if (business != null) {
//       data['business'] = business!.toJson();
//     }
//     if (subscription != null) {
//       data['subscription'] = subscription!.toJson();
//     }
//     return data;
//   }
// }

// class OrderListModel {  bool? status;
//   String? message;
//   int? pages;
//   int? rows;
//   List<OrderListModelData>? data;

//   OrderListModel({
//     this.status,
//     this.message,
//     this.pages,
//     this.rows,
//     this.data,
//   });
//   OrderListModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message']?.toString();
//     pages = json['pages']?.toInt();
//     rows = json['rows']?.toInt();
//   if (json['data'] != null) {
//   final v = json['data'];
//   final arr0 = <OrderListModelData>[];
//   v.forEach((v) {
//   arr0.add(OrderListModelData.fromJson(v));
//   });
//     this.data = arr0;
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     data['pages'] = pages;
//     data['rows'] = rows;
//     if (this.data != null) {
//       final v = this.data;
//       final arr0 = [];
//   v!.forEach((v) {
//   arr0.add(v.toJson());
//   });
//       data['data'] = arr0;
//     }
//     return data;
//   }
// }

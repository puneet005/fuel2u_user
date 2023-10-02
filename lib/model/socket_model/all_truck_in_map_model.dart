class AllTruckInMapModelDataTruckTanksFuelType {
  int? id;
  String? type;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  AllTruckInMapModelDataTruckTanksFuelType({
    this.id,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  AllTruckInMapModelDataTruckTanksFuelType.fromJson(Map<String, dynamic> json) {
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

class AllTruckInMapModelDataTruckTanks {
  int? id;
  int? truckId;
  int? fuelTypeId;
  int? capacity;
  int? remaining;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  AllTruckInMapModelDataTruckTanksFuelType? fuelType;

  AllTruckInMapModelDataTruckTanks({
    this.id,
    this.truckId,
    this.fuelTypeId,
    this.capacity,
    this.remaining,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fuelType,
  });
  AllTruckInMapModelDataTruckTanks.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    truckId = json['truck_id']?.toInt();
    fuelTypeId = json['fuel_type_id']?.toInt();
    capacity = json['capacity']?.toInt();
    remaining = json['remaining']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    fuelType = (json['fuel_type'] != null) ? AllTruckInMapModelDataTruckTanksFuelType.fromJson(json['fuel_type']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['truck_id'] = truckId;
    data['fuel_type_id'] = fuelTypeId;
    data['capacity'] = capacity;
    data['remaining'] = remaining;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (fuelType != null) {
      data['fuel_type'] = fuelType!.toJson();
    }
    return data;
  }
}

class AllTruckInMapModelDataTruck {
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
  "deleted_at": null,
  "sum_of_capacity": "52",
  "tanks": [
    {
      "id": 6,
      "truck_id": 2,
      "fuel_type_id": 4,
      "capacity": 52,
      "remaining": 0,
      "created_at": "2023-08-25 10:24:49",
      "updated_at": "2023-08-25 10:24:49",
      "deleted_at": null,
      "fuel_type": {
        "id": 4,
        "type": "Testing Fuel Type",
        "price": "2324.54",
        "created_at": "2023-08-25 09:56:54",
        "updated_at": "2023-09-01 12:05:55",
        "deleted_at": null
      }
    }
  ]
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
  List<AllTruckInMapModelDataTruckTanks>? tanks;

  AllTruckInMapModelDataTruck({
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
    this.tanks,
  });
  AllTruckInMapModelDataTruck.fromJson(Map<String, dynamic> json) {
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
  if (json['tanks'] != null) {
  final v = json['tanks'];
  final arr0 = <AllTruckInMapModelDataTruckTanks>[];
  v.forEach((v) {
  arr0.add(AllTruckInMapModelDataTruckTanks.fromJson(v));
  });
    tanks = arr0;
    }
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
    if (tanks != null) {
      final v = tanks;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['tanks'] = arr0;
    }
    return data;
  }
}

class AllTruckInMapModelData {
/*
{
  "id": 1,
  "first_name": "Driver",
  "last_name": "Truck",
  "image": null,
  "email": "driver@yopmail.com",
  "email_verified_at": null,
  "phone_number": "3035025432",
  "phone_number_verified_at": null,
  "password": "$2a$12$AOHYvUf1i/ZmahmrJfys.OSfkeqhs.nl1un0O1ycpeb8jr6fa.IB2",
  "dl_number": "us2323",
  "latitude": "26.850614",
  "longitude": "75.761648",
  "status": "Active",
  "remember_token": null,
  "created_at": "2023-08-18 10:51:54",
  "updated_at": "2023-09-05 05:44:40",
  "deleted_at": null,
  "distance": 1.02,
  "average_rating": 4,
  "fuel_types": "Testing Fuel Type",
  "truck": {
    "id": 2,
    "name": "Testing Truck",
    "license_plate": "Lic435435",
    "driver_id": 1,
    "no_of_tanks": 1,
    "availability": 0,
    "created_at": "2023-08-25 10:24:12",
    "updated_at": "2023-08-25 10:24:49",
    "deleted_at": null,
    "sum_of_capacity": "52",
    "tanks": [
      {
        "id": 6,
        "truck_id": 2,
        "fuel_type_id": 4,
        "capacity": 52,
        "remaining": 0,
        "created_at": "2023-08-25 10:24:49",
        "updated_at": "2023-08-25 10:24:49",
        "deleted_at": null,
        "fuel_type": {
          "id": 4,
          "type": "Testing Fuel Type",
          "price": "2324.54",
          "created_at": "2023-08-25 09:56:54",
          "updated_at": "2023-09-01 12:05:55",
          "deleted_at": null
        }
      }
    ]
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
  String? password;
  String? dlNumber;
  String? latitude;
  String? longitude;
  String? status;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  double? distance;
  int? averageRating;
  String? fuelTypes;
  AllTruckInMapModelDataTruck? truck;

  AllTruckInMapModelData({
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
    this.distance,
    this.averageRating,
    this.fuelTypes,
    this.truck,
  });
  AllTruckInMapModelData.fromJson(Map<String, dynamic> json) {
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
    distance = json['distance']?.toDouble();
    averageRating = json['average_rating']?.toInt();
    fuelTypes = json['fuel_types']?.toString();
    truck = (json['truck'] != null) ? AllTruckInMapModelDataTruck.fromJson(json['truck']) : null;
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
    data['distance'] = distance;
    data['average_rating'] = averageRating;
    data['fuel_types'] = fuelTypes;
    if (truck != null) {
      data['truck'] = truck!.toJson();
    }
    return data;
  }
}

class AllTruckInMapModel {
/*
{
  "status": true,
  "message": "Drivers found successfully.",
  "data": [
    {
      "id": 1,
      "first_name": "Driver",
      "last_name": "Truck",
      "image": null,
      "email": "driver@yopmail.com",
      "email_verified_at": null,
      "phone_number": "3035025432",
      "phone_number_verified_at": null,
      "password": "$2a$12$AOHYvUf1i/ZmahmrJfys.OSfkeqhs.nl1un0O1ycpeb8jr6fa.IB2",
      "dl_number": "us2323",
      "latitude": "26.850614",
      "longitude": "75.761648",
      "status": "Active",
      "remember_token": null,
      "created_at": "2023-08-18 10:51:54",
      "updated_at": "2023-09-05 05:44:40",
      "deleted_at": null,
      "distance": 1.02,
      "average_rating": 4,
      "fuel_types": "Testing Fuel Type",
      "truck": {
        "id": 2,
        "name": "Testing Truck",
        "license_plate": "Lic435435",
        "driver_id": 1,
        "no_of_tanks": 1,
        "availability": 0,
        "created_at": "2023-08-25 10:24:12",
        "updated_at": "2023-08-25 10:24:49",
        "deleted_at": null,
        "sum_of_capacity": "52",
        "tanks": [
          {
            "id": 6,
            "truck_id": 2,
            "fuel_type_id": 4,
            "capacity": 52,
            "remaining": 0,
            "created_at": "2023-08-25 10:24:49",
            "updated_at": "2023-08-25 10:24:49",
            "deleted_at": null,
            "fuel_type": {
              "id": 4,
              "type": "Testing Fuel Type",
              "price": "2324.54",
              "created_at": "2023-08-25 09:56:54",
              "updated_at": "2023-09-01 12:05:55",
              "deleted_at": null
            }
          }
        ]
      }
    }
  ]
} 
*/

  bool? status;
  String? message;
  List<AllTruckInMapModelData>? data;

  AllTruckInMapModel({
    this.status,
    this.message,
    this.data,
  });
  AllTruckInMapModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <AllTruckInMapModelData>[];
  v.forEach((v) {
  arr0.add(AllTruckInMapModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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




// class AllTruckInMapModelData {
// /*
// {
//   "id": 1,
//   "first_name": "Driver",
//   "last_name": "Truck",
//   "image": null,
//   "email": "driver@yopmail.com",
//   "email_verified_at": null,
//   "phone_number": "3035025432",
//   "phone_number_verified_at": null,
//   "password": "$2a$12$AOHYvUf1i/ZmahmrJfys.OSfkeqhs.nl1un0O1ycpeb8jr6fa.IB2",
//   "dl_number": "us2323",
//   "latitude": "26.850614",
//   "longitude": "75.761648",
//   "status": "Active",
//   "remember_token": null,
//   "created_at": "2023-08-18 10:51:54",
//   "updated_at": "2023-09-05 05:44:40",
//   "deleted_at": null,
//   "distance": 0.0014890019666789892,
//   "average_rating": 4
// } 
// */

//   int? id;
//   String? firstName;
//   String? lastName;
//   String? image;
//   String? email;
//   String? emailVerifiedAt;
//   String? phoneNumber;
//   String? phoneNumberVerifiedAt;
//   String? password;
//   String? dlNumber;
//   String? latitude;
//   String? longitude;
//   String? status;
//   String? rememberToken;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   double? distance;
//   int? averageRating;

//   AllTruckInMapModelData({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.image,
//     this.email,
//     this.emailVerifiedAt,
//     this.phoneNumber,
//     this.phoneNumberVerifiedAt,
//     this.password,
//     this.dlNumber,
//     this.latitude,
//     this.longitude,
//     this.status,
//     this.rememberToken,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.distance,
//     this.averageRating,
//   });
//   AllTruckInMapModelData.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     firstName = json['first_name']?.toString();
//     lastName = json['last_name']?.toString();
//     image = json['image']?.toString();
//     email = json['email']?.toString();
//     emailVerifiedAt = json['email_verified_at']?.toString();
//     phoneNumber = json['phone_number']?.toString();
//     phoneNumberVerifiedAt = json['phone_number_verified_at']?.toString();
//     password = json['password']?.toString();
//     dlNumber = json['dl_number']?.toString();
//     latitude = json['latitude']?.toString();
//     longitude = json['longitude']?.toString();
//     status = json['status']?.toString();
//     rememberToken = json['remember_token']?.toString();
//     createdAt = json['created_at']?.toString();
//     updatedAt = json['updated_at']?.toString();
//     deletedAt = json['deleted_at']?.toString();
//     distance = json['distance']?.toDouble();
//     averageRating = json['average_rating']?.toInt();
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
//     data['password'] = password;
//     data['dl_number'] = dlNumber;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['status'] = status;
//     data['remember_token'] = rememberToken;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     data['distance'] = distance;
//     data['average_rating'] = averageRating;
//     return data;
//   }
// }

// class AllTruckInMapModel {
// /*
// {
//   "status": true,
//   "message": "Drivers found successfully.",
//   "data": [
//     {
//       "id": 1,
//       "first_name": "Driver",
//       "last_name": "Truck",
//       "image": null,
//       "email": "driver@yopmail.com",
//       "email_verified_at": null,
//       "phone_number": "3035025432",
//       "phone_number_verified_at": null,
//       "password": "$2a$12$AOHYvUf1i/ZmahmrJfys.OSfkeqhs.nl1un0O1ycpeb8jr6fa.IB2",
//       "dl_number": "us2323",
//       "latitude": "26.850614",
//       "longitude": "75.761648",
//       "status": "Active",
//       "remember_token": null,
//       "created_at": "2023-08-18 10:51:54",
//       "updated_at": "2023-09-05 05:44:40",
//       "deleted_at": null,
//       "distance": 0.0014890019666789892,
//       "average_rating": 4
//     }
//   ]
// } 
// */

//   bool? status;
//   String? message;
//   List<AllTruckInMapModelData>? data;

//   AllTruckInMapModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//   AllTruckInMapModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message']?.toString();
//   if (json['data'] != null) {
//   final v = json['data'];
//   final arr0 = <AllTruckInMapModelData>[];
//   v.forEach((v) {
//   arr0.add(AllTruckInMapModelData.fromJson(v));
//   });
//     this.data = arr0;
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
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



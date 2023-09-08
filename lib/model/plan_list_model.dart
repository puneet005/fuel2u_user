
class PlanListModelDataFeatures {

  int? id;
  int? planId;
  String? name;
  String? createdAt;
  String? updatedAt;

  PlanListModelDataFeatures({
    this.id,
    this.planId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });
  PlanListModelDataFeatures.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    planId = json['plan_id']?.toInt();
    name = json['name']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['plan_id'] = planId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PlanListModelData {
/*
{
  "id": 1,
  "name": "Pay as You Go",
  "monthly_fee": 0,
  "delivery_fee": 25,
  "cancel_fee": 0,
  "created_at": "2023-08-21 05:57:45",
  "updated_at": "2023-08-21 05:57:45",
  "features": [
    {
      "id": 1,
      "plan_id": 1,
      "name": "No Monthly Fee",
      "created_at": "2023-08-25 15:56:42",
      "updated_at": "2023-08-25 15:56:42"
    }
  ]
} 
*/

  int? id;
  String? name;
  int? monthlyFee;
  int? deliveryFee;
  int? cancelFee;
  String? createdAt;
  String? updatedAt;
  List<PlanListModelDataFeatures>? features;

  PlanListModelData({
    this.id,
    this.name,
    this.monthlyFee,
    this.deliveryFee,
    this.cancelFee,
    this.createdAt,
    this.updatedAt,
    this.features,
  });
  PlanListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    monthlyFee = json['monthly_fee']?.toInt();
    deliveryFee = json['delivery_fee']?.toInt();
    cancelFee = json['cancel_fee']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  if (json['features'] != null) {
  final v = json['features'];
  final arr0 = <PlanListModelDataFeatures>[];
  v.forEach((v) {
  arr0.add(PlanListModelDataFeatures.fromJson(v));
  });
    features = arr0;
    }
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
    if (features != null) {
      final v = features;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v.toJson());
  });
      data['features'] = arr0;
    }
    return data;
  }
}

class PlanListModel {
  bool? status;
  String? message;
  List<PlanListModelData>? data;

  PlanListModel({
    this.status,
    this.message,
    this.data,
  });
  PlanListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <PlanListModelData>[];
  v.forEach((v) {
  arr0.add(PlanListModelData.fromJson(v));
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

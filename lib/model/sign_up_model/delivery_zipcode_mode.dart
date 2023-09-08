class DeliveryZipcodeModel {
/*
{
  "status": true,
  "message": "2U Fuel is not in your area yet.",
  "data": false
} 
*/

  bool? status;
  String? message;
  bool? data;

  DeliveryZipcodeModel({
    this.status,
    this.message,
    this.data,
  });
  DeliveryZipcodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = json['data'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}

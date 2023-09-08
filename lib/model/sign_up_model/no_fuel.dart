class NoFuelModel {
/*
{
  "status": true,
  "message": "2U Fuel notify you when fuel is available in your area."
} 
*/

  bool? status;
  String? message;

  NoFuelModel({
    this.status,
    this.message,
  });
  NoFuelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
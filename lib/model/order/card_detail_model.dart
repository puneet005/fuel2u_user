
class CardDetailModelDataMetadata {
  String? name;
  CardDetailModelDataMetadata({
    this.name,
  });
  CardDetailModelDataMetadata.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class CardDetailModelDataCardThreeDSecureUsage {
  bool? supported;

  CardDetailModelDataCardThreeDSecureUsage({
    this.supported,
  });
  CardDetailModelDataCardThreeDSecureUsage.fromJson(Map<String, dynamic> json) {
    supported = json['supported'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['supported'] = supported;
    return data;
  }
}

class CardDetailModelDataCardNetworks {
  List<String?>? available;
  String? preferred;

  CardDetailModelDataCardNetworks({
    this.available,
    this.preferred,
  });
  CardDetailModelDataCardNetworks.fromJson(Map<String, dynamic> json) {
  if (json['available'] != null) {
  final v = json['available'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    available = arr0;
    }
    preferred = json['preferred']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (available != null) {
      final v = available;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['available'] = arr0;
    }
    data['preferred'] = preferred;
    return data;
  }
}

class CardDetailModelDataCardChecks {
  String? addressLine1Check;
  String? addressPostalCodeCheck;
  String? cvcCheck;

  CardDetailModelDataCardChecks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });
  CardDetailModelDataCardChecks.fromJson(Map<String, dynamic> json) {
    addressLine1Check = json['address_line1_check']?.toString();
    addressPostalCodeCheck = json['address_postal_code_check']?.toString();
    cvcCheck = json['cvc_check']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address_line1_check'] = addressLine1Check;
    data['address_postal_code_check'] = addressPostalCodeCheck;
    data['cvc_check'] = cvcCheck;
    return data;
  }
}

class CardDetailModelDataCard {
  String? brand;
  CardDetailModelDataCardChecks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? generatedFrom;
  String? last4;
  CardDetailModelDataCardNetworks? networks;
  CardDetailModelDataCardThreeDSecureUsage? threeDSecureUsage;
  String? wallet;

  CardDetailModelDataCard({
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.generatedFrom,
    this.last4,
    this.networks,
    this.threeDSecureUsage,
    this.wallet,
  });
  CardDetailModelDataCard.fromJson(Map<String, dynamic> json) {
    brand = json['brand']?.toString();
    checks = (json['checks'] != null) ? CardDetailModelDataCardChecks.fromJson(json['checks']) : null;
    country = json['country']?.toString();
    expMonth = json['exp_month']?.toInt();
    expYear = json['exp_year']?.toInt();
    fingerprint = json['fingerprint']?.toString();
    funding = json['funding']?.toString();
    generatedFrom = json['generated_from']?.toString();
    last4 = json['last4']?.toString();
    networks = (json['networks'] != null) ? CardDetailModelDataCardNetworks.fromJson(json['networks']) : null;
    threeDSecureUsage = (json['three_d_secure_usage'] != null) ? CardDetailModelDataCardThreeDSecureUsage.fromJson(json['three_d_secure_usage']) : null;
    wallet = json['wallet']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brand'] = brand;
    if (checks != null) {
      data['checks'] = checks!.toJson();
    }
    data['country'] = country;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['fingerprint'] = fingerprint;
    data['funding'] = funding;
    data['generated_from'] = generatedFrom;
    data['last4'] = last4;
    if (networks != null) {
      data['networks'] = networks!.toJson();
    }
    if (threeDSecureUsage != null) {
      data['three_d_secure_usage'] = threeDSecureUsage!.toJson();
    }
    data['wallet'] = wallet;
    return data;
  }
}

class CardDetailModelDataBillingDetailsAddress {
  String? city;
  String? country;
  String? line1;
  String? line2;
  String? postalCode;
  String? state;

  CardDetailModelDataBillingDetailsAddress({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
  });
  CardDetailModelDataBillingDetailsAddress.fromJson(Map<String, dynamic> json) {
    city = json['city']?.toString();
    country = json['country']?.toString();
    line1 = json['line1']?.toString();
    line2 = json['line2']?.toString();
    postalCode = json['postal_code']?.toString();
    state = json['state']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city'] = city;
    data['country'] = country;
    data['line1'] = line1;
    data['line2'] = line2;
    data['postal_code'] = postalCode;
    data['state'] = state;
    return data;
  }
}

class CardDetailModelDataBillingDetails {
/*
{
  "address": {
    "city": null,
    "country": null,
    "line1": null,
    "line2": null,
    "postal_code": "90210",
    "state": null
  },
  "email": null,
  "name": null,
  "phone": null
} 
*/

  CardDetailModelDataBillingDetailsAddress? address;
  String? email;
  String? name;
  String? phone;

  CardDetailModelDataBillingDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
  });
  CardDetailModelDataBillingDetails.fromJson(Map<String, dynamic> json) {
    address = (json['address'] != null) ? CardDetailModelDataBillingDetailsAddress.fromJson(json['address']) : null;
    email = json['email']?.toString();
    name = json['name']?.toString();
    phone = json['phone']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class CardDetailModelData {
  String? id;
  String? object;
  CardDetailModelDataBillingDetails? billingDetails;
  CardDetailModelDataCard? card;
  int? created;
  String? customer;
  bool? livemode;
  CardDetailModelDataMetadata? metadata;
  String? type;

  CardDetailModelData({
    this.id,
    this.object,
    this.billingDetails,
    this.card,
    this.created,
    this.customer,
    this.livemode,
    this.metadata,
    this.type,
  });
  CardDetailModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    object = json['object']?.toString();
    billingDetails = (json['billing_details'] != null) ? CardDetailModelDataBillingDetails.fromJson(json['billing_details']) : null;
    card = (json['card'] != null) ? CardDetailModelDataCard.fromJson(json['card']) : null;
    created = json['created']?.toInt();
    customer = json['customer']?.toString();
    livemode = json['livemode'];
    metadata = (json['metadata'] != null) ? CardDetailModelDataMetadata.fromJson(json['metadata']) : null;
    type = json['type']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    if (billingDetails != null) {
      data['billing_details'] = billingDetails!.toJson();
    }
    if (card != null) {
      data['card'] = card!.toJson();
    }
    data['created'] = created;
    data['customer'] = customer;
    data['livemode'] = livemode;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class CardDetailModel {
/*
{
  "status": true,
  "message": "Payment methods found successfully.",
  "data": [
    {
      "id": "pm_1Npks7DbCQcF6xccU2XRR255",
      "object": "payment_method",
      "billing_details": {
        "address": {
          "city": null,
          "country": null,
          "line1": null,
          "line2": null,
          "postal_code": "90210",
          "state": null
        },
        "email": null,
        "name": null,
        "phone": null
      },
      "card": {
        "brand": "visa",
        "checks": {
          "address_line1_check": null,
          "address_postal_code_check": "pass",
          "cvc_check": "pass"
        },
        "country": "US",
        "exp_month": 2,
        "exp_year": 2042,
        "fingerprint": "RTq4Zi2THVggJflJ",
        "funding": "credit",
        "generated_from": null,
        "last4": "4242",
        "networks": {
          "available": [
            "visa"
          ],
          "preferred": null
        },
        "three_d_secure_usage": {
          "supported": true
        },
        "wallet": null
      },
      "created": 1694580015,
      "customer": "cus_OcfBtv3XcXxndk",
      "livemode": false,
      "metadata": {
        "name": "My Card 2"
      },
      "type": "card"
    }
  ]
} 
*/

  bool? status;
  String? message;
  List<CardDetailModelData>? data;

  CardDetailModel({
    this.status,
    this.message,
    this.data,
  });
  CardDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <CardDetailModelData>[];
  v.forEach((v) {
  arr0.add(CardDetailModelData.fromJson(v));
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

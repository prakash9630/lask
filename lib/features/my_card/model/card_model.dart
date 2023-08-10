class CardModel {
  CardList? cardList;

  CardModel({this.cardList});

  CardModel.fromJson(Map<String, dynamic> json) {
    cardList =
    json['card_list'] != null ? CardList.fromJson(json['card_list']) : null;
  }
}

class CardList {
  String? object;
  List<CardDetail>? data;
  bool? hasMore;
  String? url;

  CardList({this.object, this.data, this.hasMore, this.url});

  CardList.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    if (json['data'] != null) {
      data = <CardDetail>[];
      json['data'].forEach((v) {
        data!.add(CardDetail.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    url = json['url'];
  }

}

class CardDetail {
  String? id;
  String? object;
  BillingDetails? billingDetails;
  Card? card;
  int? created;
  String? customer;
  bool? livemode;
  String? type;

  CardDetail(
      {this.id, this.object, this.billingDetails, this.card, this.created, this.customer, this.livemode, this.type});

  CardDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    billingDetails =
    json['billing_details'] != null ? BillingDetails.fromJson(
        json['billing_details']) : null;
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
    created = json['created'];
    customer = json['customer'];
    livemode = json['livemode'];
    type = json['type'];
  }

}

class BillingDetails {
  Address? address;
  String? email;
  String? name;
  String? phone;

  BillingDetails({this.address, this.email, this.name, this.phone});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }

}

class Address {
  void city;
  void country;
  void line1;
  void line2;
  void postalCode;
  void state;

  Address(
      {this.city, this.country, this.line1, this.line2, this.postalCode, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    line1 = json['line1'];
    line2 = json['line2'];
    postalCode = json['postal_code'];
    state = json['state'];
  }
}

class Card {
  String? brand;
  Checks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  void generatedFrom;
  String? last4;
  Networks? networks;
  ThreeDSecureUsage? threeDSecureUsage;
  void wallet;

  Card(
      {this.brand, this.checks, this.country, this.expMonth, this.expYear, this.fingerprint, this.funding, this.generatedFrom, this.last4, this.networks, this.threeDSecureUsage, this.wallet});

  Card.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    checks =
    json['checks'] != null ? Checks.fromJson(json['checks']) : null;
    country = json['country'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    fingerprint = json['fingerprint'];
    funding = json['funding'];
    generatedFrom = json['generated_from'];
    last4 = json['last4'];
    networks =
    json['networks'] != null ? Networks.fromJson(json['networks']) : null;
    threeDSecureUsage =
    json['three_d_secure_usage'] != null ? ThreeDSecureUsage.fromJson(
        json['three_d_secure_usage']) : null;
    wallet = json['wallet'];
  }
}

class Checks {
  dynamic addressLine1Check;
  dynamic addressPostalCodeCheck;
  dynamic cvcCheck;

  Checks({this.addressLine1Check, this.addressPostalCodeCheck, this.cvcCheck});

  Checks.fromJson(Map<String, dynamic> json) {
    addressLine1Check = json['address_line1_check'];
    addressPostalCodeCheck = json['address_postal_code_check'];
    cvcCheck = json['cvc_check'];
  }
}

class Networks {
  List<String>? available;
  dynamic preferred;

  Networks({this.available, this.preferred});

  Networks.fromJson(Map<String, dynamic> json) {
    available = json['available'].cast<String>();
    preferred = json['preferred'];
  }
}

class ThreeDSecureUsage {
  bool? supported;

  ThreeDSecureUsage({this.supported});

  ThreeDSecureUsage.fromJson(Map<String, dynamic> json) {
    supported = json['supported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supported'] = supported;
    return data;
  }
}

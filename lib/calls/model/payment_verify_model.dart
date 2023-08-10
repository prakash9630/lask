class PaymentVerifyModel {
  bool? verified;
  String? tariff;
  int? tariffId;
  double? duration;
  double? onHoldAllowedMin;

  PaymentVerifyModel(
      {this.verified, this.tariff, this.duration, this.onHoldAllowedMin,this.tariffId});

  PaymentVerifyModel.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    tariff = json['tariff'];
    tariffId= json['tariff_id'];
    duration = json['duration'];
    onHoldAllowedMin = json['on_hold_allowed_min'];
  }

}
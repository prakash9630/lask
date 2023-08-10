class VoucherModel {
  int? count;
  String? next;
  String? previous;
  List<Vouchers>? vouchers;

  VoucherModel({this.count, this.next, this.previous, this.vouchers});

  VoucherModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      vouchers = <Vouchers>[];
      json['results'].forEach((v) {
        vouchers!.add(Vouchers.fromJson(v));
      });
    }
  }
}

class Vouchers {
  int? id;
  String? name;
  double? maxDuration;
  String? expiryDate;
  bool? isUsed;

  Vouchers({this.id, this.name, this.maxDuration, this.expiryDate, this.isUsed});

  Vouchers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    maxDuration = json['max_duration'];
    expiryDate = json['expiry_date'];
    isUsed = json['is_used'];
  }

}
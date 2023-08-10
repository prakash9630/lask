
import '../../home_page/model/hompage_model.dart';

class InvoiceModel {
  int? count;
  String? next;
  String? previous;
  List<Invoices>? invoices;

  InvoiceModel({this.count, this.next, this.previous, this.invoices});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];

    if (json['results'] != null) {
      invoices = <Invoices>[];
      json['results'].forEach((v) {
        invoices!.add(Invoices.fromJson(v));
      });
    }
  }
}

class Invoices {
  int? id;
  String? referenceNumber;
  num? amount;
  Call? call;
  bool? isPaid;
  TariffData? tariffData;
  String? file;


  Invoices({this.id, this.referenceNumber, this.amount, this.call,this.file, this.isPaid,this.tariffData});

  Invoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNumber = json['reference_number'];
    file= json['file'];
    amount = json['amount'];
    tariffData = json['tariff_data']!=null?TariffData.fromData(json['tariff_data']):null;
    call = json['call'] != null ? Call.fromJson(json['call']) : null;
    isPaid = json['is_paid'];
  }
}

class Call {
  int? id;
  String? callStatus;
  String? service;
  num? duration;
  Lawyer? lawyer;
  String? createdAt;

  Call(
      {this.id,
        this.callStatus,
        this.service,
        this.duration,
        this.lawyer,
        this.createdAt});

  Call.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    callStatus = json['call_status'];
    service = json['service'];
    duration = json['duration'];
    lawyer =
    json['lawyer'] != null ? Lawyer.fromJson(json['lawyer']) : null;
    createdAt = json['created_at'];
  }
}

class TariffData{
  int? tariffId;
  String? tariffName;
  double? tariffPrice;
  TariffData({this.tariffId,this.tariffName,this.tariffPrice});
  TariffData.fromData(Map<String,dynamic> map){
    tariffId= map['tariff_id'];
    tariffName= map['tariff_name'];
    tariffPrice= map['tariff_price'];
  }
}
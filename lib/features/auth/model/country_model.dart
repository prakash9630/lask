
class CountryModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Countries>? countries;

  CountryModel({this.count, this.next, this.previous, this.countries});

  CountryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      countries = <Countries>[];
      json['results'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

}

class Countries {
  int? id;
  String? name;
  dynamic code;
  dynamic phoneCode;
  Countries({this.name, this.code, this.phoneCode,this.id});

  Countries.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name = json['name'];
    code = json['code'];
    phoneCode = json['phone_code'];
  }

}


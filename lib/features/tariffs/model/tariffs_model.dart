
class TariffsModel {
  int? count;
  String? next;
  String? previous;
  List<Tariffs>? tariffs;
  TariffsModel({this.count, this.next, this.previous, this.tariffs});

  TariffsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      tariffs = <Tariffs>[];
      json['results'].forEach((v) {
        tariffs!.add(Tariffs.fromJson(v));
      });
    }
  }

}

class Tariffs {
  int? id;
  String? name;
  String? image;
  String? description;
  double? price;
  double? minMinutes;
  double? maxMinutes;
  double? onHoldMinutes;


  Tariffs({this.id, this.name, this.image, this.description});

  Tariffs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    minMinutes = json['min_minutes'];
    maxMinutes = json['max_minutes'];
    onHoldMinutes = json['on_hold_allowed_min'];
  }
}
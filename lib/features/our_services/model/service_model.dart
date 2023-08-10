
class ServiceModel {
  int? count;
  String? next;
  String? previous;
  List<Services>? services;

  ServiceModel({this.count, this.next, this.previous, this.services});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      services = <Services>[];
      json['results'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

}

class Services {
  int? id;
  String? name;
  String? image;
  String? description;

  Services({this.id, this.name, this.image, this.description});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

}
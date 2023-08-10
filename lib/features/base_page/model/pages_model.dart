
class PagesModel {
  int? count;
  String? next;
  String? previous;
  List<Pages>? pages;


  PagesModel({this.count, this.next, this.previous, this.pages});

  PagesModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      pages = <Pages>[];
      json['results'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
  }
}

class Pages {
  int? id;
  String? title;
  String? image;
  String? description;
  String? icon;
  List<InfoPageImage>? infoPageImage;

  Pages({this.id, this.title, this.image, this.description,this.icon,this.infoPageImage});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    icon = json['icon'];
    description = json['description'];
    if (json['info_page_image'] != null) {
      infoPageImage = <InfoPageImage>[];
      json['info_page_image'].forEach((v) {
        infoPageImage!.add(InfoPageImage.fromJson(v));
      });
    }
  }
}

class InfoPageImage{
int? id;
String? image;
InfoPageImage({this.id,this.image});
InfoPageImage.fromJson(Map<String,dynamic> json){
  id=json['id'];
  image=json['image'];
}
}

class AboutUsModel{
  int? id;
  String? title;
  String? backgroundImage;
  String? content;
  List<Images>? images;

  AboutUsModel({this.id,this.title,this.backgroundImage,this.content,this.images});

  AboutUsModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    backgroundImage=json['background_image'];
    content=json['content'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

}

class Images{
  int? id;
  String? image;

  Images({this.id,this.image});
  Images.fromJson(Map<String,dynamic> json){
    id=json['id'];
    image=json['image'];
  }
}
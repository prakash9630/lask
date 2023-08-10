class ForgotPassModel {
  int? id;
  String? email;
  String? key;

  ForgotPassModel({this.id, this.email, this.key});

  ForgotPassModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['key'] = key;
    return data;
  }
}
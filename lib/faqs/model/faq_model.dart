
class FaqModel {
  int? count;
  String? next;
  String? previous;
  List<Faqs>? faqs;

  FaqModel({this.count, this.next, this.previous, this.faqs});

  FaqModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      faqs = <Faqs>[];
      json['results'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
  }

}

class Faqs {
  int? id;
  String? question;
  String? answer;
  Faqs({this.id, this.question, this.answer});

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

}
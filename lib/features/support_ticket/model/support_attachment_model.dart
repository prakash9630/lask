class SupportAttachmentModel {
  int id;
  String file;

  SupportAttachmentModel({
    required this.id,
    required this.file,
  });

  factory SupportAttachmentModel.fromJson(Map<String, dynamic> json) =>
      SupportAttachmentModel(
        id: json["id"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
      };
}

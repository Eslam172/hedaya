class AzkarDetaislModel {
  int? sectionId;
  int? count;
  String? description;
  String? reference;
  String? content;

  AzkarDetaislModel(this.sectionId, this.count, this.description, this.content,
      this.reference);

  AzkarDetaislModel.fromJson(Map<String, dynamic> json) {
    sectionId = json["section_id"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }
}
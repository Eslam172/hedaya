class HadithDetailsModel {
  int? sectionId;
  int? count;
  String? description;
  String? reference;
  String? content;

  HadithDetailsModel(this.sectionId, this.count, this.description, this.content,
      this.reference);

  HadithDetailsModel.fromJson(Map<String, dynamic> json) {
    sectionId = json["section_id"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }
}
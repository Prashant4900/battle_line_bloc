class CategoriesModel {
  CategoriesModel({this.id, this.name});
  final int? id;
  final String? name;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

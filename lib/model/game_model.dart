import 'dart:convert';

class GameModel {
  GameModel({
    this.id,
    this.name,
    this.description,
    this.slug,
    this.plateform,
    this.fullName,
    this.image,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? slug;
  final String? plateform;
  final String? fullName;
  final String? image;
  // final String? poster;
  // final List? gameStudios;

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json["id"],
      name: json["name"],
      fullName: json["fullName"],
      slug: json["slug"],
      description: json["description"],
      plateform: json["plateform"],
      image: json["image"]["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullName": fullName,
        "slug": slug,
        "description": description,
        "plateform": plateform,
        "image": image,
      };
}

List<GameModel> gameFromJson(String str) => List<GameModel>.from(json.decode(str).map((x) => GameModel.fromJson(x)));

String gameToJson(List<GameModel> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

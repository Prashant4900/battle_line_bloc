import 'dart:convert';

class GameBannerModel {
  GameBannerModel({
    this.id,
    this.gameId,
    this.gameName,
    this.gameSlug,
    this.gamePlateform,
    this.image,
    this.sImage,
    this.mImage,
    this.tImage,
  });
  int? id;
  int? gameId;
  String? gameName;
  String? gameSlug;
  String? gamePlateform;
  String? image;
  String? sImage;
  String? mImage;
  String? tImage;

  factory GameBannerModel.fromJson(Map<String, dynamic> json) {
    return GameBannerModel(
      id: json["id"],
      gameId: json["game"]["id"],
      gameName: json["game"]["name"],
      gameSlug: json["game"]["slug"],
      gamePlateform: json["game"]["plateform"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "gameId": gameId,
        "gameName": gameName,
        "gameSlug": gameSlug,
        "gamePlateform": gamePlateform,
      };

  factory GameBannerModel.initialData() {
    return GameBannerModel(
      id: null,
      gameId: null,
      gameName: null,
      gameSlug: null,
      gamePlateform: null,
    );
  }
}

List<GameBannerModel> gameBannerFromJson(String str) =>
    List<GameBannerModel>.from(json.decode(str).map((x) => GameBannerModel.fromJson(x)));

String gameBannerToJson(List<GameBannerModel> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

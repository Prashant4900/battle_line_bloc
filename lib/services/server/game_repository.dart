import 'package:battle_line/constant/api_route.dart';
import 'package:battle_line/model/game_model.dart';
import 'package:battle_line/services/api/base_api.dart';

abstract class GameRepo {
  Future<List<GameModel>> getGameList();
}

class GameServices implements GameRepo {
  ApiBaseHelper _helper = ApiBaseHelper();
  @override
  Future<List<GameModel>> getGameList() async {
    try {
      final responce = await _helper.get(ApiRoute.gamesApi) as List;
      var _games = responce.map<GameModel>((e) => GameModel.fromJson(e)).toList();
      return _games;
    } catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }
}

import 'package:battle_line/constant/api_route.dart';
import 'package:battle_line/model/game_banner_model.dart';
import 'package:battle_line/services/api/base_api.dart';

abstract class BannerRepository {
  Future<List<GameBannerModel>> getGameBannerList();
}

class GameBannerServices implements BannerRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  @override
  Future<List<GameBannerModel>> getGameBannerList() async {
    final response = await _helper.get(ApiRoute.gameBannerApi) as List;
    var _banner = response.map<GameBannerModel>((json) => GameBannerModel.fromJson(json)).toList();
    return _banner;
  }
}

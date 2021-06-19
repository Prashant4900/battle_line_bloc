import 'dart:io';

import 'package:battle_line/bloc/banners/banners_event.dart';
import 'package:battle_line/bloc/banners/banners_state.dart';
import 'package:battle_line/model/game_banner_model.dart';
import 'package:battle_line/services/api/http_exceptions.dart';
import 'package:battle_line/services/server/banner_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameBannersBloc extends Bloc<GameBannersEvent, GameBannersState> {
  GameBannersBloc({this.bannerRepository}) : super(GameBannersInitial());

  final BannerRepository? bannerRepository;
  List<GameBannerModel>? gameBannerModel;

  @override
  Stream<GameBannersState> mapEventToState(GameBannersEvent event) async* {
    switch (event) {
      case GameBannersEvent.fetchGameBanners:
        yield GameBannersLoading();
        try {
          gameBannerModel = await bannerRepository!.getGameBannerList();
          yield GameBannersLoaded(gameBannersModel: gameBannerModel);
        } on SocketException {
          yield GameBannersListingError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield GameBannersListingError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield GameBannersListingError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield GameBannersListingError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}

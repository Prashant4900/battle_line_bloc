import 'dart:io';

import 'package:battle_line/bloc/games/games_event.dart';
import 'package:battle_line/bloc/games/games_state.dart';
import 'package:battle_line/model/game_model.dart';
import 'package:battle_line/services/api/http_exceptions.dart';
import 'package:battle_line/services/server/game_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameBloc extends Bloc<GamesEvent, GamesState> {
  GameBloc({this.gameRepo}) : super(GamesInitial());
  final GameRepo? gameRepo;
  List<GameModel>? gameModel;
  @override
  Stream<GamesState> mapEventToState(event) async* {
    switch (event) {
      case GamesEvent.fetchGames:
        yield GamesLoading();
        try {
          gameModel = await gameRepo!.getGameList();
          yield GamesLoaded(gamesModel: gameModel);
        } on SocketException {
          yield GamesListingError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield GamesListingError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield GamesListingError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield GamesListingError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}

import 'package:battle_line/model/game_model.dart';
import 'package:equatable/equatable.dart';

abstract class GamesState extends Equatable {
  @override
  List<Object> get props => [];
}

class GamesInitial extends GamesState {}

class GamesLoading extends GamesState {}

class GamesLoaded extends GamesState {
  final List<GameModel>? gamesModel;
  GamesLoaded({required this.gamesModel});
}

class GamesListingError extends GamesState {
  final error;
  GamesListingError({this.error});
}

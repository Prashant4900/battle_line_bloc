import 'package:battle_line/model/game_banner_model.dart';
import 'package:equatable/equatable.dart';

abstract class GameBannersState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameBannersInitial extends GameBannersState {}

class GameBannersLoading extends GameBannersState {}

class GameBannersLoaded extends GameBannersState {
  final List<GameBannerModel>? gameBannersModel;
  GameBannersLoaded({required this.gameBannersModel});
}

class GameBannersListingError extends GameBannersState {
  final error;
  GameBannersListingError({this.error});
}

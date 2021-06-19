import 'package:battle_line/bloc/banners/banners_bloc.dart';
import 'package:battle_line/bloc/banners/banners_event.dart';
import 'package:battle_line/bloc/banners/banners_state.dart';
import 'package:battle_line/bloc/games/games_bloc.dart';
import 'package:battle_line/bloc/games/games_event.dart';
import 'package:battle_line/bloc/games/games_state.dart';
import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/model/game_banner_model.dart';
import 'package:battle_line/model/game_model.dart';
import 'package:battle_line/view/screens/home/widget/banner.dart';
import 'package:battle_line/view/screens/home/widget/game_card.dart';
import 'package:battle_line/view/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:battle_line/view/screens/error/error_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadBanner();
    _loadGame();
  }

  _loadBanner() async {
    BlocProvider.of<GameBannersBloc>(context).add(GameBannersEvent.fetchGameBanners);
  }

  _loadGame() async {
    BlocProvider.of<GameBloc>(context).add(GamesEvent.fetchGames);
  }

  @override
  Widget build(BuildContext context) {
    MyTextStyle _textStyle = MyTextStyle();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHeight),
          child: MyAppBarWidet(textTitle1: "Battle", textTitle2: 'Line'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Card==============================================================================
              Container(
                height: 150,
                width: double.infinity,
                child: BlocBuilder<GameBannersBloc, GameBannersState>(
                  builder: (BuildContext context, GameBannersState state) {
                    if (state is GameBannersListingError) {
                      final error = state.error;
                      String message = '${error.message}\nTap to Retry.';
                      return Error(
                        errorMessage: message,
                        onRetryPressed: () => _loadBanner(),
                      );
                    }
                    if (state is GameBannersLoaded) {
                      List<GameBannerModel>? games = state.gameBannersModel;
                      return BannerWidget(data: games);
                    }
                    return BannerLoadingWidget();
                  },
                ),
              ),

              // Games Card==============================================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text('Games', style: _textStyle.labelText(context)),
              ),
           
              Container(
                height: 160,
                child: BlocBuilder<GameBloc, GamesState>(
                  builder: (BuildContext context, GamesState state) {
                    if (state is GamesListingError) {
                      final error = state.error;
                      String message = '${error.message}\nTap to Retry.';
                      return Error(
                        errorMessage: message,
                        onRetryPressed: _loadGame(),
                      );
                    }
                    if (state is GamesLoaded) {
                      List<GameModel>? games = state.gamesModel;
                      print(games);
                      return GameCardWidget(data: games);
                    }
                    return GameLoadingCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

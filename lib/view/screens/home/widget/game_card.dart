import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/model/game_model.dart';
import 'package:battle_line/utils/glow_behavior.dart';
import 'package:flutter/material.dart';

class GameCardWidget extends StatelessWidget {
  const GameCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<GameModel>? data;

  @override
  Widget build(BuildContext context) {
    MyTextStyle _style = MyTextStyle();
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: Container(
        height: 170,
        child: ListView.builder(
          itemCount: data!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 115,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: MyColors.reddishColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: Image.network(
                      data![index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    data![index].name!,
                    textAlign: TextAlign.center,
                    style: _style.bodyLargeText(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class GameLoadingCardWidget extends StatelessWidget {
  const GameLoadingCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: Container(
        height: 170,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 115,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: MyColors.reddishColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

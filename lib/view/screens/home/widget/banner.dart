import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/model/game_banner_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<GameBannerModel?>? data;

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int? _currentIndex;
  @override
  Widget build(BuildContext context) {
    MyTextStyle _textStyle = MyTextStyle();

    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: .9,
              onPageChanged: (index, reason) => setState(() => _currentIndex = index),
            ),
            itemCount: widget.data!.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: MyColors.reddishColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data![index]!.gameName!,
                          style: _textStyle.labelText(context),
                        ),
                        vSizedBox,
                        Text(
                          "First Come Reward",
                          style: _textStyle.bodyText(context)!.copyWith(),
                        ),
                        vSizedBox2,
                        Text(
                          "Join Now >",
                          style: _textStyle.bodyText(context)!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/fortnite-min.png",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 25,
          child: ListView.builder(
            itemCount: widget.data!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? MyColors.textColor : Colors.green,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class BannerLoadingWidget extends StatelessWidget {
  const BannerLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/model/products_model.dart';
import 'package:battle_line/utils/string_formater.dart';
import 'package:battle_line/utils/url_luncher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyProductsDetailPage extends StatefulWidget {
  const MyProductsDetailPage({Key? key}) : super(key: key);

  @override
  _MyProductsDetailPageState createState() => _MyProductsDetailPageState();
}

class _MyProductsDetailPageState extends State<MyProductsDetailPage> {
  bool _productsTextLength = false;
  bool _brandTextLength = false;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    MyTextStyle _style = MyTextStyle();

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.network(product.hImage!, fit: BoxFit.fill),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Icon(Icons.bookmark_outline),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                vSizedBox,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(product.title!),
                        style: _style.labelMediumText(context),
                      ),
                      vSizedBox,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_productsTextLength == false) {
                              _productsTextLength = true;
                            } else {
                              _productsTextLength = false;
                            }
                          });
                        },
                        child: Text(
                          capitalize(product.description!),
                          maxLines: _productsTextLength ? 50 : 6,
                          overflow: TextOverflow.ellipsis,
                          style: _style.bodyText(context)!.copyWith(color: MyColors.textColor),
                        ),
                      ),
                      vSizedBox1,
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: MyColors.kClipColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          capitalize(product.categoriesName!),
                          style: _style.bodyLargeText(context)!.copyWith(color: MyColors.textColor),
                        ),
                      ),
                      vSizedBox1,
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: MyColors.kClipColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSizedBox2,
                      Container(
                        height: 200,
                        child: CarouselSlider.builder(
                          itemCount: product.images!.length,
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: .9,
                          ),
                          itemBuilder: (BuildContext context, int index, int realIndex) {
                            final image = product.images![index]["url"];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(image),
                            );
                          },
                        ),
                      ),
                      vSizedBox1,
                      Text(
                        capitalize("About ${product.brandName}"),
                        style: _style.labelMediumText(context),
                      ),
                      vSizedBox1,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_brandTextLength == false) {
                              _brandTextLength = true;
                            } else {
                              _brandTextLength = false;
                            }
                          });
                        },
                        child: Text(
                          capitalize(product.brandDescription!),
                          maxLines: _brandTextLength ? 50 : 6,
                          overflow: TextOverflow.ellipsis,
                          style: _style.bodyText(context)!.copyWith(color: MyColors.textColor),
                        ),
                      ),
                      vSizedBox,
                      Container(
                        height: 55,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: MyColors.kBlackColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  capitalize("About Us More!"),
                                  style: _style.bodyLargeText(context),
                                ),
                                Text(
                                  capitalize("More About ${product.brandName}"),
                                  style: _style.xSmallText(context)!.copyWith(color: MyColors.textColor),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => myLuncher(product.brandUrl),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "View More",
                                  style: _style.bodyText(context)!.copyWith(color: MyColors.kBlackColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Text(
                        "Related Products",
                        style: _style.labelMediumText(context),
                      ),
                      vSizedBox2,
                      vSizedBox4,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

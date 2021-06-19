import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/model/products_model.dart';
import 'package:battle_line/routes/move.dart';
import 'package:battle_line/utils/string_formater.dart';
import 'package:battle_line/view/screens/store/products_detail_page.dart';
import 'package:flutter/material.dart';

class ProductsCardWidget extends StatelessWidget {
  const ProductsCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ProductModel?>? data;

  @override
  Widget build(BuildContext context) {
    MyTextStyle _style = MyTextStyle();
    return GridView.builder(
      itemCount: data!.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: .62,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: MyColors.kCardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox,
              Expanded(
                child: InkWell(
                  onTap: () {
                    moveTo(
                      context,
                      screen: MyProductsDetailPage(),
                      arguments: data![index],
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        data![index]!.hImage!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              vSizedBox1,
              Text(
                capitalize(data![index]!.title!),
                style: _style.bodyLargeText(context),
              ),
              vSizedBox1,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: MyColors.kClipColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(capitalize(data![index]!.categoriesName!), style: _style.smallText(context)),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: MyColors.kClipColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.bookmark_border),
                    ),
                  ],
                ),
              ),
              vSizedBox,
            ],
          ),
        );
      },
    );
  }
}

class ProductsCardLoadingWidget extends StatelessWidget {
  const ProductsCardLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: .62,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: MyColors.kCardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

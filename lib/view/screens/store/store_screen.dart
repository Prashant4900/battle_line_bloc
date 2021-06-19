import 'package:battle_line/bloc/products/products_bloc.dart';
import 'package:battle_line/bloc/products/products_event.dart';
import 'package:battle_line/bloc/products/products_state.dart';
import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/model/products_model.dart';
import 'package:battle_line/utils/glow_behavior.dart';
import 'package:battle_line/view/screens/store/widget/products_card.dart';
import 'package:battle_line/view/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:battle_line/view/screens/error/error_message.dart';

class MyStoreScreen extends StatefulWidget {
  const MyStoreScreen({Key? key}) : super(key: key);

  @override
  _MyStoreScreenState createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends State<MyStoreScreen> {
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  _loadProducts() async {
    BlocProvider.of<ProductsBloc>(context).add(ProductsEvent.fetchProducts);
  }

  @override
  Widget build(BuildContext context) {
    MyTextStyle _textStyle = MyTextStyle();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHeight),
          child: MyAppBarWidet(
            textTitle2: "Store",
            action: [
              Icon(LineIcons.shoppingCart, size: 32),
              hSizedBox1,
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 12, left: 8, right: 0),
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Deals Of The Day ====================================================================
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Deals Of The Day", style: _textStyle.labelMediumText(context)),
                  ),
                  Container(
                    height: 180,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 130,
                          height: 180,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: MyColors.reddishColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    ),
                  ),
                  vSizedBox1,

                  // All Products ====================================================================
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Tops Deals", style: _textStyle.labelMediumText(context)),
                  ),

                  BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (BuildContext context, ProductsState state) {
                      if (state is ProductsListingError) {
                        final error = state.error;
                        String message = '${error.message}\nTap to Retry.';
                        return Error(
                          errorMessage: message,
                          onRetryPressed: _loadProducts(),
                        );
                      }
                      if (state is ProductsLoaded) {
                        List<ProductModel>? products = state.productsModel;
                        return ProductsCardWidget(data: products);
                      }

                      return ProductsCardLoadingWidget();
                    },
                  ),
                  vSizedBox2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

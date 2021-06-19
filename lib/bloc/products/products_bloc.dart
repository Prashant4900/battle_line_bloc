import 'dart:io';

import 'package:battle_line/bloc/products/products_event.dart';
import 'package:battle_line/bloc/products/products_state.dart';
import 'package:battle_line/model/products_model.dart';
import 'package:battle_line/services/api/http_exceptions.dart';
import 'package:battle_line/services/server/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({this.productsRepository}) : super(ProductsInitial());

  final ProductsRepository? productsRepository;
  List<ProductModel>? productModel;

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    switch (event) {
      case ProductsEvent.fetchProducts:
        yield ProductsLoading();
        try {
          productModel = await productsRepository!.getProductList();
          yield ProductsLoaded(productsModel: productModel);
        } on SocketException {
          yield ProductsListingError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield ProductsListingError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield ProductsListingError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield ProductsListingError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}

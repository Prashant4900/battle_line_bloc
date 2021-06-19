import 'package:battle_line/constant/api_route.dart';
import 'package:battle_line/model/products_model.dart';
import 'package:battle_line/services/api/base_api.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getProductList();
}

class ProductsServices implements ProductsRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  @override
  Future<List<ProductModel>> getProductList() async {
    final _responce = await _helper.get(ApiRoute.productsApi) as List;
    var _products = _responce.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
    print(_products);
    return _products;
  }
}

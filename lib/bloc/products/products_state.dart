import 'package:battle_line/model/products_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel>? productsModel;
  ProductsLoaded({required this.productsModel});
}

class ProductsListingError extends ProductsState {
  final error;
  ProductsListingError({this.error});
}

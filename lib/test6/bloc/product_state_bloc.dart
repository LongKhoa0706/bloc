 import 'package:demo_bloc/test6/Product.dart';

class ProductState{

}

class ProductStateLoading extends ProductState{}

class ProductStateSuccess extends ProductState{
  final Product product;

  ProductStateSuccess(this.product);
}

class ProductStateFail extends ProductState{

}
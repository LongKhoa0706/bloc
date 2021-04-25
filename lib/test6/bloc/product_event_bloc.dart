import 'package:demo_bloc/test6/Product.dart';

abstract class ProductEvent{}

class ProductEventAddProduct extends ProductEvent{
  final Product product;

  ProductEventAddProduct(this.product);
}
import 'package:demo_bloc/provider/product_database.dart';
import 'package:demo_bloc/test6/Product.dart';
import 'package:demo_bloc/test6/bloc/product_bloc.dart';
import 'package:demo_bloc/test6/bloc/product_event_bloc.dart';
import 'package:flutter/material.dart';

class Test6 extends StatelessWidget {

  ProdcutBloc prodcutBloc = ProdcutBloc();
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Tên đơn hàng"
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: priceController,

            decoration: InputDecoration(
                labelText: "Giá"
            ),
          ),
          RaisedButton(
            onPressed: (){
              print('click');
              Product product = Product(
                name: nameController.text,
                price: priceController.text,
              );
              prodcutBloc.eventController.sink.add(ProductEventAddProduct(product));
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
class Singleton {
  static final Singleton _singleton = new Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}


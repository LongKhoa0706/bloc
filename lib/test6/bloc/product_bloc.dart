import 'dart:async';

import 'package:demo_bloc/provider/product_database.dart';
import 'package:demo_bloc/test6/Product.dart';
import 'package:demo_bloc/test6/bloc/product_event_bloc.dart';
import 'package:demo_bloc/test6/bloc/product_state_bloc.dart';

class ProdcutBloc{
  ProductDatabase productDatabase = ProductDatabase();

  final eventController = StreamController<ProductEvent>();

  final stateControler = StreamController<ProductState>();


  ProdcutBloc(){
    eventController.stream.listen((ProductEvent productEvent) async* {
      print('VO');
      if (productEvent is ProductEventAddProduct) {
        yield ProductStateLoading();
        try{
          productDatabase.addProduct(productEvent.product);
          // state = ProductStateSuccess(productEvent.product);
          print('thanh cong ');
        }catch(e){
          print('THAT BAI ');
        }
      }
      // stateControler.sink.add(state);
    });
  }
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/testloadmore/model/person.dart';
import 'package:demo_bloc/testloadmore/provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(InitialDataState());
  Provider provider = Provider();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    final currentState = state;
    if (event is DataEventFetchData) {
      var _offset = -1;
      yield DataStateLoading();
      List<Person> listPerson =
          await provider.getData(event.offset, event.limit);
      if (listPerson != null && listPerson.isNotEmpty) {
        //khi fetch về có data, thì cần gán lại offset bằng length list để loadmore sẽ biết load từ item mấy.
        _offset = listPerson?.length ?? 0;
      }
      yield DataStateSuccess(listPerson, _offset, event.limit);
    } else if (event is DataEventLoadMoreData) {
      try {
        if (currentState is DataStateSuccess) {
          var _offset = currentState.offset;
          var _limit = currentState.limit;
          var _listAdd = [];

          List<Person> listPerson = await provider.getData(_offset, _limit);

          if (listPerson.isNotEmpty) {
            _offset = listPerson?.length ?? 0; // tương tự loadmore cũng gán lại
            _listAdd = currentState.listPerson + listPerson; // cộng dồn vô thôi
          }
          //đoạn này cần check thêm xem list mới về có data k để handle 1 state khác, hoặc thêm 1 biến boolean để check đã hết data thì không scroll gọi api nữa.
          yield DataStateSuccess(_listAdd, _offset, _limit);
        }
      } catch (e) {
        //err
      }
    }
  }
}

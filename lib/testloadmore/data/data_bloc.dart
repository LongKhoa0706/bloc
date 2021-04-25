import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo_bloc/testloadmore/model/person.dart';
import 'package:demo_bloc/testloadmore/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(InitialDataState());
  Provider provider = Provider();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is DataEventFetchData) {
      yield DataStateLoading();
      List<Person> listPerson = await provider.getData(event.offset,event.limit);
      yield DataStateSuccess(listPerson);
    }
  }
}

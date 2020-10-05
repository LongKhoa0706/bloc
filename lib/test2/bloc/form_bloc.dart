import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormStatee> {
  final Repository _repository = Repository();
  FormBloc() : super(FormInitial());

  @override
  Stream<FormStatee> mapEventToState(
    FormEvent event,
  ) async* {
    if (event is FormEventAuth ) {
      try{
        yield FormStateLoading();
        _repository.auth.register(event.email, event.password);
        yield FormStateSuccess(event.email, event.password);
      }catch(e){
        yield FormStateError(e.toString());
      }
    }
  }
}

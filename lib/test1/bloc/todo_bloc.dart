
import 'package:bloc/bloc.dart';
import 'package:demo_bloc/repositories/repository.dart';
import 'package:demo_bloc/test1/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Repository _repository = Repository();
  List<Todo> _listTodo = List();
  TodoBloc() : super(TodoInitial());



  @override
  Stream<TodoState> mapEventToState(TodoEvent event,
  ) async* {
   try{
     if (event is TodoEvenFetch) {
       yield TodoStateLoading();
       _listTodo = await _repository.todo.fetchDataTodo();
       yield TodoStateFetched(_listTodo);
     }
   }catch(e){
      yield TodoStateError(e.toString());
   }


  }
  List<Todo> get listTodo => _listTodo;
}




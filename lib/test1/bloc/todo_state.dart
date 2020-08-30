part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {
  @override
  String toString() => 'DailyDishInitialized';
}

class TodoStateSuccess extends TodoState {
  final List<Todo> todoList;

  TodoStateSuccess(this.todoList);
}

class TodoStateLoading extends TodoState {
  @override
  String toString() => 'LOADING';
}

class TodoStateError extends TodoState {
  final String error;

  TodoStateError(this.error);

  @override
  String toString() =>
      'ERROR ${error}}';
}

class TodoStateFetched extends TodoState{
  final List<Todo> listTodo;
  TodoStateFetched(this.listTodo);

  @override
  String toString() =>
      'PostSuccess { posts: ${listTodo.length} }';

}


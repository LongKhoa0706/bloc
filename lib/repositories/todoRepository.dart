import 'package:demo_bloc/provider/todoProvider.dart';
import 'package:demo_bloc/test1/todo.dart';

class TodoRepository {
  final TodoProvider todoProvider = TodoProvider();
  Future<List<Todo>>fetchDataTodo() => todoProvider.getListTodo();
}
import 'package:demo_bloc/test1/todo.dart';
import 'dart:io';

import 'package:dio/dio.dart';

class TodoProvider {
  var dio = Dio();

  Future<List<Todo>> getListTodo() async {
    List<Todo> todoList = List();
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var result = await dio.get(url);
    print(result.data);
    print('voo');
    List todo = result.data;
    todoList = todo.map((e) => Todo.fromJson(e)).toList();
    return todoList;
  }
}
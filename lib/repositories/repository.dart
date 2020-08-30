


import 'package:demo_bloc/repositories/todoRepository.dart';

class Repository {
  static final Repository _repository = Repository._();
  Repository._();

  factory Repository() => _repository;

   final TodoRepository todo = TodoRepository();

}
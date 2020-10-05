


import 'package:demo_bloc/provider/authProvider.dart';
import 'package:demo_bloc/provider/databaseProvider.dart';
import 'package:demo_bloc/repositories/staffRepository.dart';
import 'package:demo_bloc/repositories/todoRepository.dart';

class Repository {
  static final Repository _repository = Repository._();
  Repository._();

  factory Repository() => _repository;

   final TodoRepository todo = TodoRepository();
   final AuthProvider auth = AuthProvider();
   final StaffRepository staffRepository = StaffRepository();

}
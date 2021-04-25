import 'package:demo_bloc/testloadmore/model/person.dart';
import 'package:dio/dio.dart';

class Provider{
  Dio dio = Dio();

  Future<List<Person>> getData(int offset,int limit) async {
    List<Person> listPerson = <Person>[];
    final res = await dio.get('https://jsonplaceholder.typicode.com/posts',queryParameters: {
      '_start':offset,
      '_limit':limit,
    });
    List person = res.data;
    listPerson = person.map((e) => Person.fromJson(e)).toList();
    return listPerson;
  }
}
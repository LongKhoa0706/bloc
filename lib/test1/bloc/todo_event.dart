part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent  {

  @override
  String toString() => runtimeType.toString();
}
class
TodoEvenFetch extends TodoEvent {
  @override
  String toString() => 'FetchDailyDish';
}


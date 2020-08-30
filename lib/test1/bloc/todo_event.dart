part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent  {
  TodoEvent([List props = const []]) : super();
  @override
  String toString() => runtimeType.toString();
}
class TodoEvenFetch extends TodoEvent {
  @override
  String toString() => 'FetchDailyDish';
}


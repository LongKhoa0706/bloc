part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterEventIncrement extends CounterEvent{
  final int  increment;

  CounterEventIncrement(this.increment);
}
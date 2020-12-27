part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class InitialCounterState extends CounterState {}

class CounterStateNumber extends CounterState{
  final int counter;

  CounterStateNumber(this.counter);
}
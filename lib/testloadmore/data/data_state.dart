part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class InitialDataState extends DataState {}

class DataStateLoading extends DataState {}

class DataStateSuccess extends DataState{
  final List<Person> listPerson;

  DataStateSuccess(this.listPerson);

}
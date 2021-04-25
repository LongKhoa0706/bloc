part of 'data_bloc.dart';

@immutable
abstract class DataState extends Equatable {

  const DataState();

  @override
  List<Object> get props => [];
}


class InitialDataState extends DataState {}

class DataStateLoading extends DataState {}

class DataStateSuccess extends DataState {
  final List<Person> listPerson;
  final int offset;
  final int limit;

  DataStateSuccess(this.listPerson, this.offset, this.limit);

  @override
  List<Object> get props => [listPerson, offset, limit];
}

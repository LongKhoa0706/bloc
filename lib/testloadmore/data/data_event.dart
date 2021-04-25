part of 'data_bloc.dart';

@immutable
abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class DataEventFetchData extends DataEvent {
  final int offset;
  final int limit;

  DataEventFetchData(this.offset, this.limit);

  @override
  List<Object> get props => [offset, limit];
}

class DataEventLoadMoreData extends DataEvent {}

part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class DataEventFetchData extends DataEvent{
  final int offset;
  final int limit;

  DataEventFetchData(this.offset, this.limit);

}

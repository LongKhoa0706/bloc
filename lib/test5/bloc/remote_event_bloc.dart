abstract class RemoteEvent{}

class RemoteEventIncement extends RemoteEvent{
  final int increment;

  RemoteEventIncement(this.increment);
}

class RemoteEventDecrement extends RemoteEvent{
  final int decrement;

  RemoteEventDecrement(this.decrement);
}
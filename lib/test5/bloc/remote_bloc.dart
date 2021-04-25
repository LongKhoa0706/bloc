import 'dart:async';

import 'package:demo_bloc/test5/bloc/remote_event_bloc.dart';
import 'package:demo_bloc/test5/bloc/remote_state_bloc.dart';

class RemoteBloc{
  var state = RemoteState(20);

  final eventController = StreamController<RemoteEvent>();

  final stateController = StreamController<RemoteState>();

  RemoteBloc(){
    eventController.stream.listen((RemoteEvent remoteEvent) {
      // hamà này nhận event xử lý và cho ra output là state;
      if (remoteEvent is RemoteEventIncement) {
        state = RemoteState(remoteEvent.increment + state.number);
      }
      if (remoteEvent is RemoteEventDecrement) {
        state = RemoteState(remoteEvent.decrement-1);
      }
      // add state mới để bên UI nhận
      stateController.add(state);
    });
  }
}
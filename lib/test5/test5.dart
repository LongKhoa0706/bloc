import 'package:demo_bloc/test5/bloc/remote_bloc.dart';
import 'package:demo_bloc/test5/bloc/remote_event_bloc.dart';
import 'package:demo_bloc/test5/bloc/remote_state_bloc.dart';
import 'package:flutter/material.dart';

class Test5 extends StatefulWidget {
  Test5({Key key}) : super(key: key);

  @override
  _Test5State createState() => _Test5State();
}

class _Test5State extends State<Test5> {
  final remoteBloc = RemoteBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOc"),
      ),
      body: Container(
        child:  Column(
          children: [
            Expanded(
              child: StreamBuilder<RemoteState>(
                initialData: remoteBloc.state,
                stream: remoteBloc.stateController.stream,
                builder: (_,AsyncSnapshot<RemoteState> snapshot){
                  return Text(snapshot.data.number.toString());
                },
              ),
            ),
            RaisedButton(
              onPressed: (){
                remoteBloc.eventController.sink.add(RemoteEventIncement(1));
              },
              child: Text("+"),
            ),
          ],
        ),

      ),
    );
  }
}
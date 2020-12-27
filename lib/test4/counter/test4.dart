import 'package:demo_bloc/test4/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test4 extends StatefulWidget {
  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  CounterBloc counterBloc = CounterBloc();
  @override
  void dispose() {
    counterBloc.close();

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: 200,
        child: Column(
          children: [
           BlocBuilder<CounterBloc,CounterState>(
             cubit: counterBloc,
             builder: (BuildContext ctx,state){
               if (state is CounterStateNumber) {

               }
               if(state is InitialCounterState){

               }
               return Column(
                 children: [
                   Text(state.toString()),
                   RaisedButton(onPressed: (){
                     counterBloc.add(CounterEventIncrement(1));
                    },child: Text('a'),),
                   RaisedButton(onPressed: (){},child: Text('v'),),
                 ],
               );
             },
           )
          ],
        ),
      ),
    );
  }
}

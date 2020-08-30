import 'package:demo_bloc/test1/bloc/todo_bloc.dart';
import 'package:demo_bloc/test1/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoBloc todoBloc = TodoBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: BlocBuilder<TodoBloc,TodoState>(
        cubit: todoBloc,
        builder: (BuildContext context, state) {
          if (state is TodoStateError) {
            return Center(
              child: Text('failed to fetch posts'),
            );
          }
          if (state is TodoStateFetched) {
            print('bbb');
            return ListView.builder(
              itemCount: state.listTodo.length,
              shrinkWrap: true,
              itemBuilder: (_,index){
                Todo todo = state.listTodo[index];
                return ListTile(
                  title: Text(todo.title),
                );
              },
            );
          }
          return Text("ko 1");
        },
      )
    );
  }

  @override
  void dispose() {
    todoBloc.close();
    // TODO: implement dispose
    super.dispose();
  }

}

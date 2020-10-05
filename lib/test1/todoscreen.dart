import 'package:demo_bloc/test1/bloc/todo_bloc.dart';
import 'package:demo_bloc/test1/todo.dart';
import 'package:demo_bloc/test2/test2.dart';
import 'package:demo_bloc/test3/test3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
   TodoBloc todoBloc =TodoBloc();



  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    todoBloc.add(TodoEvenFetch());
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo bloc"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Test2()));
              },
              child: Text("Demo bloc 2 "),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Test3()));
              },
              child: Text("Demo bloc 3 "),
            ),
            Expanded(
              child: BlocBuilder<TodoBloc,TodoState>(
                cubit: todoBloc,
                builder: (BuildContext context, state) {
                  if (state is TodoStateLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is TodoStateError) {
                    return Center(
                      child: Text('failed to fetch posts'),
                    );
                  }
                  if (state is TodoStateFetched) {
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
                  return Text("errr");
                },
              ),
            ),
          ],
        ),
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

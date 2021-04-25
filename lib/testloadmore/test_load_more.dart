import 'package:demo_bloc/testloadmore/data/data_bloc.dart';
import 'package:demo_bloc/testloadmore/model/person.dart';
import 'package:demo_bloc/testloadmore/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestLoadMore extends StatefulWidget {
  @override
  _TestLoadMoreState createState() => _TestLoadMoreState();
}

class _TestLoadMoreState extends State<TestLoadMore> {
  DataBloc dataBloc = DataBloc();
  ScrollController _scrollController = ScrollController();
  int initLoadCount = 10;
  int loadedLastIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBloc.add(DataEventFetchData(loadedLastIndex,initLoadCount));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _getMoreData();
        loadedLastIndex +=initLoadCount;
        initLoadCount +=3;
        dataBloc.add(DataEventFetchData(loadedLastIndex,initLoadCount));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataBloc,DataState>(
        cubit: dataBloc,
        builder: (_,state){
          if (state is DataStateLoading) {
            return CircularProgressIndicator();
          }
          if (state is DataStateSuccess) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.listPerson.length,
              shrinkWrap: true,
              itemBuilder: (_,index){
                Person person = state.listPerson[index];
                return ListTile(
                  title: Text(person.title),
                  leading: Text(person.id.toString()),
                  subtitle: Text(person.body),
                );
              },
            );
          }
          return Text("SAI ROi");
        },
      )
    );
  }
}

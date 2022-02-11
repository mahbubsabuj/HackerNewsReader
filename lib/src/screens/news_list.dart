import 'package:flutter/material.dart';
import '../blocs/stories_bloc.dart';
import 'dart:async';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream:  bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot){
        if(!snapshot.hasData){
          return Text('still fetching');
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context,int index){
            return Text('${snapshot.data[index]}');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News Reader App'),
      ),
      body: buildList(bloc),
    );
  }
}

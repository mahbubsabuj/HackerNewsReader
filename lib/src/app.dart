import 'package:flutter/material.dart';
import '../src/screens/news_list.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News Reader',
        home: NewsList(),
      ),
    );
  }
}

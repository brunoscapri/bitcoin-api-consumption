import 'package:ezfine/blocs/home.bloc.dart';
import 'package:ezfine/themes/main.theme.dart';
import 'package:ezfine/ui/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ezfine',
      theme: mainTheme(),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
      ],
      child: MyApp(),
    );
  }
}

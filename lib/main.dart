import 'package:flutter/material.dart';
import './homepage.dart';
import 'package:provider/provider.dart';
import './provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NewsProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return HomePage();
  }
  /*final ThemeData light = ThemeData(brightness: Brightness.light);
  final ThemeData dark = ThemeData(brightness: Brightness.dark);
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: MaterialApp(
        title: 'News App',
        theme: isDark?dark:light,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }*/
}

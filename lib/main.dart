import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/homepage.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return HomePage();
  }
}

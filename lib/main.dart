import 'package:flutter/material.dart';
import './homepage.dart';
import 'package:provider/provider.dart';import './provider.dart';
void main() {
  runApp(ChangeNotifierProvider(create:(context)=>NewsProvider(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
          child: MaterialApp(
        title: 'News App',
        home: HomePage(),
        
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

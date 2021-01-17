import 'package:flutter/material.dart';
import 'package:news_app/provider.dart';
import 'package:news_app/search_result_page.dart';
import 'package:news_app/splash_screen.dart';
import 'package:provider/provider.dart';
import './listview_builder.dart';
import 'dart:async';
//import 'package:flutter_search_bar/flutter_search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool loadingScreen = true;
bool isDark = false;

class _HomePageState extends State<HomePage> {
  AppBar appBar(BuildContext context) {
    return new AppBar(
      title: Text('FlutterNews'),
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchResultPage()));
            }),
        Switch(
            value: isDark,
            onChanged: (state) {
              setState(() {
                isDark = !isDark;
              });
            }),
      ],
      bottom: TabBar(
        isScrollable: true,
        onTap: (index) {
          setState(() {
            Provider.of<NewsProvider>(context, listen: false).setcurtab(index);
          });
        },
        tabs: [
          Tab(
            text: 'Top Headlines',
          ),
          Tab(
            text: 'Business',
          ),
          Tab(
            text: 'Entertainment',
          ),
          Tab(
            text: 'Sports',
          ),
          Tab(
            text: 'Technology',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), () {
      setState(() {
        loadingScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData light = ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepPurpleAccent),
        primaryColor: Colors.deepPurpleAccent,
        brightness: Brightness.light);
    final ThemeData dark = ThemeData(brightness: Brightness.dark);
    return DefaultTabController(
      length: 5,
      //
      child: MaterialApp(
          title: 'News App',
          theme: isDark ? dark : light,
          debugShowCheckedModeBanner: false,
          home:loadingScreen?SplashScreen() : Builder(
            builder: (context) => Scaffold(
                appBar: appBar(context),
                body: TabBarView(children: [
                  ListviewBuilder(),
                  ListviewBuilder(),
                  ListviewBuilder(),
                  ListviewBuilder(),
                  ListviewBuilder(),
                ])),
          )),
    );
  }
}

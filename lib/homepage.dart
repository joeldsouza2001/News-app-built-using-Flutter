import 'package:flutter/material.dart';
import 'package:news_app/provider.dart';
import 'package:news_app/search_result_page.dart';
import 'package:provider/provider.dart';
import './listview_builder.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

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
            })
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: TabBarView(children: [
          ListviewBuilder(),
          ListviewBuilder(),
          ListviewBuilder(),
          ListviewBuilder(),
          ListviewBuilder(),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/provider.dart';
import 'package:provider/provider.dart';
import './listview_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    var curtab = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text('NewsApp'),
          bottom: TabBar(
            isScrollable: true,
            onTap: (index) {
              setState(() {
                Provider.of<NewsProvider>(context,listen: false).setcurtab(index);
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
        ),
        body: TabBarView(children: [
          ListviewBuilder(),
          ListviewBuilder(),
          ListviewBuilder(),
          ListviewBuilder(),
          ListviewBuilder(),
        ]));
  }
}

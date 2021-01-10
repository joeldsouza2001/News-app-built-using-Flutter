import 'package:flutter/material.dart';
import 'package:news_app/listview_builder.dart';
import 'package:provider/provider.dart';
import './provider.dart';
import './article_card.dart';

class SearchResultPage extends StatefulWidget {
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchText;
    final prov = Provider.of<NewsProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.blueAccent),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter the keyword. eg: Bitcoin,apple'),
                  controller: _searchText,
                  onSubmitted: (keyword) async {
                    await Provider.of<NewsProvider>(context, listen: false)
                        .search(keyword);
                        setState(() {
                          
                        });
                  },
                ),
              ),
               SingleChildScrollView(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: prov.searchData.isEmpty
                                      ? 0
                                      : prov.searchData.length,
                                  itemBuilder: (ctx, index) => ArticleCard(index),
                                ),
               ),
                            
            ],
          ),
        ),
      ),
    );
  }
}
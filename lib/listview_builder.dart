import 'package:flutter/material.dart';
import 'package:news_app/article_card.dart';
import 'package:news_app/provider.dart';
import 'package:provider/provider.dart';
import './listview_builder.dart';

class ListviewBuilder extends StatefulWidget {
  @override
  _ListviewBuilderState createState() => _ListviewBuilderState();

}

class _ListviewBuilderState extends State<ListviewBuilder> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false).fetchdata();
      setState(() {
    });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<NewsProvider>(context,listen: false);
    return SafeArea(
      child: FutureBuilder(
        future: prov.fetchdata(),
              builder:(ctx,snap)=> snap==ConnectionState.waiting?Center(child: CircularProgressIndicator()):Container(
          padding: const EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: prov.articles[prov.curtab].isEmpty
                ? 0
                : prov.articles[prov.curtab].length,
            itemBuilder: (ctx, index) => ArticleCard(index),
          ),
        ),
      ),
    );
  }
}
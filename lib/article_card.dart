import 'package:flutter/material.dart';
import './provider.dart';
import 'package:provider/provider.dart';

class ArticleCard extends StatelessWidget {
  int index;
  ArticleCard(this.index);
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<NewsProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: ListTile(
        leading: Image.network(prov.articles[prov.curtab][index].imageUrl),
        title: Text(prov.articles[prov.curtab][index].title),
      ),
    );
  }
}

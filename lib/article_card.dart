import 'package:flutter/material.dart';
import './provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  int index;
  ArticleCard(this.index);
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<NewsProvider>(context, listen: false);
    return Container(
      height: 135,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        child: Card(
          elevation: 3,
          child: ListTile(
            leading: Container(
                height: 170,
                width: 110,
                child: Image.network(
                  prov.articles[prov.curtab][index].imageUrl,
                  fit: BoxFit.cover,
                )),
            title: Text(prov.articles[prov.curtab][index].title),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                    'News by: ${prov.articles[prov.curtab][index].source}')),
          ),
        ),
        onTap: () async {
          final url = prov.articles[prov.curtab][index].url;
          print(url);
          if (await canLaunch(url)) {
            await (launch(url));
          } else {
            throw 'error';
          }
        },
      ),
    );
  }
}

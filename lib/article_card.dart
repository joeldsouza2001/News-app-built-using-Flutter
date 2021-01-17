import 'package:flutter/material.dart';
import './provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  int index;
  String listname;
  ArticleCard(this.listname, this.index);
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<NewsProvider>(context, listen: false);
    final _mediaquery = MediaQuery.of(context);
    final _height = (_mediaquery.size.height -
            (_mediaquery.padding.top + _mediaquery.padding.bottom)) /
        100;
    final _width = (_mediaquery.size.width -
            (_mediaquery.padding.left + _mediaquery.padding.right)) /
        100;
    if (listname == 'articles') {
      return Container(
        height: _height*19,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: GestureDetector(
          child: Card(
            elevation: 3,
            child: ListTile(
              leading: Container(
                  height: _height*13,
                  width: _width*25,
                  child: Image.network(
                    prov.articles[prov.curtab][index].imageUrl,
                    fit: BoxFit.cover,
                  )),
              title: Text(
                prov.articles[prov.curtab][index].title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
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
    } else {
      return Container(
        height:_height*19,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: GestureDetector(
          child: Card(
            elevation: 3,
            child: ListTile(
              leading: Container(
                  height:_height*13,
                  width: _width*25,
                  child: Image.network(
                    prov.searchData[index].imageUrl,
                    fit: BoxFit.cover,
                  )),
              title: Text(prov.searchData[index].title),
              subtitle: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('News by: ${prov.searchData[index].source}')),
            ),
          ),
          onTap: () async {
            final url = prov.searchData[index].url;
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
}

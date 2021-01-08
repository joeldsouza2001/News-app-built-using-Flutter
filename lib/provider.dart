import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Article {
  String title;
  String description;
  String content;
  String url;
  String imageUrl;
  String publishedTime;
  String source;
  Article(
      {this.content,
      this.description,
      this.imageUrl,
      this.publishedTime,
      this.source,
      this.title,
      this.url});
}

class NewsProvider with ChangeNotifier {
  Map<int, dynamic> articles = {0: [], 1: [], 2: [], 3: []};
  List<Article> topHeadlines = [];
  List<Article> businessHeadlines = [];
  List<Article> entertainmentHeadlines = [];
  List<Article> techHeadlines = [];
  List<Article> sportsHeadlines = [];
  int curtab = 0;
  List z = ['topHeadlines', 'businessHeadlines'];
  final url1 =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=85cfd649cd55403696f63567c7e5b1c3';
  final url2 =
      'https://newsapi.org/v2/top-headlines?category=business&apiKey=85cfd649cd55403696f63567c7e5b1c3';
  final url3 =
      'https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=85cfd649cd55403696f63567c7e5b1c3';
  final url4 =
      'https://newsapi.org/v2/top-headlines?category=sports&apiKey=85cfd649cd55403696f63567c7e5b1c3';
  final url5 =
      'https://newsapi.org/v2/top-headlines?category=technology&apiKey=85cfd649cd55403696f63567c7e5b1c3';

  Future fetchdata() async {
    print('enter');
    /*final response2 = await http.get(url2);
    final response3 = await http.get(url3);
    final response4 = await http.get(url4);
    final response5 = await http.get(url5);
    final fetchedData2 = json.decode(response2.body);
    final fetchedData3 = json.decode(response3.body);
    final fetchedData4 = json.decode(response4.body);
    final fetchedData5 = json.decode(response5.body);*/

    //0=topHeadlines
    //1=businessHeadlines
    //2=entertainmentHeadlines
    //3=techHeadlines
    //4=sportsHeadlines

    articles[0] = await extractData(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=85cfd649cd55403696f63567c7e5b1c3');
    articles[1] = await extractData(
        'https://newsapi.org/v2/top-headlines?category=business&apiKey=85cfd649cd55403696f63567c7e5b1c3');
    articles[2] = await extractData(
        'https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=85cfd649cd55403696f63567c7e5b1c3');
    articles[3] = await extractData(
        'https://newsapi.org/v2/top-headlines?category=sports&apiKey=85cfd649cd55403696f63567c7e5b1c3');
    articles[4] = await extractData(
        'https://newsapi.org/v2/top-headlines?category=technology&apiKey=85cfd649cd55403696f63567c7e5b1c3');
    notifyListeners();
  }

  void setcurtab(int i) {
    curtab = i;
  }

  Future extractData(url) async {
    List<Article> list = [];
    final response = await http.get(url);
    final fetchedData = json.decode(response.body);
    print('fetcheData: $fetchedData');
    if (fetchedData['status'] == 'ok') {
      fetchedData['articles'].forEach((e) {
        //print(e);
        if (e['content'] != null && e['urlToImage'] != null) {
          list.add(Article(
              content: e['content'],
              title: e['title'],
              description: e['description'],
              url: e['url'],
              imageUrl: e['urlToImage'],
              source: e['source']['name'],
              publishedTime: e['publishedAt']));
        }
      });
    }
    notifyListeners();
    print(articles);
    return list;
  }
}

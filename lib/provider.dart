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
  List<Article> searchData = [];
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

  Future search(keyword) async {
    final searchurl =
        'https://newsapi.org/v2/top-headlines?q=$keyword&apiKey=85cfd649cd55403696f63567c7e5b1c3';
    searchData=[];
    searchData = await extractData(searchurl);
    print(searchData[0].title);
    notifyListeners();
  }

  Future extractData(url) async {
    List<Article> list = [];
    final response = await http.get(url);
    final fetchedData = json.decode(response.body);
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
    return list;
  }
}

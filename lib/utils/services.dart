import 'dart:convert';

import 'package:news_provider/news_model/news.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class NewsApi{
  static NewsApi _instance;
  NewsApi._();
  static NewsApi get instance{
    if(_instance == null){
      _instance = NewsApi._();
    }
    return _instance;
  }

  Future<List<Data>> getNews() async {
    final newsResponse = await http.get(Uri.parse(fetchUrl));
    final newsResponseList = jsonDecode(newsResponse.body);
    return News.fromJson(newsResponseList).data;
  }
}
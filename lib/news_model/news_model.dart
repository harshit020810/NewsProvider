import 'package:flutter/cupertino.dart';
import 'package:news_provider/news_model/news.dart';
import 'package:news_provider/utils/constants.dart';
import 'package:news_provider/utils/services.dart';

class NewsModel extends ChangeNotifier{
  NewsState _newsState = NewsState.Initial;
  List<Data> dataList = [];
  NewsModel(){
    _fetchNews();
  }
  NewsState get newsState => _newsState;
  Future<void> _fetchNews() async{
    _newsState = NewsState.Loading;
    try{
      final data = await NewsApi.instance.getNews();
      dataList = data;
      _newsState = NewsState.Loaded;
    }catch(error){
      _newsState = NewsState.Error;
    }
    notifyListeners();
  }
}
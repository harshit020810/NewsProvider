import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_provider/news_model/news_model.dart';
import 'package:news_provider/screens/details_screen.dart';
import 'package:news_provider/utils/constants.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildMainView(),
      ),
    );
  }

  Widget buildAppBar(){
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text('News App', style: TextStyle(color: Colors.black))
    );
  }

  Widget buildMainView(){
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(child: buildView()),
    );
  }

  Widget buildView(){
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ChangeNotifierProvider(
        create: (context) => NewsModel(),
        child: Builder(builder: (context){
          final newsModel = Provider.of<NewsModel>(context);
          return buildListView(newsModel);
        }),
      ),
    );
  }

  Widget buildListView(NewsModel newsModel){
    if(newsModel.newsState == NewsState.Loading){
      return Center(child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2.0,),);
    }if(newsModel.newsState == NewsState.Error){
      return Center(child: Text("An Error Occurred"));
    }
    final news = newsModel.dataList;
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: news.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Get.to(DetailsScreen(), arguments: [news[index]]);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
               Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child:  news[index].image != null ? Image.network(
                    news[index].image,
                    fit: BoxFit.fill,
                  ) : Container(),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  title: Text(news[index].title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Text(news[index].description, style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  thickness: 5.0,
                  color: Colors.black,
                )
              ],
            ),
          );
        });
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_provider/news_model/news.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final Data data = Get.arguments[0];
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child:  data.image != null ? Image.network(
                data.image,
                fit: BoxFit.fill,
              ) : Container(),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text("${data.title}" ,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                data.description,
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                data.author == null ? "Author: N/A" : "Author: ${data.author}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Category: ${data.category}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Published at: ${data.publishedAt}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Country: ${data.country}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Language: ${data.language}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Source: ${data.source}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
                "Url: ${data.url}",
                style: TextStyle(color: Colors.black, fontSize: 17.0)
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ));
  }
}
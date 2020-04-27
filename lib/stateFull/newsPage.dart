import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_books/domain/models/News.dart';
import 'package:flutter_list_books/domain/services/NewsService.dart';

class NewsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {

  List<News> _news = new List<News>();

  @override
  void initState() {
    super.initState();
    _populateNews();
  }

  void _populateNews(){
    NewsService.fetchNews().then((news) => {
      this.setState(() => _news = news )
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Notícias'),
          centerTitle: true
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _news == null ? 0 : _news.length,
          itemBuilder: (context, index){
            return new Card(
              child: new Text(_news[index].title),
              margin: EdgeInsets.all(12)
            );
          },
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16)
        ),
      ),
    );
  }
}
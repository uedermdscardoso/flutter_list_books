
import 'dart:convert';

import 'package:flutter_list_books/domain/models/News.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class NewsService {

  static Future<List<News>> fetchNews() async {
    try{
      var response = await http.get('https://news.google.com/rss?hl=pt-BR&gl=BR&ceid=BR:pt-419');

      if(response.statusCode == 200) {
        final document = xml.parse(response.body.toString());
        List<News> news = new List<News>();
        String title, link, pubDate, description;

        document.findAllElements('item').forEach((element) => {
          title = element.findElements('title').elementAt(0).firstChild.toString(),
          link = element.findElements('link').elementAt(0).firstChild.toString(),
          pubDate = element.findElements('pubDate').elementAt(0).firstChild.toString(),
          description = element.findElements('description').elementAt(0).firstChild.toString(),
          news.add(new News.fromJson(new News(title: title,link: link,pubDate: pubDate,description: description)))
        });

        return news;
      } else
        throw Exception("Failed to load news");

    } catch(ex){
      print(ex);
    }
  }

}

import 'dart:convert';

import 'package:flutter_list_books/domain/models/Book.dart';
import 'package:http/http.dart' as http;

class BookService {

  static Future<List<Book>> fetchBook(search) async {
    try {
      var response = await http.get('https://www.googleapis.com/books/v1/volumes?q=${search}');

      if(response.statusCode == 200) {
        dynamic items = json.decode(response.body)['items'];
        List<Book> books = new List<Book>();

//      items.getRange(0, 5).toList()
        items.getRange(0, items.toList().length-1).toList().asMap().forEach((index, item) => books.add(Book.fromJson(item)) );

        return books;
      } else
        throw Exception("failed to load books");

    } catch(ex) { print(ex); }
  }
}
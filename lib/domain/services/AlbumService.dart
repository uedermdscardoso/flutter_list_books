import 'dart:convert';

import 'package:flutter_list_books/domain/models/Album.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  static Future<http.Response> fetchAlbum() async {
    return await http.get('https://jsonplaceholder.typicode.com/albums/1');
  }

  static Future<Album> fetchAlbum2() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200)
      return Album.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load album');
  }
}
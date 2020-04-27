
import 'dart:collection';

import 'package:flutter_list_books/domain/models/Author.dart';

class Book {
  String title;
  String subtitle;
  String publisher;
  String publishedDate;
  Set<Author> authors;
  String description;
  int pageCount;
  String printType;
  String language;
  String urlPhoto;
  String previewLink;
  String infoLink;
  String webReaderLink;

  Book({this.title, this.subtitle, this.publisher, this.publishedDate,
      this.authors, this.description, this.pageCount, this.printType,
      this.language, this.urlPhoto, this.previewLink, this.infoLink,
      this.webReaderLink});

  /*Book({title, subtitle, publisher, publishedDate,
      authors, description, pageCount, printType,
      language, urlPhoto, previewLink, infoLink, webReaderLink});*/

  factory Book.fromJson(dynamic obj){

    dynamic volumeInfo = obj['volumeInfo'];
    dynamic imageLinks = volumeInfo['imageLinks'];
    Set<Author> authors = new HashSet<Author>();
    (volumeInfo['authors'] as List).asMap().forEach((index, name) => authors.add(new Author(name: name)));

    return Book(
      title: volumeInfo['title'] != null ? volumeInfo['title'] : "",
      subtitle: volumeInfo['subtitle'] != null ? volumeInfo['subtitle'] : "",
      publisher: volumeInfo['publisher'] != null ? volumeInfo['publisher'] : "",
      publishedDate: volumeInfo['publishedDate'] != null ? volumeInfo['publishedDate'] : "",
      authors: authors.length > 0 ? authors : List.of([]),
      description: volumeInfo['description'] != null ? volumeInfo['description'] : "",
      pageCount: volumeInfo['pageCount'] != null ? volumeInfo['pageCount'] : 0,
      printType: volumeInfo['printType'] != null ? volumeInfo['printType'] : "",
      language: volumeInfo['language'] != null ? volumeInfo['language'] : "",
      urlPhoto: imageLinks['thumbnail'] != null ? imageLinks['thumbnail'] : "",
      previewLink: volumeInfo['previewLink'] != null ? volumeInfo['previewLink'] : "",
      infoLink: volumeInfo['infoLink'] != null ? volumeInfo['infoLink'] : "",
      webReaderLink: obj['webReaderLink'] != null ? obj['webReaderLink'] : ""
    );
  }

  /*String get title => _title;
  String get subtitle => _subtitle;
  String get publisher => _publisher;
  String get publishedDate => _publishedDate;
  Set<Author> get authors => _authors;
  String get description => _description;
  int get pageCount => _pageCount;
  String get printType => _printType;
  String get language => _language;
  String get urlPhoto => _urlPhoto;
  String get previewLink => _previewLink;
  String get infoLink => _infoLink;
  String get webReaderLink => _webReaderLink;
  set webReaderLink(String value) => _webReaderLink = value;
  set infoLink(String value) => _infoLink = value;
  set previewLink(String value) => _previewLink = value;
  set urlPhoto(String value) =>_urlPhoto = value;
  set language(String value) => _language = value;
  set printType(String value) => _printType = value;
  set pageCount(int value) => _pageCount = value;
  set description(String value) => _description = value;
  set authors(Set<Author> value) => _authors = value;
  set publishedDate(String value) => _publishedDate = value;
  set publisher(String value) => _publisher = value;
  set subtitle(String value) => _subtitle = value;
  set title(String value) => _title = value;*/

}
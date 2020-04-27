import 'package:flutter/material.dart';
import 'package:flutter_list_books/domain/models/Book.dart';
import 'package:flutter_list_books/domain/services/BookService.dart';

//Main.dart é o principal arquivo dessa aplicação

//Lista de livros com estado
class BookExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BookExamplePageState();
  }
}

class BookExamplePageState extends State<BookExamplePage> {

  List<Book> _books = new List<Book>();

  @override
  void initState(){
    super.initState();
    _populateBooks();
  }

  void _populateBooks(){
    BookService.fetchBook("Batman").then((books) => {
      setState(() => _books = books)
    });
  }

  ListTile _buildItemsForListView(BuildContext context, index){
    return ListTile(
      leading: Image.network(
          _books[index].urlPhoto
      ),
      title: new Text(_books[index].title),
      subtitle: new Text(_books[index].subtitle)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Livros'),
            centerTitle: true
        ),
        body: new Container(
          padding: EdgeInsets.all(16),
          child: new ListView.builder(
            itemCount: _books == null ? 0 : _books.length,
            itemBuilder: (context, index){
              return new Card(
                child: _buildItemsForListView(context, index)
              );
            }
          )
        )
    );
  }
}
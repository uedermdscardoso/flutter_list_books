import 'package:flutter/material.dart';
import 'package:flutter_list_books/domain/models/Book.dart';
import 'package:flutter_list_books/domain/services/BookService.dart';

//Main.dart é o principal arquivo dessa aplicação

//Lista de livros sem estado
class BookExamplePage extends StatelessWidget {

  Future<List<Book>> futureBooks;

  @override
  Widget build(BuildContext context) {

    futureBooks = BookService.fetchBook("Batman");

    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new FutureBuilder(
          future: futureBooks,
          builder: (context, snapshot){
            if(snapshot.hasData) {
               List<Book> data = snapshot.data as List;

               return new ListView.builder(
                   itemCount: data == null ? 0 : data.length,
                   itemBuilder: (context, index){
                     return new Card(
                       child: ListTile(
                         leading: Image.network(
                           data[index].urlPhoto
                         ),
                         title: new Text(data[index].title),
                         subtitle: new Text(data[index].subtitle),
                       ),
                     );
                   }
               );

            } else if(snapshot.hasError)
              return new Text('Error: ${snapshot.error}');

            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
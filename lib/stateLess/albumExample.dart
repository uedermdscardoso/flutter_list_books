import 'package:flutter/material.dart';
import 'package:flutter_list_books/domain/models/Album.dart';
import 'package:flutter_list_books/domain/services/AlbumService.dart';

//Main.dart é o principal arquivo dessa aplicação

//Sem estado
class AlbumExamplePage extends StatelessWidget {

  Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    futureAlbum = AlbumService.fetchAlbum2();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Album'),
        centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
        child: new FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot){
            if(snapshot.hasData)
              //return new Text("${snapshot.data.title}");
              return new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("ID: ${snapshot.data.id}"),
                  new Text("TITLE: ${snapshot.data.title}"),
                  new Text("USER ID: ${snapshot.data.userId}")
                ],
              );
            else if(snapshot.hasError)
              return new Text("${snapshot.error}");

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      )
    );
  }
}
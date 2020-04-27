import 'package:flutter/material.dart';
import 'package:flutter_list_books/MainPage.dart';
import 'package:flutter_list_books/stateFull/principalPage.dart';
import 'package:flutter_list_books/homePage.dart';
import 'package:flutter_list_books/stateFull/bookExample.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sem estado',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainPage()
    );
  }
}

// ** Classe de Aplicação
/*class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Best Practices',
      theme: ThemeData(primarySwatch: Colors.purple), //Define a cor no fundo da AppBar
      home: new PrincipalPage(),
    ); //Baseado no design material
  }
}*/

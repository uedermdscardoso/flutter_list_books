
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_books/domain/services/NewsService.dart';
import 'package:flutter_list_books/stateFull/bookExample.dart';
import 'package:flutter_list_books/stateFull/newsPage.dart';
import 'package:flutter_list_books/stateFull/principalPage.dart';
import 'package:flutter_list_books/stateLess/albumExample.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {

  static List<Widget> _widgetOptions = <Widget>[
    BookExamplePage(),
    AlbumExamplePage(),
    NewsPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    NewsService.fetchNews();

    return new Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Books'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            title: Text('Albums'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('News'),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped
      )
    );
  }
}
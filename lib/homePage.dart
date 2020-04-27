import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Home Page"),
        ),
        body: new Container(
            padding: EdgeInsets.all(16),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Hello World!', style: new TextStyle(
                    fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.center,
                )
              ],
            )
        )
    );
  }
}

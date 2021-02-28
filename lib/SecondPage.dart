import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          // toolbar
          Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 220,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },
                          ),
                          Center(
                              child: Row(children: [
                                Text("2",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(" of 10",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        color: Colors.grey))
                              ]))
                        ]),
                  ),
                ],
              )),
          // line pages
          Center(
            child: Container(
              width: 360,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.blue[800]),
                  value: 2 / 10,
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 22.0, top: 20.0),
              child: Row(children: <Widget>[
                Text("Which one of the \nfollowing is the \ngreatest circle?",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 29.0))
              ])),
          _getButton("Arctic Circle", null,null),
          _getButton(
            "Equator",
            Colors.blue[500],
            BorderSide(width: 2, color: Colors.blue[500]),
          ),
          _getButton("Tropic of cancer",null,null),
          _getButton("Tropic of capricon",null,null),
          Container(
            padding: EdgeInsets.only(left: 25, top: 50.0, right: 25),
            height: 120,
            child: Container(
              decoration: new BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: new BorderRadius.circular(10.0)),
              child: OutlineButton(
                child: Text("Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                    )),
                onPressed: () {
                  // Navigate to second route when tapped.
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ]));
  }

  Widget _getButton(String textName, Color color, BorderSide borderSide) {
    if (color == null) {
      color = Colors.black;
    }
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 22.0),
        height: 80,
        child: Row(children: <Widget>[
          Container(
            width: 360.0,
            child: OutlineButton(
              padding: EdgeInsets.only(left: 10.0),
              child: Center(
                  child: Container(
                      child: Row(children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20.0)),
                        Text(textName,
                            style: TextStyle(
                              color: color,
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                            ))
                      ]))),
              onPressed: () {
                // Navigate to second route when tapped.
                print("click category");
              },
              borderSide: borderSide,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
        ]));
  }
}

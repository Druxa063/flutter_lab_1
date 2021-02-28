import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SecondPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          //toolbar
          Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: 400,
                      child: Row(children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.short_text),
                          color: Colors.black,
                          onPressed: () { print("menu button");},
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications_none),
                          padding: EdgeInsets.only(left: 300.0),
                          color: Colors.black,
                          onPressed: () { print("notification button");},
                        )
                      ]))
                ],
              )),
          //Title
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(children: <Widget>[
                Text("Todays Surveys",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 25.0, top: 10.0),
              child: Row(children: <Widget>[
                Text(
                  "5 upcoming surveys",
                  style: TextStyle(color: Colors.grey),
                )
              ])),
          //Category
          _getRowButtons(
              "Science",
              Colors.blue[900],
              Icons.science,
              "Social",
              Colors.redAccent[100],
              Icons.group,
              context),
          _getRowButtons(
              "Teach",
              Colors.tealAccent[200],
              Icons.biotech,
              "Gaming",
              Colors.blue[900],
              Icons.gamepad,
              context),
          _getRowButtons(
              "History",
              Colors.redAccent[100],
              Icons.history,
              "Analytics",
              new Color.fromRGBO(86, 224, 203, 1),
              Icons.search,
              context),
          Padding(
              padding: EdgeInsets.only(left: 22.0, top: 30.0),
              child: Row(children: <Widget>[
                Text("All Surveys",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0))
              ])),
          Container(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView(
              children: [
                _getIconSurveys("icon/food_icon.jpg", 'Food Survey', 4 / 15, "4/15"),
                _getIconSurveys("icon/business_icon.jpg", 'Business Survey', 1 / 10, "1/10"),
                _getIconSurveys("icon/travel_icon.jpg", 'Travel Survey', 4 / 5, "4/5"),
              ],
            ),
          )
        ]));
  }

  Widget _getRowButtons(String textName1, Color color1, IconData icon1,
      String textName2, Color color2, IconData icon2, BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15.0, left: 20.0),
        height: 80,
        child: Row(children: <Widget>[
          _getCellButton(textName1, color1, icon1, context),
          Padding(padding: EdgeInsets.only(left: 20.0)),
          _getCellButton(textName2, color2, icon2, context),
        ]));
  }

  Widget _getIconSurveys(
      String imgPath, String name, double percent, description) {
    return Padding(
        padding: EdgeInsets.only(left: 22, right: 10, top: 10),
        child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Hero(
                        tag: imgPath,
                        child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    description,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 300,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      backgroundColor:
                                        Colors.grey[200],
                                      valueColor: new AlwaysStoppedAnimation<Color>(
                                        Colors.blue[800],
                                      ),
                                      value: percent,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
  }

  Container _getCellButton(String textName, Color color, IconData icon, BuildContext context) {
      return Container(
        width: 170.0,
        child: OutlineButton(
          padding: EdgeInsets.only(left: 10.0),
          child: Center(
              child: Container(
                  child: Row(children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      child: new Icon(icon, color: Colors.white),
                      decoration: new BoxDecoration(
                          color: color,
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(textName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]))),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage()));
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
        ),
      );
  }
}

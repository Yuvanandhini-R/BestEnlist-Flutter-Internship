import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day 3",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _switchValue = false;
  List<bool> _toggleButtonsIsSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 3 - Widgets"),
        actions: [
          Switch(
            activeColor: Colors.pink,
            value: _switchValue,
            onChanged: (bool newValue) {
              setState(() {
                _switchValue = newValue;
              });
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  child: Text("Flat Button"),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  child: Text("Flat Button (Disabled)"),
                  onPressed: null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  child: Text("Raised Button"),
                  onPressed: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  child: Text("Raised Button (Disabled)"),
                  onPressed: null,
                ),
              ),
            ],
          ),
          ToggleButtons(
            children: <Widget>[
              Icon(Icons.thumb_up_alt_rounded),
              Icon(Icons.chat_bubble_rounded),
              Icon(Icons.share_rounded),
            ],
            isSelected: _toggleButtonsIsSelected,
            onPressed: (button_index) {
              setState(() {
                _toggleButtonsIsSelected[button_index] =
                    !_toggleButtonsIsSelected[button_index];
              });
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Input Text, Alert, and Snackbar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String teks = "";

  TextEditingController textController = new TextEditingController();
  TextEditingController alertController = new TextEditingController();
  TextEditingController snackbarController = new TextEditingController();

  // for snackbar
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _alertdialog(String str) {
    if (str.isEmpty) return;
    AlertDialog alert = new AlertDialog(
      content: new Text(
        str,
        style: new TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.purple,
          child: new Text("Submit"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alert);
  }

  void _snackbar(String str) {
    if (str.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content: new Text(str, style: new TextStyle(fontSize: 20.0),),
      duration: new Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Don't forget to add this for snackbar:
      key: _scaffoldState,
      appBar: new AppBar(
        backgroundColor: Colors.purple,
        title: new Text("Input, Alert, Snackbar"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10),
            ),
            new TextField(
              controller: textController,
              decoration: new InputDecoration(
                  hintText: "Tulis di dieu",
                  hintStyle: new TextStyle(color: Colors.red)),
              onSubmitted: (String str) {
                setState(() {
                  teks = str + "\n" + teks;
                  textController.text = "";
                });
              },
            ),
            new Text(
              teks,
              style: new TextStyle(fontSize: 20.0),
            ),
            new Padding(
              padding: EdgeInsets.all(20),
            ),
            new TextField(
              controller: alertController,
              decoration: new InputDecoration(
                  hintText: "Tulis ntar muncul alert",
                  hintStyle: new TextStyle(color: Colors.black)),
              onSubmitted: (String kata) {
                setState(() {
                  _alertdialog(kata);
                  alertController.text="";
                });
              },
            ),
            new Padding(
              padding: EdgeInsets.all(20),
            ),
            new TextField(
              controller: snackbarController,
              decoration: new InputDecoration(
                  hintText: "Tulis ntar muncul Snackbar",
                  hintStyle: new TextStyle(color: Colors.black)),
              onSubmitted: (String kata) {
                setState(() {
                  _snackbar(kata);
                  snackbarController.text="";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

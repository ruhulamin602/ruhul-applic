import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';

// ignore: must_be_immutable
class Result extends StatefulWidget {
  Model model;
  Result({this.model});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('First Name => '+widget.model.firstName, style: TextStyle(fontSize: 22,color: Colors.green)),
            Text('Last Name => '+widget.model.lastName, style: TextStyle(fontSize: 22,color: Colors.green)),
            Text('Email => '+widget.model.email, style: TextStyle(fontSize: 22,color: Colors.green)),
            Text('Password => '+widget.model.password, style: TextStyle(fontSize: 22,color: Colors.green)),
          ],
        ),
      ),
    ));
  }
}

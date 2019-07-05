import 'package:flutter/material.dart';

class BodyPage extends StatelessWidget {
  final String tempValue;
  BodyPage(this.tempValue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Text(
                'Body Tab',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    tempValue,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ])));
  }
}

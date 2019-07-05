import 'package:flutter/material.dart';

class IdPage extends StatelessWidget {
  final String tempValue;
  IdPage(this.tempValue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Text(
                'ID Tab',
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

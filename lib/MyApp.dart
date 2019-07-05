import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './api_list_page.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List dataList;
  String tempApiText = 'Enter The Index Of Api item in Text Field ';
  String btnText = 'Show Api Data';
  Color btnColor = Colors.green;
  Color apiDataColor = Colors.deepPurpleAccent;
  int apiIndex = 0;
  bool checkButton = true;
  bool switchButton = true;
  TextEditingController textCon = new TextEditingController();

  void onClickFun() async {
    dataList = await getApiDataFun();
    setState(() {
      if (textCon.text == '') {
        tempApiText = "Please Enter the Index First !";
        apiDataColor = Colors.redAccent;
      } else {
        apiIndex = int.parse(textCon.text) - 1;
        if (apiIndex < 0 || apiIndex > 100) {
          tempApiText = 'Please Enter only Integer Numbers From 1 : 100';
          apiDataColor = Colors.redAccent;
          textCon.text = '';
        } else {
          tempApiText =
              'ID:  ${dataList[apiIndex]['id'.toString()]}\n\nUserID:  ${dataList[apiIndex]['userId'.toString()]}'
              '\n\nTitle:  ${dataList[apiIndex]['title']} \n\nBody:  ${dataList[apiIndex]['body']}';
        }
      }
    });
  }

  deleteFun() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Are you want to remove this ?',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        tempApiText = '';
                        textCon.text = '';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//======================================================================== Drawer
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Settings'),
              backgroundColor: Colors.green,
            ),
            ListTile(
                leading: Icon(Icons.list),
                title: Text('List Tile'),
                subtitle: Text('Show Api in List Tile in other page'),
                onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ApiListPage(dataList);
                    }))),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Auto Save'),
                  Switch(
                    value: switchButton,
                    onChanged: (bool value) {
                      setState(() {
                        switchButton = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Auto Update'),
                  Checkbox(
                    value: checkButton,
                    onChanged: (bool value) {
                      setState(() {
                        checkButton = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

//======================================================================== AppBar

      appBar: AppBar(
        title: Text('Test Api AppBar'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.deepPurpleAccent,
              size: 35,
            ),
            onPressed: deleteFun,
          ),
        ],
      ),

//======================================================================== body

      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 250,
                        child: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          controller: textCon,
                          decoration: InputDecoration(
                              labelText: 'Index',
                              hintText: 'Enter Api Index',
                              border: OutlineInputBorder(
                                  gapPadding: 50,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        btnText,
                        style: TextStyle(
                            fontSize: 15,
                            color: btnColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: onClickFun,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      children: <Widget>[
                        Center(
                          child: Text(
                            tempApiText,
                            style: TextStyle(
                                fontSize: 16,
                                color: apiDataColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<List> getApiDataFun() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

import 'package:flutter/material.dart';
import './MyApp.dart';
// import './cards_page.dart';

void main() {
  return runApp(MaterialApp(debugShowCheckedModeBanner: false,
      //home: MyApp(),
      routes: {
         '/': (BuildContext context) => MyApp(),
        // '/cards': (BuildContext context) => CardsPage(),
      }
    )
  );
}

import 'package:flutter/material.dart';
import './tab_pages/id_page.dart';
import './tab_pages/title_page.dart';
import './tab_pages/body_page.dart';

class DetailPage extends StatelessWidget {
  final String id, title, body;
  DetailPage(this.id, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details Page'),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Id'),
                icon: Icon(Icons.toys),
              ),
              Tab(
                child: Text('Title'),
                icon: Icon(Icons.toc),
              ),
              Tab(
                child: Text('Body'),
                icon: Icon(Icons.tab),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            IdPage(id),
            TitlePage(title),
            BodyPage(body),
          ],
        ),
        //ToDo ================================================= id , title and body in the same page without tabs
        // body: ListView(
        //   children: <Widget>[
        //     Container(
        //       color: Colors.red,
        //       height: 100,
        //       child: Center(
        //           child: Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: Text(
        //           id,
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //       )),
        //     ),
        //     Container(
        //       color: Colors.green,
        //       height: 150,
        //       child: Center(
        //           child: Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: Text(
        //           title,
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //       )),
        //     ),
        //     Container(
        //       color: Colors.blue,
        //       height: 250,
        //       child: Center(
        //           child: Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: Text(
        //           body,
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //       )),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './detail.dart';

class ApiListPage extends StatelessWidget {
  final List apiList;
  ApiListPage(this.apiList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api List Page'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: apiList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(apiList[index]['id'].toString()),
                  backgroundColor: Colors.green,
                ),
                title: Text(
                  'Title : ${apiList[index]['title']}',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
                subtitle: Text('Body : ${apiList[index]['body']}\n'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailPage(
                      'ID : ${apiList[index]['id']}',
                      'Title : ${apiList[index]['title']}',
                      'Body : ${apiList[index]['body']}',
                    );
                  }));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drawerclass.dart';
import 'values.dart';

class MyApiCall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApiCall();
  }
}

class _ApiCall extends State<MyApiCall> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground(),
      drawer: MyDrawer(),
      appBar: AppBar(

        //backgroundColor: appBarColor(),
        title: Text("Api Call"),
      ),
      body: new Container(
        child: new FutureBuilder<List<User>>(
          future: fetchUsersFromGitHub(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(snapshot.data[index].name,
                              style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Divider()
                        ]
                    );
                  }
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return new Center(
              child: new CircularProgressIndicator(),

            );
          },
        ),
      ),
    );
  }

//--------------Methods---------------------

  Future<List<User>> fetchUsersFromGitHub() async {
    final response = await http.get('http://api.github.com/users');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }

  List<User> createUserList(List data){
    List<User> list = new List();
    for (int i = 0; i < data.length; i++) {
      String title = data[i]["login"];
      int id = data[i]["id"];
      User user = new User(
          name: title,id: id);
      list.add(user);
    }
    return list;
  }



}
class User  {
 int id;
 String name;

 User({this.id, this.name});

}


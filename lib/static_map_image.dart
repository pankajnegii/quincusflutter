import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'drawerclass.dart';
class MyStaticMapImage extends StatefulWidget {
  MyStaticMapImage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyStaticMapImage createState() => _MyStaticMapImage();
}

class _MyStaticMapImage extends State<MyStaticMapImage> {

  static String googleMapsApiKey = 'AIzaSyCpWqOAedyjTGkHzsq068wQUQ_lr44UWbI';
  User user = new User('https://maps.googleapis.com/maps/api/staticmap?center=37.0902%2C-95.7192&zoom=4&size=400x600&key=$googleMapsApiKey');

  @override
  void initState() {
    super.initState();
    CreateMapImage();

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
      Column(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height - 90.0,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child:
              new Image.network(user.name, fit: BoxFit.cover,),
          ),
        ],
      ),
      //new Image.network('https://maps.googleapis.com/maps/api/staticmap?center=37.0902%2C-95.7192&zoom=4&size=600x400&key=$googleMapsApiKey'),
    );
  }
   Future<Null> CreateMapImage(){


    Future<User> overViewPolyLine = getUser('https://maps.googleapis.com/maps/api/directions/json?origin=28.6419017,77.320441&destination=28.630896,%2077.286937&mode=driving&key=AIzaSyCpWqOAedyjTGkHzsq068wQUQ_lr44UWbI');
    return overViewPolyLine.then((_user){
      print(user.name);
      setState(() => user = _user);//To check the response
      //return  user.name;
    });


  }
}


class User {
  final String name;

  User(this.name);

  factory User.fromJson(Map<String, dynamic> json) {

    String fullName =  json['routes'][0]['overview_polyline']['points'];
    print(fullName);          //To check the response
    String mapImageUri = Uri.encodeFull(fullName);
    print(mapImageUri);               //To check the response
    fullName = 'http://maps.googleapis.com/maps/api/staticmap?sensor=false&size=400x600&path=weight:3%7Ccolor:0x00b3fd%7Cenc:' + fullName + '&key=AIzaSyCpWqOAedyjTGkHzsq068wQUQ_lr44UWbI';
    print(fullName);          //To check the response
    return User(fullName);
  }
}

Future<User> getUser(String apiUrl) async {
  final response = await http.get(apiUrl);
  final responseJson = json.decode(response.body);
  //print(response.body);             //To check the response
  return User.fromJson(responseJson);
}

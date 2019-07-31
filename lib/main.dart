import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'loginapi.dart';
import 'shipment.dart';
import 'values.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool alreadyLogin =false;
  @override
  void init(){
    //checkSharedPreferences();
    print("INIT called ");
  }

  @override
  Widget build(BuildContext context) {
    checkSharedPreferences(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,        //To remove debug text in app
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: themeColor(),
        buttonColor: Colors.blue,
      ),
      home:

      alreadyLogin ? MyLoginPageAPI() : MyShipmentPage(),
    );
  }

  void checkSharedPreferences(BuildContext context) async {

    SharedPreferences prefSave = await SharedPreferences.getInstance();
    String email = prefSave.get('email2');
    print(email);
    if(email!= Null){
      alreadyLogin = true;
    }

  }
}


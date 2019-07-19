import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'drawerclass.dart';
import 'shipmentdata.dart';
import 'values.dart';

class MyShipmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShipmentPage();
  }
}

class _ShipmentPage extends State<MyShipmentPage> {

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        backgroundColor: pageBackground(),
        drawer: MyDrawer(),
        appBar: AppBar(

          //backgroundColor: appBarColor(),
          title: Text("DashBoard"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 30.0),
              child: Row( //Row 1
                children: <Widget>[
                  Text('Shipment',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.left,),
                ],
              ),
            ),
            Padding(
              //alignment: Alignment.center,
              padding: EdgeInsets.only(top: 200.0, left: 10.0),
              child: Row( //Row 2
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: 120.0,
                          height: 120.0,
                          child: Center(child:
                          Text('1',
                            style: TextStyle(color: Colors.white, fontSize: 40.0),
                            textAlign: TextAlign.center,),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: greenColor(),
                                width: 1.0,
                                style: BorderStyle.solid),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Remaining'),
                      ),
                    ],

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: new Stack(
                      children: <Widget>[
                        new Positioned(
                          top: 50.0,
                          left: 2.0,
                          child: new Text(
                            'Out', style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 17.0),),
                        ),

                        new Container(
                          width: 80.0,
                          height: 170.0,
                          child:
                          Text('/',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 100.0,
                                fontWeight: FontWeight.w200),
                            textAlign: TextAlign.center,),

                          /*decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: greenColor(),
                                width: 1.0,
                                style: BorderStyle.solid),
                          )*/
                        ),
                        new Positioned(
                          top: 50.0,
                          right: 10.0,
                          child: new Text(
                            'Of', style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 17.0),),
                        ),

                      ],
                    ),
                  ),


                  Column(
                    children: <Widget>[
                      Container(
                          width: 120.0,
                          height: 120.0,
                          child: Center(child:
                          Text('25',
                            style: TextStyle(color: Colors.white, fontSize: 40.0),
                            textAlign: TextAlign.center,),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: greenColor(),
                                width: 1.0,
                                style: BorderStyle.solid),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Total Shipments'),
                      ),

                    ],

                  ),
                ],
              ),
            ),

            //Row 3
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: greenColor(), width: 1.0),),
                      /*shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),),*/
                      color: Color(0xFF1D1D1D),
                      child: Text('START',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300),),
                      onPressed: () {
                        _OpenMyShipmentData('Opening Shipment Data');
                      },
                    ),
                  ]
              ),
            )

          ],
        ),
      ),
    );
  }

//--------------Methods---------------------


  void _OpenMyShipmentData(String text) {
    Fluttertoast.showToast(
      msg: "Result : " + text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      /*bgcolor: '#3EA7DC',
      textcolor: '#FFFFFF',*/
    );
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
        new MyShipmentData()));
  }

  Future<bool> _onWillPop() {
    //To close app on back key press
     return showDialog(
        context: context,
        builder: (BuildContext context) {
         return new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Your app will be closed.'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => exit(0),//Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
            ],
          );
        }
    ) ?? false;
  }


}

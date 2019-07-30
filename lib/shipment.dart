import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    //TODO Help : https://pub.dev/packages/flutter_screenutil#-readme-tab-

    print("devicePixelRatio : " + MediaQuery.of(context).devicePixelRatio.toString());
    print("size.aspectRatio : " + MediaQuery.of(context).size.aspectRatio.toString());
    print("size" + MediaQuery.of(context).size.toString());
    //fill in the screen size of the device in the design

    //default value : width : 1080px , height:1080px , allowFontScaling:false
    //ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    //If the design is based on the size of the Poco f1 ​​(Poco f1 1080*2246)
    ScreenUtil.instance = ScreenUtil(width: 1080 , height: 2246)..init(context);

    //If you wang to set the font size is scaled according to the system's "font size" assist option
    //ScreenUtil.instance = ScreenUtil(width: 1080, height: 2246, allowFontScaling: true)..init(context);

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
              padding: EdgeInsets.only(top: sdp(20.0), left: sdp(30.0)),
              child: Row( //Row 1
                children: <Widget>[
                  Text('Shipment',
                    style: TextStyle(color: Colors.white, fontSize: sdp(22.0)),
                    textAlign: TextAlign.left,),
                ],
              ),
            ),
            Padding(
              //alignment: Alignment.center,
              padding: EdgeInsets.only(top: sdp(150.0), left: sdp(10.0)),
              child: Row( //Row 2
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: sdp(120.0),
                          height: sdp(120.0),
                          child: Center(child:
                          Text('1',
                            style: TextStyle(color: Colors.white, fontSize: sdp(40.0)),
                            textAlign: TextAlign.center,),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: greenColor(),
                                width: sdp(1.0),
                                style: BorderStyle.solid),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(sdp(20.0)),
                        child: Text('Remaining'),
                      ),
                    ],

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: sdp(12.0)),
                    child: new Stack(
                      children: <Widget>[
                        new Positioned(
                          top: sdp(50.0),
                          left: sdp(2.0),
                          child: new Text(
                            'Out', style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: sdp(17.0)),),
                        ),

                        new Container(
                          width: sdp(80.0),
                          height: sdp(170.0),
                          child:
                          Text('/',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: sdp(100.0),
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
                          top: sdp(50.0),
                          right: sdp(10.0),
                          child: new Text(
                            'Of', style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: sdp(17.0)),),
                        ),

                      ],
                    ),
                  ),


                  Column(
                    children: <Widget>[
                      Container(
                          width: sdp(120.0),
                          height: sdp(120.0),
                          child: Center(child:
                          Text('25',
                            style: TextStyle(color: Colors.white, fontSize: sdp(40.0)),
                            textAlign: TextAlign.center,),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: greenColor(),
                                width: sdp(1.0),
                                style: BorderStyle.solid),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(sdp(20.0)),
                        child: Text('Total Shipments'),
                      ),

                    ],

                  ),
                ],
              ),
            ),

            //Row 3
            Padding(
              padding: EdgeInsets.only(top: sdp(50.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: sdp(50.0), right: sdp(50.0), top: sdp(15.0), bottom: sdp(15.0)),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(sdp(5.0)),
                        borderSide: BorderSide(
                            color: greenColor(), width: sdp(1.0)),),
                      /*shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),),*/
                      color: Color(0xFF1D1D1D),
                      child: Text('START',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sdp(25.0),
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
      backgroundColor: greenColor(),
      textColor: Colors.white,
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

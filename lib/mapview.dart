import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'drawerclass.dart';
import 'presentation/my_custom_icons_icons.dart';
import 'values.dart';

class MyMapView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapView();
  }
}

class _MapView extends State<MyMapView> {
  bool visibilityDetails = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pageBackground(),
        drawer: MyDrawer(),
        appBar: AppBar(
          //backgroundColor: appBarColor(),
          title: Text("Map (Fake Image)"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: greenColor(),
                child: Text(
                  'COMPLETE',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  _showToast("Complete Button is clicked", greenColor());
                },
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              shape: CircleBorder(side: BorderSide.none),
              color: Colors.red,
              child: Text(
                '!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
              onPressed: () {
                _showToast("Report an issue is clicked", Colors.red);
              },
            ),
          ],
        ),
        body: Center(
          //
          child: new Container(
            //padding: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/mapbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: AlignmentDirectional(-1.0, -1.0),
            //To align the child at the topic
            child: Container(
              //padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              color: transparentBlack60(),
              constraints: BoxConstraints(
                  maxHeight: visibilityDetails
                      ? ScreenUtil().setHeight(1010.0)
                      : ScreenUtil().setHeight(650.0),
                  maxWidth: ScreenUtil().setWidth(1080.0),
                  minWidth: ScreenUtil().setWidth(370.0),
                  minHeight: ScreenUtil().setHeight(370.0)),

              //padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(ScreenUtil().setSp(27.5)),
                    color: transparentBlack80(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setSp(5.5)),
                              child: new Text(
                                'Pang Bo', //TODO align this text to left corner
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(55.0),
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerRight,
                                child: new Text(
                                  'Delivery',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(49.5),
                                      color: Colors.green),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.only(left: 60.0),
                                child: new Text(
                                  'HIN#:57-4',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(38.5),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                //padding: EdgeInsets.only(left: 60.0),
                                child: new Text(
                                  'ID#1ZX4648651416',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(38.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 7, //to adjust size
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: new Text(
                              '1 SERANGOON AVENUES 2 SUN GLADE BLK 7 FLOOR 6 UNIT 21 , SINGAPUR SG SG , 556130',
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: new RaisedButton(
                            padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 20.0),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: greenColor(), width: 1.0),
                            ),
                            /*shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),),*/
                            color: transparent(),
                            /*splashColor: Colors.grey,       //for testing
                            highlightColor: Colors.yellow,
                            disabledColor: Colors.blue,*/
                            //colorBrightness: Brightness.light,
                            child: Text(
                              'GO',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.end,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ), //
                  ),
                  visibilityDetails
                      ? new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.local_shipping,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Packages',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, right: 10.0, left: 10.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 45.0,
                                    decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: greenColor(),
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(5.0)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:
                                      //Custom Icon help : https://medium.com/flutterpub/how-to-use-custom-icons-in-flutter-834a079d977
                                      Icon(
                                    MyCustomIcons.hourglass,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'ETA',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, right: 10.0, left: 10.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 75.0,
                                    decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: greenColor(),
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(5.0)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '20:48',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Commit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, right: 10.0, left: 10.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 75.0,
                                    decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: greenColor(),
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(5.0)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '22:00',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.alarm_on,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Start',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, right: 10.0, left: 10.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 75.0,
                                    decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: greenColor(),
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(5.0)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '08:30',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : new Container(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: new RaisedButton(
                      /*shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),),*/
                      color: transparentBlack80(),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            height: 45.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //to place text and icon at start and End of row.
                              children: <Widget>[
                                Text(
                                  'Distance : 4335.54 km',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(
                                  visibilityDetails
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                      // On login click
                      onPressed: () {
                        _changeVisibilityDetails();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

//--------------Methods---------------------

  void _showToast(String text, Color bgColor) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
    );
  }

  void _changeVisibilityDetails() {
    setState(() {
      visibilityDetails = !visibilityDetails;
    });
  }
}

import 'package:flutter/material.dart';

import 'drawerclass.dart';
import 'mapview.dart';
import 'presentation/my_custom_icons_icons.dart';
import 'values.dart';

class MyShipmentData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShipmentData();
  }
}

class _ShipmentData extends State<MyShipmentData> {

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pageBackground(),
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Shipment"),
        ),
        body:
        Center( //
          child:
          new Container(
            padding: EdgeInsets.only(left: sdp(10.0) , right: sdp(10.0) , top: sdp(10.0),),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/bg.png"),
                fit: BoxFit.cover,),
            ),
            //alignment: AlignmentDirectional(-1.0, -1.0),
            child:
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, position) {
                  return MyShipmentItem();
                },
                itemCount: 20
            ),
          ), //outer cntnr
        ) //center

    );
  }

}

//-----------To Solve visibilityDetails-------------

class MyShipmentItem extends StatefulWidget {
  MyShipmentItem({Key key}) : super(key: key);

  @override
  _ShipmentItem createState() => _ShipmentItem();
}

class _ShipmentItem extends State<MyShipmentItem> {
  bool _visibilityDetails = false;

  Widget build(BuildContext context) {
    return Container( ////
      margin: EdgeInsets.only(bottom: sdp(10.0)),
      padding: EdgeInsets.only(
          left: sdp(10.0), right: sdp(10.0), top: sdp(10.0)),
      color: Color(0xAA000000),
      // a bit whitish to match background
      /*constraints: BoxConstraints(
          maxHeight: _visibilityDetails ? 350.0 : 225,
          maxWidth: 440.0,
          minWidth: 150.0,
          minHeight: 150.0
      ),*/

      //padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,         //height as wrap content
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Expanded(
                flex: 2, //to adjust size
                child: Column(
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.only(left: sdp(10.0)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Pang Bo',
                            //TODO align this text to left corner
                            style: TextStyle(
                                fontSize: sdp(20.0),
                                color: Colors.white),
                            textAlign: TextAlign.start,),
                        )
                    ),

                    new Padding(
                      padding: EdgeInsets.only(
                          top: sdp(10.0), left: sdp(10.0)),
                      child: new Text(
                        '1 SERANGOON AVENUES 2 SUN GLADE BLK 7 FLOOR 6 UNIT 21 , SINGAPUR SG SG , 556130',
                        maxLines: 3,),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: new Text('Delivery',
                        style: TextStyle(
                            fontSize: sdp(18.0),
                            color: Colors.green),),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      //padding: EdgeInsets.only(left: 60.0),
                      child: new Text(
                        'HIN#:57-4',
                        textAlign: TextAlign.right,),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      //padding: EdgeInsets.only(left: 60.0),
                      child: new Text(
                        'ID#1ZX4648651416',
                        textAlign: TextAlign.right,),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new RaisedButton(

                padding: EdgeInsets.only(
                    left: sdp(20.0),
                    right: 20.0,
                    top: sdp(15.0),
                    bottom: sdp(15.0)),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(sdp(5.0)),
                  borderSide: BorderSide(
                      color: greenColor(), width: sdp(1.0)),),
                /*shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),),*/
                color: Color(0x00000000),
                child: Text('GO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sdp(25.0),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.end,),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          MyMapView()));
                },
              ),
            ],
          ),
          _visibilityDetails ?
          new Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(

                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(sdp(10.0)),
                    child:
                    Icon(Icons.local_shipping, color: Colors.white,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sdp(5.0)),
                    child:
                    Text('Packages',
                      style: TextStyle(
                          color: Colors.white, fontSize: sdp(13.0)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: sdp(10.0), right: sdp(10.0), left: sdp(10.0)),
                    child:
                    Container(
                      height: sdp(45.0),
                      width: sdp(45.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            color: greenColor(),
                            width: sdp(1.0),
                            style: BorderStyle.solid
                        ),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(sdp(5.0))),
                      ),
                      child: Center(
                        child:
                        Text('1',
                          style: TextStyle(
                              color: Colors.white, fontSize: sdp(13.0)),),),
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(sdp(10.0)),
                    child:
                    //Custom Icon help : https://medium.com/flutterpub/how-to-use-custom-icons-in-flutter-834a079d977
                    Icon(MyCustomIcons.hourglass, color: Colors.white,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sdp(5.0)),
                    child:
                    Text('ETA',
                      style: TextStyle(
                          color: Colors.white, fontSize: sdp(13.0)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: sdp(10.0), right: sdp(10.0), left: sdp(10.0)),
                    child:
                    Container(
                      height: sdp(45.0),
                      width: sdp(75.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            color: greenColor(),
                            width: sdp(1.0),
                            style: BorderStyle.solid
                        ),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(sdp(5.0))),
                      ),
                      child: Center(
                        child:
                        Text('20:48',
                          style: TextStyle(
                              color: Colors.white, fontSize: sdp(13.0)),),),
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(sdp(10.0)),
                    child:
                    Icon(Icons.alarm, color: Colors.white,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sdp(5.0)),
                    child:
                    Text('Commit',
                      style: TextStyle(
                          color: Colors.white, fontSize: sdp(13.0)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: sdp(10.0), right: sdp(10.0), left: sdp(10.0)),
                    child:
                    Container(
                      height: sdp(45.0),
                      width: sdp(75.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            color: greenColor(),
                            width: sdp(1.0),
                            style: BorderStyle.solid
                        ),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(sdp(5.0))),
                      ),
                      child: Center(
                        child:
                        Text('22:00',
                          style: TextStyle(
                              color: Colors.white, fontSize: sdp(13.0)),),),
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(sdp(10.0)),
                    child:
                    Icon(Icons.alarm_on, color: Colors.white,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sdp(5.0)),
                    child:
                    Text('Start',
                      style: TextStyle(
                          color: Colors.white, fontSize: sdp(13.0)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: sdp(10.0), right: sdp(10.0), left: sdp(10.0)),
                    child:
                    Container(
                      height: sdp(45.0),
                      width: sdp(75.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(
                            color: greenColor(),
                            width: sdp(1.0),
                            style: BorderStyle.solid
                        ),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(sdp(5.0))),
                      ),
                      child: Center(
                        child: Text('08:30',
                          style: TextStyle(
                              color: Colors.white, fontSize: sdp(13.0)),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ) : new Container(),

          Padding(
            padding: EdgeInsets.only(top: sdp(20.0)),
            child: new RaisedButton(
              /*shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),),*/
              color: greenColor(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    height: sdp(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween,
                      //to place text and icon at start and End of row.
                      children: <Widget>[
                        Text('Distance : 4335.54 km',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sdp(16.0)),
                          textAlign: TextAlign.left,),
                        Icon(
                          _visibilityDetails
                              ? Icons.keyboard_arrow_up
                              : Icons
                              .keyboard_arrow_down,
                          color: Colors.white,)
                      ],
                    )
                ),
              ),
              // On login click
              onPressed: () {
                _changeVisibilityDetails();
              },

            ),
          ),
        ]
        ,
      ),
    ); //inner container
  }

  void _changeVisibilityDetails() {
    setState(() {
      _visibilityDetails = !_visibilityDetails;
    });
  }
}
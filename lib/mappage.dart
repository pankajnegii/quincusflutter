import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'drawerclass.dart';
import 'values.dart';

class MyMapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPage();
  }
}

class _MapPage extends State<MyMapPage> {
  Widget build(BuildContext context) {
    GoogleMapController googleMapController;
    _CheckPermission();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        backgroundColor: pageBackground(),
        drawer: MyDrawer(),
        appBar: AppBar(

          //backgroundColor: appBarColor(),
          title: Text("Map"),
        ),
        body: Column(
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
              GoogleMap(      //Help : https://medium.com/flutter-community/exploring-google-maps-in-flutter-8a86d3783d24
                onMapCreated: (GoogleMapController controller) {

                  googleMapController = controller;
                },
                options: GoogleMapOptions(
                  //mapType: MapType.satellite,
                  cameraPosition: CameraPosition(
                    target: LatLng(28.630896, 77.286937),
                    zoom: 15.0,
                    tilt: 50.0,
                    bearing: 45.0,
                  ),
                 // rotateGesturesEnabled: false,
                  //scrollGesturesEnabled: false,
                  //tiltGesturesEnabled: false,
                ),
              ),

            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.zoom_in, size: 35.0,),
            onPressed: () {
              googleMapController.animateCamera(


                //To set new camera position
                /*CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(28.630896, 77.286937),
                    zoom: 14.0,
                    tilt: 50.0,
                    bearing: 45.0,),
                ),*/
                CameraUpdate.newLatLngZoom(
                  LatLng(28.6419017,77.3204413),
                  18.0, // Zoom factor
                ),

                // This sets the camera between two LatLngs.
                /*CameraUpdate.newLatLngBounds(
                  LatLngBounds(
                    southwest: LatLng(28.630896, 77.286937),
                    northeast: LatLng(28.6419017,77.3204413),
                  ),
                  32.0,           //higher padding to bring the cities in the map.
                ),*/
              );

              //Simply scrolls the map in the X and/or Y direction by a certain amount.

              /*googleMapController.animateCamera(
              CameraUpdate.scrollBy(50.0, 50.0),
              );*/

              //Simply zoom in and zoom out and zoom by
             /* googleMapController.animateCamera(
                CameraUpdate.zoomIn(),
              );

              googleMapController.animateCamera(
                CameraUpdate.zoomOut(),
              );

              googleMapController.animateCamera(
                CameraUpdate.zoomBy(4.0),
              );

              Zooms to the specific factor.

              googleMapController.animateCamera(
                CameraUpdate.zoomTo(5.0),
              );
              */
            }),
      ),
    );
  }

//--------------Methods---------------------
  void _CheckPermission() async {
    Map<PermissionGroup,
        PermissionStatus> permissions = await PermissionHandler()
        .requestPermissions([PermissionGroup.contacts]);
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    //bool isOpened = await PermissionHandler().openAppSettings();  // To open permission setting of app.
    bool isShown = await PermissionHandler()
        .shouldShowRequestPermissionRationale(PermissionGroup.contacts);
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
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => exit(0), //Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          );
        }
    ) ?? false;
  }


}

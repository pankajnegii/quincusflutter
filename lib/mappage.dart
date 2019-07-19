import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'drawerclass.dart';
import 'values.dart';

class MyMapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPage();
  }
}

class _MapPage extends State<MyMapPage> {
  bool locationPermission = false;
  GoogleMapController googleMapController;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();


  Widget build(BuildContext context) {
    //_CheckPermission();           // TODO

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
              height: MediaQuery.of(context).size.height - 90.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                //Help : https://medium.com/flutter-community/exploring-google-maps-in-flutter-8a86d3783d24
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                  _controller.complete(controller);

                },
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                  target: LatLng(28.630896, 77.286937),
                  zoom: 15.0,
                  tilt: 50.0,
                  bearing: 45.0,
                ),
                markers: markers,
                myLocationEnabled: true,
                //myLocationEnabled: locationPermission
                // rotateGesturesEnabled: false,
                //scrollGesturesEnabled: false,
                //tiltGesturesEnabled: false,
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: RaisedButton(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                shape: CircleBorder(side: BorderSide.none),
                color: greenColor(),
                child: Icon(
                  Icons.zoom_in,
                  size: 35.0,
                ),
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
                      LatLng(28.6419017, 77.3204413),
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
                },
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              shape: CircleBorder(side: BorderSide.none),
              color: Colors.red,
              child: Icon(
                Icons.location_on,
                size: 35.0,
              ),
              onPressed: () {
                _getCurrentLocation();

                //test on 19-07-2019
                // Create a new marker
               /* Marker resultMarker = Marker(
                  markerId: MarkerId("1"),
                  infoWindow: InfoWindow(
                      title: "Title here",
                      snippet: "Content here"),
                  position: LatLng(28.6419017, 77.3204413),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                );
                // Add it to Set
                markers.add(resultMarker);*/

                /*// Create a new marker
                Marker resultMarker = Marker(
                  markerId: MarkerId(responseResult.name),
                  infoWindow: InfoWindow(
                      title: "${responseResult.name}",
                      snippet: "${responseResult.types?.first}"),
                  position: LatLng(responseResult.geometry.location.lat,
                      responseResult.geometry.location.lng),
                );
                // Add it to Set
                markers.add(resultMarker);
                */


               /* googleMapController.addMarker(
                  MarkerOptions(
                    position: LatLng(37.4219999, -122.0862462),
                    infoWindowText: InfoWindowText("Title", "Content"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                  ),
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }

//--------------Methods---------------------
  void _changePermission() {
    setState(() {
      locationPermission = true;
    });
  }

  void _CheckPermission() async {
    if (!locationPermission) {
      print("asking for permission");

      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.locationAlways]);

      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.locationAlways);

      if (permission == PermissionStatus.granted) {
        print("asking for permission : true");
        _changePermission();
      }
    }

    // bool isOpened = await PermissionHandler().openAppSettings();
    //bool isOpened = await PermissionHandler().openAppSettings();  // To open permission setting of app.
    /* bool isShown = await PermissionHandler()
        .shouldShowRequestPermissionRationale(PermissionGroup.locationAlways);*/
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
            }) ??
        false;
  }

  void _getCurrentLocation() async {
    // Help : https://pub.dartlang.org/packages/geolocator
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark[0].position); //Lat: 28.630382899999997, Long: 77.2861467
    print(placemark[0].isoCountryCode); //IN
    print(placemark[0].country); //India
    print(placemark[0].name); //Patparganj Road
    print(placemark[0].postalCode); //110092
    print(placemark[0].administrativeArea); //Delhi
    print(placemark[0].subAdministrativeArea); //East Delhi
    print(placemark[0].locality); //New Delhi
    print(placemark[0].subLocality); //Shakarpur Khas
    print(placemark[0].thoroughfare); //Patparganj Road
    print(placemark[0].subThoroughfare); //  NULL

    //test on 19-07-2019
    // Create a new marker
    Marker resultMarker = Marker(
      markerId: MarkerId(position.latitude.toString()),
      infoWindow: InfoWindow(
          title: "Title here",
          snippet: "Content here"),
      position: LatLng(position.latitude,position.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen),
    );
    // Add it to Set
    markers.add(resultMarker);
    //googleMapController.removeMarker(marker)
  }
}

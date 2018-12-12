import 'package:flutter/material.dart';
import 'shipmentdata.dart';
import 'login.dart';
import 'main.dart ';
import 'shipment.dart';
import 'values.dart';
import 'MyApiCall.dart';
import 'loginapi.dart';
import 'mappage.dart';
import 'homepage.dart';
import 'static_map_image.dart';
class MyDrawer extends StatelessWidget {
  static const String _AccountName = 'Pankaj Negi';
  static const String _AccountEmail = 'test@examples.com';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        padding: const EdgeInsets.all(0.0),
        children: <Widget>[

          // This is drawee header....
          // HELP From:https://engineering.classpro.in/flutter-1-navigation-drawer-routes-8b43a201251e
          //Drawee header starts
          new UserAccountsDrawerHeader(
            decoration: new BoxDecoration( //header box decoration
              shape: BoxShape.rectangle,
              color: drawerHeaderColor(),
            ),
            accountName: const Text(_AccountName),
            accountEmail: const Text(_AccountEmail),
            currentAccountPicture: new Container( //for circular image
                width: 190.0,
                height: 190.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/DP.png'),
                    )
                )),

            otherAccountsPictures: <Widget>[
              new GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: new Icon(Icons.close,),

              )
            ],


          ), //Drawee header ends
          //Drawer items
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('DashBoard'),
            onTap: () {
              Navigator.pop(context);       // this line closes(pop) the drawer, not the page
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyShipmentPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Shipment'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyShipmentData()));
            },
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('History'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: 'My home page')));
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: 'My home page')));
            },
          ),
          Divider(
            color: Colors.black87,
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              //The MaterialPageRoute is handy because it transitions to the new screen using a platform-specific animation.
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: 'My home page')));
            },
          ),
          ListTile(
            leading: Icon(Icons.panorama),
            title: Text('Api Call'),
            onTap: () {
              Navigator.pop(context);
              //The MaterialPageRoute is handy because it transitions to the new screen using a platform-specific animation.
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyApiCall()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Login Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyLoginPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Login Page With API'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyLoginPageAPI()));
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map Testing'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyMapPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Static Map Image Testing'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyStaticMapImage(title: 'Static Map Image Testing',)));
            },
          ),
        ],
      ),
    );
  }

/*_onTapOtherAccounts(BuildContext context) {
    Navigator.of(context).pop();
    */ /*showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('Account switching not implemented.'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );*/ /*
  }*/

}
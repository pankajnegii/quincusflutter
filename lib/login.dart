import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shipment.dart';
import 'values.dart';


class MyLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<MyLoginPage> {

  bool _obscureText = true;

  // String _password = "";
  final TextEditingController controllerPassword = new TextEditingController(
      text: '87654321'); // way to get/set value of textformfield
  final TextEditingController controllerEmail = new TextEditingController(
      text: 'test@examples.com');

  //SharedPreferences pref = await SharedPreferences.getInstance();


  Widget build(BuildContext context) {
    //Something new here
    final logo = Center( //Center is also used to be able to change the container size irrespective of other childs.
        child: Container(
            margin: EdgeInsets.only(bottom: 100.0),
            width: 250.0,
            height: 60.0,
            decoration: new BoxDecoration(
              /*shape: BoxShape.rectangle,
                border: Border.all(
                    color: themeColor(), width: 1.0, style: BorderStyle.solid),*/
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/logo.png'),
                )
            )
        )
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      //autofocus: false,
      controller: controllerEmail,
      style: TextStyle(color: editTextColor(), fontSize: 15.0),
      //initialValue: 'test@examples.com',
      decoration: new InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.white,),
        hintStyle: TextStyle(color: hintColor()),
        hintText: 'UserName',
        //labelText: 'Email',
        //enabledBorder: ,
        focusedBorder: OutlineInputBorder( //if focused
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: boxBorder(), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: boxBorder(), width: 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
      ),
    );

    final password = new Container(

      height: 45.0,
      decoration: new BoxDecoration(
        border: new Border.all(
            color: boxBorder(),
            width: 1.0,
            style: BorderStyle.solid
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 6, //to adjust size
            child: new TextFormField(
              //autofocus: false,
              // onFieldSubmitted: focusNode.unfocus(),
              textAlign: TextAlign.left,
              controller: controllerPassword,
              style: TextStyle(color: editTextColor(), fontSize: 15.0),
              // validator: (val) => val.length < 6 ? 'Password too short.' : null,
              // onSaved: (val) => _password = val,
              obscureText: _obscureText,
              decoration: new InputDecoration(
                prefixIcon: Icon(Icons.vpn_key, color: Colors.white,),
                hintStyle: TextStyle(color: hintColor()),
                hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: InputBorder.none,
                //border: OutlineInputBorder(borderSide:  BorderSide(color: Colors.green),),     //to check size
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: new IconButton(icon: _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility,
                  color: boxBorder()),
                onPressed: _toggle,
                padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              )
          ),
        ],

      ),
    );

    final loginButton = new RaisedButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),),
      color: buttonColor(),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
            height: 45.0,

            ///padding: EdgeInsets.only(top: 5.0),
            //color: Colors.red,            //IMP : just to check textbox size for alignment issue.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //to place text and icon at start and End of row.
              children: <Widget>[
                Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  textAlign: TextAlign.left,),
                Icon(Icons.arrow_forward, color: Colors.white,)
              ],
            )


        ),
      ),
      // On login click
      onPressed: () {
        SystemChannels.textInput.invokeMethod(
            'TextInput.hide'); //to hide keyboard when clicked outside
        _checkLoginSuccess();
      },

    );

    final forgotLabel = new Container(
        margin: EdgeInsets.only(bottom: 120.0),
        child: new FlatButton(
          child: Text(
            'Forgot Password?', style: TextStyle(color: Colors.white),),
          onPressed: () {},
        )
    );

    //

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //to avoid page resizing when keyboard opens
      body: GestureDetector(
          onTap: () {
            SystemChannels.textInput.invokeMethod(
                'TextInput.hide'); //to hide keyboard when clicked outside
          },
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  logo,
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 8.0),
                  loginButton,
                  SizedBox(height: 8.0),
                  forgotLabel,
                ],
              ),
            ), //
          )
      ),
    );
  }

//--------------Methods---------------------
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _checkLoginSuccess() async {
    //To save login id and password
    SharedPreferences prefSave = await SharedPreferences.getInstance();
    prefSave.setString('email', 'test@examples.com');
    prefSave.setString('password', '87654321');
    //

    SharedPreferences pref = await SharedPreferences.getInstance();
    if (controllerEmail.text == pref.get('email') &&
        controllerPassword.text == pref.get('password')) {
      _showToast("Successfully Login");
      //Navigator.pop(context);
      //The MaterialPageRoute is handy because it transitions to the new screen using a platform-specific animation.
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              MyShipmentPage()));
    }
    else {
      _showToast("Some Login Issue");
    }
  }

  void _showToast(String text) {
    Fluttertoast.showToast(
      msg: "Result : " + text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      /*bgcolor: '#3EA7DC',
      textcolor: '#FFFFFF',*/
    );
  }

  void _showSignUpPage() {
    //TODO later
    //Make rest of the login widgets visibility gone.


  }
}
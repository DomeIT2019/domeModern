import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Explicit
  double myWidth = 90.0;
  String nameApp = 'โมเดิร์นเฟอร์นิเจอร์';

// Method
  Widget mySizebox() {
    return SizedBox(
      height: 16.0,
    );
  }

  Widget signUP() {
    return Container(
      width: 240.0,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.orange[700]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Text('SIGN UP'),
        onPressed: () {},
      ),
    );
  }

  Widget signIn() {
    return Container(
      width: 240.0,
      child: RaisedButton(
        color: Colors.orange[700],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        child: Text(
          'SIGN IN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: myWidth,
        height: myWidth,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      nameApp,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.orange[900],
        fontWeight: FontWeight.bold,
        fontFamily: 'Mitr',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.orange[400]],
            radius: 1.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizebox(),
            showAppName(),
            signIn(),
            signUP(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit
  Color myBlue = Color.fromARGB(255, 239, 108, 147);

  // Method
  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.orange[800]),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[800])),
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: Colors.orange[800],
        ),
        labelText: 'Name :',
        labelStyle: TextStyle(color: Colors.orange[800]),
        helperText: 'Type Display Name',
        helperStyle: TextStyle(color: Colors.orange[800]),
        hintText: 'English Only',
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      style: TextStyle(color: Colors.orange[800]),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[800])),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.orange[800],
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: Colors.orange[800]),
        helperText: 'Type Yoyr Email',
        helperStyle: TextStyle(color: Colors.orange[800]),
        hintText: 'you@demo.com',
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: Colors.orange[800]),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[800])),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.orange[800],
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.orange[800]),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: Colors.orange[800]),
        hintText: '6-8 Digit',
      ),
    );
  }

  Widget upload() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Your Click Upload');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          upload(),
        ],
        backgroundColor: myBlue,
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 24.0),
          width: 300.0,
          child: Column(
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}

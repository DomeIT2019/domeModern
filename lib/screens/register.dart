import 'package:dome_modern/screens/my_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit
  Color myBlue = Color.fromARGB(255, 239, 108, 147);
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: myBlue),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: myBlue)),
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: myBlue,
        ),
        labelText: 'Name :',
        labelStyle: TextStyle(color: myBlue),
        helperText: 'Type Display Name',
        helperStyle: TextStyle(color: myBlue),
        hintText: 'English Only',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: myBlue),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: myBlue)),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: myBlue,
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: myBlue),
        helperText: 'Type Yoyr Email',
        helperStyle: TextStyle(color: myBlue),
        hintText: 'you@demo.com',
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Keep Email Format you@demo.com';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: myBlue),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: myBlue)),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: myBlue,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: myBlue),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: myBlue),
        hintText: '6-8 Digit',
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'More 6 Digit For Password';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget upload() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Your Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, email = $emailString, password = $emailString');
          registerFirebase();
        }
      },
    );
  }

// Create Thread for upload email and Password to Authen of Firebase
  Future<void> registerFirebase() async {
    // Create Instanace on Object123



    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success');
      setUPDisplayName();
    }).catchError((response) {
      print('Error ==> ${response.toString()}');
      String title = response.code;
      String message = response.message;
      //alert popup
      myAlert(title, message);
    });
  }

  Future<void> setUPDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

    // Create Route Without Arrow Back
    var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);



    });
  }

  Widget alerButtont() {
    return FlatButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  Widget showTitle(String titleString) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.orange[800],
      ),
      title: Text(
        titleString,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void myAlert(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(titleString),
          content: Text(messageString),
          actions: <Widget>[alerButtont()],
        );
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

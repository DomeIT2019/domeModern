import 'package:dome_modern/screens/home.dart';
import 'package:flutter/material.dart';

// This is Constructor
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

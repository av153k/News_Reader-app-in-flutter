import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("homepage_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          body: Stack(),
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://i.pinimg.com/236x/6c/7a/95/6c7a95e91efef1221dd3002b7f196503.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                    child: Text(
                      "A long title",
                      style: GoogleFonts.crimsonText(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 30),
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

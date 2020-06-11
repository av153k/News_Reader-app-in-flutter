import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_reader/assets/common_functions.dart';
import 'package:news_reader/assets/options_to_pick.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownCountryValue = "wl";
  String dropdownCategoryValue = "All";
  List<String> countryList = countriesList();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "News Reader",
          style: GoogleFonts.crimsonText(
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ], borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: DropdownButton<String>(
                      value: dropdownCountryValue,
                      icon: Icon(Octicons.triangle_down),
                      iconSize: 20,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(height: 2, color: Colors.white),
                      style: GoogleFonts.crimsonText(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          color: Colors.black),
                      onChanged: (String newValue) {
                        setState(
                          () {
                            dropdownCountryValue = newValue;
                          },
                        );
                      },
                      items: countryList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: getCountry(value),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ], borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: DropdownButton<String>(
                      value: dropdownCategoryValue,
                      icon: Icon(Octicons.triangle_down),
                      iconSize: 20,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(height: 2, color: Colors.white),
                      style: GoogleFonts.crimsonText(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                          color: Colors.black),
                      onChanged: (String newValue) {
                        setState(
                          () {
                            dropdownCategoryValue = newValue;
                          },
                        );
                      },
                      items: categories.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Flexible(
                              child: Text(
                                " $value",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              "Top Headlines",
              style: GoogleFonts.crimsonText(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
                  color: Colors.black),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              elevation: 9,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Container(width: MediaQuery.of(context).size.width*0.20,
                    child: Image(
                      image: AssetImage(
                          "lib/assets/images/homepage_background.jpg"),
                    ),),
                    Column(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "This is the headline of today's news that you are viewing.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

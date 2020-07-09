import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_reader/assets/common_functions.dart';
import 'package:news_reader/assets/options_to_pick.dart';
import 'package:news_reader/api_models/base_model.dart';
import 'package:news_reader/api_services/get_data.dart';
import 'package:news_reader/screens/views/card_view.dart';
import 'package:news_reader/screens/views/compact_view.dart';

NewsApiCallback _newsApiCallback = new NewsApiCallback();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownCountryValue = "in";
  String dropdownCategoryValue = "All";
  List<String> countryList = countriesList();

  Future<NewsClass> _newsClassFunc() {
    return _newsApiCallback.getNewsData(
        dropdownCountryValue, dropdownCategoryValue);
  }

  Future<NewsClass> _newsClass;

  //for changing the views
  Widget _currentView;
  IconData _viewChangeIcon = Icons.view_agenda;

  @override
  void initState() {
    super.initState();
    _newsClass = _newsClassFunc();
    _currentView = futureCompact(_newsClass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              "News Reader",
              style: GoogleFonts.crimsonText(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                            _newsClass = _newsClassFunc();
                            if (_viewChangeIcon == Icons.view_list) {
                              _currentView = futureCard(_newsClass);
                            } else {
                              _currentView = futureCompact(_newsClass);
                            }
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
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1),
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
                            _newsClass = _newsClassFunc();
                            if (_viewChangeIcon == Icons.view_list) {
                              _currentView = futureCard(_newsClass);
                            } else {
                              _currentView = futureCompact(_newsClass);
                            }
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    "Top Headlines",
                    style: GoogleFonts.crimsonText(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 30),
                        color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: Icon(_viewChangeIcon),
                  onPressed: () {
                    setState(
                      () {
                        if (_viewChangeIcon == Icons.view_list) {
                          _viewChangeIcon = Icons.view_agenda;
                          _currentView = futureCompact(_newsClass);
                        } else {
                          _viewChangeIcon = Icons.view_list;
                          _currentView = futureCard(_newsClass);
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
          _currentView,
        ],
      ),
    );
  }
}

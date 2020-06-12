import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_reader/assets/common_functions.dart';
import 'package:news_reader/assets/options_to_pick.dart';
import 'package:news_reader/api_models/base_model.dart';
import 'package:news_reader/api_services/get_data.dart';

NewsApiCallback _newsApiCallback = new NewsApiCallback();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownCountryValue = "in";
  String dropdownCategoryValue = "Technology";
  List<String> countryList = countriesList();

  Future<NewsClass> _newsClassFunc() {
    return _newsApiCallback.getNewsData(
        dropdownCountryValue, dropdownCategoryValue);
  }

  Future<NewsClass> _newsClass;

  @override
  void initState() {
    super.initState();
    _newsClass = _newsClassFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        shrinkWrap: true,
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
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              "Top Headlines",
              style: GoogleFonts.crimsonText(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
                  color: Colors.black),
            ),
          ),
          FutureBuilder(
            future: _newsClass,
            builder:
                (BuildContext context, AsyncSnapshot<NewsClass> _newsSnapshot) {
              if (_newsSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount: _newsSnapshot.data.totalResults,
                itemBuilder: (context, index) {
                  Articles _article = _newsSnapshot.data.articles[index];
                  return getNewscard(context, _article.title,
                      _article.source.name, _article.urlToImage);
                },
              );
            },
          ),
          
        ],
      ),
    );
  }
}

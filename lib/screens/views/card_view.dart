import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:news_reader/api_models/base_model.dart';
import "package:news_reader/assets/common_functions.dart";
import "package:flutter_icons/flutter_icons.dart";


Widget getNewsCard(
    BuildContext context, String title, String source, String imageUrl) {
  return Column(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Card(
          elevation: 9,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: getImage(context, imageUrl),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    "$title",
                    style: GoogleFonts.crimsonText(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                        color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Source",
                        style: GoogleFonts.crimsonText(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                            color: Colors.black),
                      ),
                      Icon(
                        Octicons.triangle_right,
                        size: 18,
                      ),
                      Flexible(
                        child: Text(
                          "$source",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.crimsonText(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      )
    ],
  );
}

Widget futureCard(Future<NewsClass> _newsClass) {
  return FutureBuilder(
    future: _newsClass,
    builder: (BuildContext context, AsyncSnapshot<NewsClass> _newsSnapshot) {
      if (_newsSnapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.black),
        );
      }
      return Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            itemCount: _newsSnapshot.data.articles.length,
            itemBuilder: (context, index) {
              Articles _article = _newsSnapshot.data.articles[index];
              return getNewsCard(context, _article.title, _article.source.name,
                  _article.urlToImage);
            },
          ),
        ],
      );
    },
  );
}

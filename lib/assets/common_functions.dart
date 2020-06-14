import "package:flutter/material.dart";
import "package:flag/flag.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:news_reader/assets/options_to_pick.dart";

Widget getCountry(String code) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Flag(
            code,
            height: 20,
            width: 30,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            "${countries[code]}",
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    ),
  );
}

Widget getText(
  String text1,
) {
  return Flexible(
    fit: FlexFit.loose,
    child: Text(
      "$text1",
      style: GoogleFonts.crimsonText(
          textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          color: Colors.black),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget getImage(BuildContext context, String imageUrl) {
  if (imageUrl == null) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Icon(Icons.broken_image, size: 50),
    );
  } else {
    return Image.network(
      imageUrl,
      height: MediaQuery.of(context).size.height * 0.25,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
      errorBuilder: (context, url, error) => Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Icon(Icons.broken_image, size: 50),
      ),
    );
  }
}

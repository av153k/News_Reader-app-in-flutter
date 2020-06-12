import "package:flutter/material.dart";
import "package:flag/flag.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:news_reader/assets/options_to_pick.dart";

Widget getCountry(String code) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        getFlagIcon(code),
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

Widget getFlagIcon(String code) {
  if (code == "wl") {
    return Container(
      child: Icon(Octicons.globe, size: 25),
    );
  } else {
    return Container(
      child: Flag(
        code,
        height: 20,
        width: 30,
      ),
    );
  }
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

Widget getNewscard(
    BuildContext context, String title, String source, String imageUrl) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    child: Card(
      elevation: 9,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(child: getImage(imageUrl)),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                children: <Widget>[
                  Text(
                    "$title",
                    style: GoogleFonts.crimsonText(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                        color: Colors.black),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
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
                      Text(
                        "$source",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.crimsonText(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget getImage(String imageUrl) {
  if (imageUrl == null) {
    return Icon(Icons.broken_image);
  } else {
    return Image.network(imageUrl, fit: BoxFit.fitHeight);
  }
}

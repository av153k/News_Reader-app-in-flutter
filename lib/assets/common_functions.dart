import "package:flutter/material.dart";
import "package:flag/flag.dart";
import 'package:flutter_icons/flutter_icons.dart';
import "package:news_reader/assets/options_to_pick.dart";

Container getCountry(String code) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        getFlagIcon(code),
        SizedBox(width: 10,),
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

Container getFlagIcon(String code) {
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

Card getNewscard() {
  
}

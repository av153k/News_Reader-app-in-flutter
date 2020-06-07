import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedWelcome extends StatefulWidget {
  @override
  State<AnimatedWelcome> createState() => new _AnimatedWelcomeState();
}

class _AnimatedWelcomeState extends State<AnimatedWelcome> {
  double _height = 660.0;
  Timer _timerLogo;
  Timer _timerLogin;
  Timer _timerSignup;
  Timer _timerImage;
  Timer _timerScaffold;
  double _alignmentXLogin = 5.0;
  double _alignmentXSignup = 5.0;
  double _opacityLogo = 0.0;

  _AnimatedWelcomeState() {
    _timerLogo = new Timer(Duration(milliseconds: 1600), () {
      setState(() {
        _opacityLogo = 1.0;
      });
    });
    _timerLogo = new Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _height = 400.0;
      });
    });
    _timerLogin = new Timer(Duration(milliseconds: 5500), () {
      setState(() {
        _alignmentXLogin = 0.04;
      });
    });
    _timerSignup = new Timer(Duration(milliseconds: 6500), () {
      setState(() {
        _alignmentXSignup = 0.04;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timerLogo.cancel();
    _timerLogin.cancel();
    _timerSignup.cancel();
    _timerImage.cancel();
    _timerScaffold.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacityLogo,
              curve: Curves.linear,
              child: AnimatedContainer(
                color: Colors.transparent,
                height: _height,
                alignment: Alignment.center,
                child: Text(
                  "News Reader",
                  style: GoogleFonts.crimsonText(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                ),
                duration: Duration(seconds: 2),
                curve: Curves.elasticOut,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
                    alignment: Alignment(_alignmentXLogin, 0),
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(70),
                            shape: BoxShape.rectangle),
                        child: Text(
                          "Log In",
                          style: GoogleFonts.crimsonText(
                            color: Colors.white,
                            textStyle: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    duration: Duration(seconds: 2),
                    curve: Curves.elasticOut,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AnimatedContainer(
                      alignment: Alignment(_alignmentXSignup, 0),
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: BoxDecoration(
                              //color: Colors.black,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(70),
                              shape: BoxShape.rectangle),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.crimsonText(
                              color: Colors.black,
                              textStyle: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      duration: Duration(seconds: 2),
                      curve: Curves.elasticOut)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

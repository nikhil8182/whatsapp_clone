import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          fontFamily: "GoogleFonts.openSans()",
          primaryColor: new Color(0xff075e54),
          accentColor: new Color(0xff25d366)),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

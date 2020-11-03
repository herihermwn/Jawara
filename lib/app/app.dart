import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//? -----------------
/// [Constant Color]
//? -----------------
Color get whiteColor => Colors.white;
Color get darkTextColor => Color(0xFF747474);
Color get inputBackgroundColor => Color(0xFFEEEEEE);
Color get scaffoldBackgroundColor => Color(0xFFF8F8F8);
Color get yellowColor => Color(0xFFF9C12D);
Color get purpleColor => Color(0xFF503E9D);
Color get greenColor => Color(0xFF3E9D9D);

//? Color from icon App
Color get iconColor1 => Color(0xFF1db0e6);
Color get iconColor2 => Color(0xFF088a4a);
Color get iconColor3 => Color(0xFF17ab56);
Color get iconColor4 => Color(0xFFfdb714);
Color get iconColor5 => Color(0xFFffcc0a);

//? ----------------------
/// [Constant ThemeData]
//? ----------------------
ThemeData get appTheme => ThemeData(
      primaryColor: iconColor1,
      accentColor: iconColor4,
      cardColor: whiteColor,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.black87
      ),
    );

//? -------------------
/// [Constant Shadow]
//? -------------------
List<BoxShadow> get boxShadowBottom => [
      BoxShadow(
        color: Color(0xff747474).withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 8,
        offset: Offset(2, 4), // changes position of shadow
      ),
    ];

List<BoxShadow> get boxShadowAbove => [
      BoxShadow(
        color: Color(0xff747474).withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 8,
        offset: Offset(-2, -4), // changes position of shadow
      ),
    ];

//? -------------------
/// [Assets Location]
//? -------------------
String imageAsset = "assets/images";

//? ------------------
/// [Constant AppBar]
//? ------------------
PreferredSize get noAppBar => PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
    );

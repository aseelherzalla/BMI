import 'package:flutter/material.dart';

class ThemeHelper{
  ThemeHelper._();

  static ThemeHelper themeHelper = ThemeHelper._();
  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor:Color(0xFF1588d8) ,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold
      )
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color:Color(0xFF1588d8),
        ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color:Color(0xFF1588d8),
         ),
       headline3: TextStyle(
         fontSize: 15,
        color:Color(0xFF1588d8),

       ),
       headline4: TextStyle(
         fontSize: 16,
        color:Colors.black,
    ),
     headline5: TextStyle(
         fontSize: 13,
        color:Colors.grey,
    ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle:MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
           EdgeInsets.symmetric(
             vertical: 10
           ),
         ),
        backgroundColor: MaterialStateProperty.all<Color>(
           Color(0xFF1588d8)
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 48)
        )
      ),
    )
  );
}
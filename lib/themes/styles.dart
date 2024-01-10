import 'package:flutter/material.dart';

const Color primaryColor = Colors.white;
const Color secondaryColor = Colors.orange;

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: primaryColor,
    onPrimary: Colors.black,
    secondary: secondaryColor,
  ),
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.deepOrangeAccent,
    selectionColor: Colors.deepOrangeAccent,
    selectionHandleColor: Colors.deepOrangeAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);

const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Colors.orange;

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: darkPrimaryColor,
    onPrimary: Colors.black,
    secondary: darkSecondaryColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.deepOrangeAccent,
    selectionColor: Colors.deepOrangeAccent,
    selectionHandleColor: Colors.deepOrangeAccent,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius:  BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF6B38FB);

final TextTheme myTextTheme = TextTheme(
  headlineLarge: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headlineMedium:
  GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.w400),
  headlineSmall:
  GoogleFonts.merriweather(fontSize: 23, fontWeight: FontWeight.w400),
  bodyMedium: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodySmall: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
);
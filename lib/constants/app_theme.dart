import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const MaterialColor primarySwatch = Colors.amber;

  static const AppBarTheme appBarTheme = AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        );

  static ThemeData theme = ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(),
        primarySwatch: AppTheme.primarySwatch,
        appBarTheme: AppTheme.appBarTheme,
      );

}
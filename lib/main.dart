

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';
import 'package:rubiks/views/home_page.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
 
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor: Colors.white60,
    
      statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme : GoogleFonts.ralewayTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


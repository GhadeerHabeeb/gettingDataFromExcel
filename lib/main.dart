import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'dart:convert' as convert;

import 'package:untitled2/Feedback_Model.dart';
import 'package:untitled2/Lessons.dart';
import 'package:untitled2/my_home_page.dart';
import 'package:untitled2/stages_levels/Level1.dart';
import 'package:untitled2/stages_levels/Level2.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),

      routes: {
        SubjectsScreen.id:(context)=>SubjectsScreen(),
        Level1.id:(context)=>Level1(),
        Level2.id:(context)=>Level2(),
      },
    );
  }
}

import 'package:api_practice/dashboard/page_dashboard.dart';
import 'package:api_practice/page/font_practice.dart';
import 'package:api_practice/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FontPractice(),
    );
  }
}
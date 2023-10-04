import 'package:flutter/material.dart';
import 'package:mbti_test/startPage/startPage.dart';
import 'package:mbti_test/questionPage/questions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      //home: const startPage(title: 'Flutter Demo Home Page'),
      home: const startPage(),
    );
  }
}
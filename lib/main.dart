import 'package:flutter/material.dart';
import 'package:mbti_test/startPage/startPage.dart';

void main() {
  runApp(const MyTest());
}

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: startPage());
  }
}

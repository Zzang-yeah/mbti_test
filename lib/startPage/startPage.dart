import 'package:flutter/material.dart';

class startPage extends StatelessWidget {
  const startPage({super.key, required String title});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const startPage(title: 'Flutter Demo Home Page'),
    );
  }
}
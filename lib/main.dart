import 'package:bloc_1/features/home/ui/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
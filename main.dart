import 'package:flutter/material.dart';
import 'package:m05/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "M05 Teori",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

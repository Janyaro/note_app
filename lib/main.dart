import 'package:flutter/material.dart';
import 'package:note_app/Component/ReuseableBtn.dart';
import 'package:note_app/Screens/create_note.dart';
import 'package:note_app/Screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue,
          // brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(color: Colors.blue)),
      home: const HomeScreen(),
    );
  }
}

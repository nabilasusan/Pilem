import 'package:flutter/material.dart';
import 'package:flutter_film/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pilem'
      theme: ThemeData(primarySwatch: const Colors.fromARGB(255, 227, 126, 197)),
      home: const  HomeScreen(
      ),
      ),
  }
}

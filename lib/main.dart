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
      title: 'Film',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(

      ),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State MainScreen> createState() =>  MainScreenState();
}

class  MainScreen extends State MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen()
  ]
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

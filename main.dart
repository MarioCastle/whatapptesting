import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IQI Property',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(_isDarkMode),
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: () => setState(() => _isDarkMode = !_isDarkMode),
      ),
    );
  }
}

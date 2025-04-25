import 'package:flutter/material.dart';
import 'package:news_app/view/bottomnav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDF6EC), // Soft creamy white
        primaryColor: const Color(0xFF355070), // Muted navy blue
        cardColor: const Color(0xFFFBE4D8), // Soft peach-pink
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF355070), // AppBar navy
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF3E3E3E), fontSize: 16),
          bodyMedium: TextStyle(color: Color(0xFF3E3E3E), fontSize: 14),
          titleMedium: TextStyle(
            color: Color(0xFFB56576), // Accent: Dusty pink
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          primary: const Color(0xFF355070),
          secondary: const Color(0xFFB56576),
          background: const Color(0xFFFDF6EC),
          surface: const Color(0xFFFBE4D8), // Lighter container color
        ),
      ),
      home: Bottomnav(),
    );
  }
}

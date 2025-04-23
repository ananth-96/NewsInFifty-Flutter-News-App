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
        scaffoldBackgroundColor: Color(0xFF222831),
        primaryColor: Color(0xFF82A3A9),
        cardColor: Color(0xFF393E46),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF393E46),
          iconTheme: IconThemeData(color: Color(0xFFEEEEEE)),
          titleTextStyle: TextStyle(
            color: Color(0xFFEEEEEE),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFEEEEEE), fontSize: 16),
          bodyMedium: TextStyle(color: Color(0xFFEEEEEE), fontSize: 14),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF82A3A9),
          secondary: Color(0xFFEEEEEE),
          background: Color(0xFF222831),
          surface: Color(0xFF393E46),
        ),
      ),
      home: Bottomnav(),
    );
  }
}

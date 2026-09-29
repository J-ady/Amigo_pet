import 'package:flutter/material.dart';
import 'pages/cuidadores.dart';

void main() {
  runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AmigoPet',

      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor:
        const Color(0xFFFEE7C5),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF057ED9),
          primary: const Color(0xFF057ED9),
          secondary: const Color(0xFF04CAEF),
          surface: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color(0xFF00428E),
          foregroundColor: Colors.white,
        ),

        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF057ED9),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF00428E),
            side: const BorderSide(
              color: Color(0xFF057ED9),
              width: 1.5,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),

      home: const CuidadoresPage(),
    );
  }
}
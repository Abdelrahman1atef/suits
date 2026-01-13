import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:suits/views/home/view.dart';
import 'package:suits/views/login.dart';


void main() {
  runApp(
    DevicePreview(enabled: false, builder: (context) => const Suits(),),
  );
}

class Suits extends StatelessWidget {
  const Suits({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: "Montserrat",
            color: Color(0xFF101623),
            fontVariations: [FontVariation("wght", 700)],
            fontSize: 22,
          ),
          headlineMedium: TextStyle(
            fontFamily: "Montserrat",
            color: Color(0xFF000000),
            fontVariations: [FontVariation("wght", 600)],
            fontSize: 18,
          ),
          titleLarge: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFF101623),
            fontVariations: [FontVariation("wght", 700)],
            fontSize: 32,
          ),
          titleMedium: TextStyle(
            fontFamily: "Montserrat",
            color: Color(0xFF000000),
            fontVariations: [FontVariation("wght", 600)],
            fontSize: 16,
          ),
          bodyLarge: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFF000000),
            fontVariations: [FontVariation("wght", 700)],
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFFFFFFFF),
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontFamily: "Arial",
            color: Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
          displayLarge: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFF284243),
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 40,
          ),
          displayMedium: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFF284243),
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 20,
          ),
          displaySmall: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFFFFFFFF),
            fontVariations: [FontVariation("wght", 400)],
            fontSize: 20,
          ),
          labelLarge: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFFA1A8B0),
            fontVariations: [FontVariation("wght", 400)],
            fontSize: 16,
          ),
          labelMedium: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFFDD8560),
            fontVariations: [FontVariation("wght", 500)],
            fontSize: 15,
          ),
          labelSmall: TextStyle(
            fontFamily: "Inter",
            color: Color(0xFF000000),
            fontVariations: [FontVariation("wght", 400)],
            fontSize: 18,
          ),
        ),
          primaryColor: const Color(0xFFDD8560),
        scaffoldBackgroundColor: const Color(0xFFF4F5F7),
        hintColor: const Color(0xFFA1A8B0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDD8560),
          primary: const Color(0xFF101623),
          onPrimary: const Color(0xFFFFFFFF),
          secondary: const Color(0xFFFFFFFF),
          onSecondary: const Color(0xFF000000),
          tertiary: const Color(0xFF3B4453),
          onTertiary: const Color(0xFF717784),

          outline: const Color(0xFFE5E7EB),
          outlineVariant: const Color(0xFFAFAFAF),
          surface: const Color(0xFFFFFFFF),
          error: const Color(0xFFF40000),
          errorContainer: const Color(0xFFFE0000),
        ),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoli/utils/app_colors.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          background: AppColors.background,
          onSurface: AppColors.secondary,
          secondary: AppColors.secondary,
        ),
        iconTheme: const IconThemeData(color: AppColors.secondary),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent
        ),
        textTheme: GoogleFonts.outfitTextTheme(textTheme).apply(
          bodyColor: AppColors.secondary,
          displayColor: AppColors.secondary,
        ),
        useMaterial3: true,
        //   .copyWith(
        // textTheme: GoogleFonts.outfitTextTheme(textTheme).apply(
        //   fontFamily: GoogleFonts.outfit().fontFamily
        // )
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackizer',
      debugShowCheckedModeBanner: false,
      theme: kTrackizerTheme,
      home: const WelcomeScreen(),
    );
  }
}

final ThemeData kTrackizerTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: kGrey80,
    textTheme: GoogleFonts.interTextTheme(base.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: MaterialStateOutlineInputBorder.resolveWith((states) {
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: kGrey70, width: 1.0),
        );
      }),
    ),
    checkboxTheme: base.checkboxTheme.copyWith(
      side: const BorderSide(color: kGrey70, width: 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0.0,
    ),
  );
}

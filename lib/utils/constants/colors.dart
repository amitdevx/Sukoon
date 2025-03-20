import 'package:flutter/material.dart';
class MyColors {
  const MyColors._();


  // App basic Color 
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondry = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);



  // Gradient colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color.fromARGB(255, 255, 119, 119),
      Color.fromARGB(255, 248, 206, 206),
      Color.fromARGB(255, 244, 211, 211),
  ]); 


  // Text colors 
  static const Color textPrimery = Color(0xFF333333);
  static const Color textSecondry = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background color 
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background container color 
  static const Color lightConatiner = Color(0xFFF6F6F6);
  static Color darkConatiner = MyColors.white.withOpacity(0.1);

  // Button color 
  static const Color buttonPrimery = Color(0xFF4b68ff);
  static const Color buttonSecondry = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFF6F6F6);


 //Border colors 
  static const Color borderPrimery = Color(0xFFD9D9D9);
  static const Color borderSecondry = Color(0xFFE6E6E6);

  //Error and Validation color 
  static const Color error = Color(0xFFE74C3C);
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFFFB900);
  static const Color info = Color.fromARGB(255, 0, 103, 172);

  //Natural Shades 
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F); 
  static const Color darkGrey = Color(0xFF939393); 
  static const Color grey = Color(0xFFE0E0E0); 
  static const Color softGrey = Color(0xFFF4F4F4); 
  static const Color lightGrey = Color(0xFFF9F9F9); 
  static const Color white = Colors.white;

}
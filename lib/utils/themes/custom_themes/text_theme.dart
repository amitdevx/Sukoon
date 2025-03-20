import 'package:flutter/material.dart';
class TTextTheme {
 const TTextTheme._();
//  light theme
 static TextTheme lightTextTheme = TextTheme(
  // headlines 
   headlineLarge:  TextStyle().copyWith(
     fontSize: 32,
     fontWeight: FontWeight.bold,
     color: Colors.black
   ),
   headlineMedium:  TextStyle().copyWith(
     fontSize: 24,
     fontWeight: FontWeight.w600,
     color: Colors.black
   ),
   headlineSmall:  TextStyle().copyWith(
     fontSize: 24,
     fontWeight: FontWeight.w600,
     color: Colors.black
   ),
// titles 
   titleLarge: TextStyle().copyWith(
     fontSize: 16,
     fontWeight: FontWeight.w600,
     color: Colors.black
   ),

   titleMedium: TextStyle().copyWith(
     fontSize: 16,
     fontWeight: FontWeight.w500,
     color: Colors.black
   ),
   titleSmall: TextStyle().copyWith(
     fontSize: 16,
     fontWeight: FontWeight.w400,
     color: Colors.black
   ),
   
   //body
   bodyLarge: TextStyle().copyWith(
     fontSize: 14,
     fontWeight: FontWeight.w500,
     color: Colors.black
   ),
   bodyMedium: TextStyle().copyWith(
     fontSize: 14,
     fontWeight: FontWeight.normal,
     color: Colors.black
   ),
   bodySmall: TextStyle().copyWith(
     fontSize: 14,
     fontWeight: FontWeight.w500,
     color: Colors.black.withOpacity(0.5)
   ),

  //  lable 
   labelLarge: TextStyle().copyWith(
     fontSize: 12,
     fontWeight: FontWeight.normal,
     color: Colors.black
   ),
   labelMedium: TextStyle().copyWith(
     fontSize: 12,
     fontWeight: FontWeight.normal,
     color: Colors.black.withOpacity(0.5)
   ),
);



// dark text theme 
 static TextTheme darkTextTheme = TextTheme(
   // headlines 
   headlineLarge:  TextStyle().copyWith(
     fontSize: 32,
     fontWeight: FontWeight.bold,
     color: Colors.white
   ),
   headlineMedium:  TextStyle().copyWith(
     fontSize: 24,
     fontWeight: FontWeight.w600,
     color: Colors.white
   ),
   headlineSmall:  TextStyle().copyWith(
     fontSize: 24,
     fontWeight: FontWeight.w600,
     color: Colors.white
   ),
// titles 
   titleLarge: TextStyle().copyWith(
     fontSize: 16,
     fontWeight: FontWeight.w600,
     color: Colors.white
   ),

   titleMedium: TextStyle().copyWith(
     fontSize: 16,
     fontWeight: FontWeight.w500,
     color: Colors.white
   ),
   titleSmall: TextStyle().copyWith(
     fontSize: 16,
     fontWeight: FontWeight.w400,
     color: Colors.white
   ),
   
   //body
   bodyLarge: TextStyle().copyWith(
     fontSize: 14,
     fontWeight: FontWeight.w500,
     color: Colors.white
   ),
   bodyMedium: TextStyle().copyWith(
     fontSize: 14,
     fontWeight: FontWeight.normal,
     color: Colors.white
   ),
   bodySmall: TextStyle().copyWith(
     fontSize: 14,
     fontWeight: FontWeight.w500,
     color: Colors.white.withOpacity(0.5)
   ),

  //  lable 
   labelLarge: TextStyle().copyWith(
     fontSize: 12,
     fontWeight: FontWeight.normal,
     color: Colors.white
   ),
   labelMedium: TextStyle().copyWith(
     fontSize: 12,
     fontWeight: FontWeight.normal,
     color: Colors.white.withOpacity(0.5)
   ),

 );
}
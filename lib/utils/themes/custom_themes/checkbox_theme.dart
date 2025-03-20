import 'package:flutter/material.dart';

class TCheckboxTheme {
  const TCheckboxTheme._();

  // light 
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
   shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)
   ),
   // ignore: deprecated_member_use
   checkColor: MaterialStateProperty.resolveWith((states) {
    // ignore: deprecated_member_use
    if (states.contains(MaterialState.selected)) {
      return Colors.white;
      
    }else{
      return Colors.black;
    }
   }
   ),
   // ignore: deprecated_member_use
   fillColor: MaterialStateProperty.resolveWith((states) {
    // ignore: deprecated_member_use
    if (states.contains(MaterialState.selected)) {
      return Colors.blue;
      
    }else{
      return Colors.transparent;
    }
   }
   ),
  );


  // dark 
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
   shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)
   ),
   // ignore: deprecated_member_use
   checkColor: MaterialStateProperty.resolveWith((states) {
    // ignore: deprecated_member_use
    if (states.contains(MaterialState.selected)) {
      return Colors.white;
      
    }else{
      return Colors.black;
    }
   }
   ),
   // ignore: deprecated_member_use
   fillColor: MaterialStateProperty.resolveWith((states) {
    // ignore: deprecated_member_use
    if (states.contains(MaterialState.selected)) {
      return Colors.blue;
      
    }else{
      return Colors.transparent;
    }
   }
   ),
  );
}
import 'package:flutter/material.dart';
import 'package:sukoon/utils/themes/custom_themes/appbar_theme.dart';
import 'package:sukoon/utils/themes/custom_themes/bottom_sheet_theme.dart';
import 'package:sukoon/utils/themes/custom_themes/checkbox_theme.dart';
import 'package:sukoon/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:sukoon/utils/themes/custom_themes/text_theme.dart';
import 'package:sukoon/utils/themes/custom_themes/textfeild_theme.dart';

class AppTheme {
  const AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
    inputDecorationTheme: TTextfeildTheme.lightInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
    inputDecorationTheme: TTextfeildTheme.darkInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
  );
}

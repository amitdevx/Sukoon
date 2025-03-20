// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TTextfeildTheme {
  const TTextfeildTheme._();

  // light 
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(color: Colors.black, fontSize: 14),
    hintStyle: const TextStyle().copyWith(color: Colors.black, fontSize: 14),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(14)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(14)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(14)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(14)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(14)),
  );

  // dark 
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(color: Colors.white, fontSize: 14),
    hintStyle: const TextStyle().copyWith(color: Colors.white, fontSize: 14),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(14)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(14)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(14)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(14)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(14)),
  );
}

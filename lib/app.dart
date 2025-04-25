import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:sukoon/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
        debugShowCheckedModeBanner: false,

        // themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        // home: HomeScreen(),
        home: OnboardingScreen(),
        );
  }
}
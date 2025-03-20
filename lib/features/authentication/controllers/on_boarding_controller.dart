import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/authentication/screens/Login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  final currentPageIndex = 0.obs;

  /// Update current index when page scrolls
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  /// Jump to specific dot-selected page
  void dotNavigateClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Jump to next page
  void nextPage() {
    if (currentPageIndex.value < 2) {
      int page = currentPageIndex.value + 1;
      currentPageIndex.value = page;
      pageController.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
       Get.offAll(PhoneVerificationScreen()); 
      // Login screen pr navigate karne ke liye
    }
  }

  /// Skip to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
    Get.offAll(PhoneVerificationScreen()); 
    // Login screen pr navigate karne ke liye
  }
}

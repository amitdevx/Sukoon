import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/authentication/controllers/on_boarding_controller.dart';
import 'package:sukoon/features/authentication/screens/Onboarding/onboardin_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sukoon/utils/constants/images_string.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Column(
        children: [
         
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardinPage(
                    image: AImages.onboardingImage1,
                    title: 'Seamless\nConnections',
                    subTitle:
                        "Skip the queues and Easily connect with\nExperts at your fingertips."),
                OnboardinPage(
                    image: AImages.onboardingImage2,
                    title: 'Specialis on mobile',
                    subTitle:
                        "Skip the queues and Easily connect with top\ndoctors at your fingertips."),
                OnboardinPage(
                  image:AImages.onboardingImage3,
                  title: 'Connect With fastest growing Community ',
                  subTitle:
                      "Skip the queues and Easily connect with top\ndoctors at your fingertips.",
                ),
              ],
            ),
          ),
        
          /// Bottom Navigation Controls
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 TextButton(
                  onPressed: () {
                    OnBoardingController.instance.skipPage();
                  },
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                OnboardingNavigation(),
                 TextButton(
                  onPressed: () {
                    OnBoardingController.instance.nextPage();
                  },
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color:  const Color.fromARGB(255, 18, 135, 96),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  
class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return SmoothPageIndicator(
      controller: controller.pageController,
      onDotClicked: controller.dotNavigateClick,
      count: 3,
      effect: ScrollingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor:  const Color.fromARGB(255, 18, 135, 96),
      ),
    );
  }
}

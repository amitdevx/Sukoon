import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/authentication/screens/Home/home_screen.dart';

class ConsultationEndedScreen extends StatelessWidget {
  const ConsultationEndedScreen({required this.isNutrition, super.key});
  final bool isNutrition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Success Icon
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/pngs/ended.png", // Confetti effect image
                    width: 120,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                isNutrition
                    ? "Booking\nConfirmed "
                    : "Consultation session\nhas ended",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              const Text(
                "Your Booking has been confirmed. You’ll receive a confirmation shortly via text",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () => {
                  Get.offAll(HomeScreen()),
                },
                style: FilledButton.styleFrom(
                  elevation: 0,
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                  backgroundColor: const Color.fromARGB(255, 18, 135, 96),
                  // padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Go to home",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

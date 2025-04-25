import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/common/widgets/form_appbar.dart';
import 'package:sukoon/features/dashboard/screens/Home/ended_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/videocall_screen.dart';

class Payment extends StatelessWidget {
  const Payment({required this.isNutrition, super.key});
  final bool isNutrition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: const FormAppbar(
          title: '',
          progress: 1,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booking Confirmed,\nPayment Getaway\nRedirection',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            isNutrition
                ? FilledButton(
                    onPressed: () => {
                      Get.off(ConsultationEndedScreen(isNutrition: true,)),
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
                    child: const Text("Pay Now",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  )
                : FilledButton(
                    onPressed: () => {
                      Get.off(VideoCallScreen()),
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
                    child: const Text("Start Call",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
          ],
        ),
      ),
    );
  }
}

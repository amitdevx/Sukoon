import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/home_screen.dart';

class Posted extends StatelessWidget {
  const Posted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/pngs/ended.png", 
            width: 120,
            height: 200,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Congratulations\n',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Your post has been published',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20,),
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
        ],
      ),
    );
  }
}

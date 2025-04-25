import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/common/widgets/form_appbar.dart';
import 'package:sukoon/features/dashboard/screens/Home/services_screen.dart';

class InstanConnect extends StatelessWidget {
  const InstanConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: FormAppbar(
          title: 'Choose Appointment',
          progress: .25,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose the service you want",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Select a service that fits your needs to get started with your consultation.",
              style: TextStyle(color: const Color.fromARGB(255, 18, 135, 96)),
            ),
            SizedBox(height: 16),
            ServiceCard(
              icon: 'assets/images/pngs/diet.png',
              title: "Dietitian",
              description:
                  "Consult with an expert dietitian who can help you with personalized meal plans and nutrition advice.",
            ),
            SizedBox(height: 12),
            ServiceCard(
              icon: 'assets/images/pngs/healthyfood.png',
              title: "Nutritionist",
              description:
                  "Work with a certified nutritionist to create a diet plan tailored to your health goals and lifestyle.",
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const ServiceCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: const Color.fromARGB(255, 219, 219, 219))),
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromARGB(255, 219, 219, 219)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    icon,
                    
                  ),
                )),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => ServicesScreen(
                    isNutrition: title ==
                        "Nutritionist", 
                  )),
              overlayColor: null,
              splashColor: null,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 28,
                color: const Color.fromARGB(255, 18, 135, 96),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

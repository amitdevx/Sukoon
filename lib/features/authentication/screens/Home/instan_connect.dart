import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/common/widgets/form_appbar.dart';
import 'package:sukoon/features/authentication/screens/Home/services_screen.dart';

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
              "Choose Service you want",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Lorem ipsum dolor sit amet,",
              style: TextStyle(color: const Color.fromARGB(255, 18, 135, 96)),
            ),
            SizedBox(height: 16),
            ServiceCard(
              icon: 'assets/images/pngs/apple1.png',
              title: "Dietitian",
              description:
                  "Lorem ipsum dolor sit amet,\nLorem ipsum dolor sit amet,",
            ),
            SizedBox(height: 12),
            ServiceCard(
              icon: 'assets/images/pngs/nutrition-plan.png',
              title: "Nutritionist",
              description:
                  "Lorem ipsum dolor sit amet,\nLorem ipsum dolor sit amet,",
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
                child: Image.asset(
                  icon,
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
                        "Nutritionist", // Agar Nutritionist ho to true, Dietitian ho to false
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

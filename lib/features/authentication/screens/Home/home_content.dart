import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/common/widgets/chat_card.dart';
import 'package:sukoon/features/authentication/screens/Home/instan_connect.dart';

// HomeContent class alag se banayi gayi hai taaki sirf Home ka UI yahan ho
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning,\nFriend",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => InstanConnect()),
                        child: OptionCard(
                          imagePath: "assets/images/pngs/app.png",
                          title: "Book Appointment",
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(() => InstanConnect()),
                        child: OptionCard(
                          imagePath: "assets/images/pngs/inst.png",
                          title: "Instant Connect",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title text",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Paragraph text is really amazing to work with when there is content.",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Image.asset(
                              "assets/images/pngs/Illustration.png",
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Personalised Services\nfor you",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      categoryCard(
                        imagePath: "assets/images/pngs/dietitian.png",
                        title: "Dietitian",
                      ),
                      categoryCard(
                        imagePath: "assets/images/pngs/physiotherapist.png",
                        title: "Physiotherapist",
                      ),
                      categoryCard(
                        imagePath: "assets/images/pngs/nutritionist.png",
                        title: "Nutritionist",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      categoryCard(
                        imagePath: "assets/images/pngs/apple.png",
                        title: "Dietitian",
                      ),
                      categoryCard(
                        imagePath: "assets/images/pngs/group.png",
                        title: "Physiotherapist",
                      ),
                      categoryCard(
                        imagePath: "assets/images/pngs/girlBlack.png",
                        title: "Nutritionist",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 410,
              color: const Color.fromARGB(227, 245, 245, 245),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Find You Thoughts",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(child: SocialPostCard()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 18, 135, 96),
        elevation: 5,
        icon: Icon(Icons.chat, color: Colors.white),
        label: Text(
          "Get Help",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const OptionCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 120,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 248),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 219, 219, 219)),
          ),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class categoryCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const categoryCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 80,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 248),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 219, 219, 219)),
          ),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

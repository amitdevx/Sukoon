import 'package:flutter/material.dart';

import 'package:sukoon/common/widgets/chat_card.dart';
import 'package:sukoon/common/widgets/custom_search_bar.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/following_card.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/post_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/shorts_section.dart';
import 'package:sukoon/utils/helper/image_picker_helper.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              controller: TextEditingController(),
              onVoiceSearch: () {
                print("Voice search tapped!");
              },
            ),
            Divider(
              color: const Color.fromARGB(255, 237, 237, 237),
              thickness: 1,
            ),
            ShortsSection(),
            SizedBox(height: 15),
            Divider(
              color: const Color.fromARGB(255, 237, 237, 237),
              thickness: 10,
            ),
            SizedBox(height: 10),
            Container(
              height: 410,
              color: const Color.fromARGB(226, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Find You Thoughts",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(child: SocialPostCard()),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: const Color.fromARGB(255, 237, 237, 237),
              thickness: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Following",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                FollowingCard()
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final imagePath = await FilePickerHelper.pickImageFile();

          if (imagePath != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CaptionScreen(imagePath: imagePath),
              ),
            );
          } else {
            print("No image selected");
          }
        },
        backgroundColor: const Color.fromARGB(255, 18, 135, 96),
        elevation: 5,
        icon: Icon(Icons.add, color: Colors.white),
        label: Text(
          "Post",
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

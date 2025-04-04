import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<String> profileImages = [
    'https://randomuser.me/api/portraits/women/1.jpg',
    'https://randomuser.me/api/portraits/women/2.jpg',
    'https://randomuser.me/api/portraits/women/3.jpg',
    'https://randomuser.me/api/portraits/women/4.jpg',
    'https://randomuser.me/api/portraits/women/5.jpg',
    'https://randomuser.me/api/portraits/women/6.jpg',
  ];

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1), // 1px height
            child: Container(
              color: Colors.grey[300], // Grey color line
              height: 1, // Line height
              width: double.infinity, // Full width
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: profileImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(profileImages[index]),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dietitian',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'How are you today?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Text(
                  '2 min ago',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

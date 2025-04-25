import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/Chat%20screen/chat_history.dart';

class ChatData {
  final String name;
  final String message;
  final String time;
  final String profileImage;

  ChatData({
    required this.name,
    required this.message,
    required this.time,
    required this.profileImage,
  });
}

class ChatScreen extends StatelessWidget {
  final List<ChatData> chats = [
    ChatData(
      name: 'Dietitian Aisha',
      message: 'How are you today?',
      time: '2 min ago',
      profileImage: 'https://randomuser.me/api/portraits/women/2.jpg',
    ),
    ChatData(
      name: 'Dietitian Neha',
      message: 'Did you try the plan?',
      time: '5 min ago',
      profileImage: 'https://randomuser.me/api/portraits/women/3.jpg',
    ),
    ChatData(
      name: 'Nurologist Riya',
      message: 'Let’s update your diet.',
      time: '10 min ago',
      profileImage: 'https://randomuser.me/api/portraits/women/4.jpg',
    ),
    ChatData(
      name: 'Dietitian Ankita',
      message: 'How’s your water intake?',
      time: '30 min ago',
      profileImage: 'https://randomuer.me/api/portraits/women/5.jpg',
    ),
    ChatData(
      name: 'Physiotherapist Swati',
      message: 'Please track your meals.',
      time: '1 hour ago',
      profileImage: 'https://randomuser.me/api/portraits/women/6.jpg',
    ),
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
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey[300],
              height: 1,
              width: double.infinity,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () => Get.to(ChatHistory(
                title: chat.name,
              )),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      chat.profileImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          chat.message,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    chat.time,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

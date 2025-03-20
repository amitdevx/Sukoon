// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/common/widgets/speaker_options.dart';
import 'package:sukoon/features/authentication/screens/Home/ended_screen.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  IconData _selectedAudioOption = Icons.volume_up; // Default icon
  void switchSpeakerOptions() {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SpeakerOptions(
        selectedIcon: _selectedAudioOption, // Pass the selected icon
        onOptionSelected: (IconData selectedIcon) {
          setState(() {
            _selectedAudioOption = selectedIcon;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.switch_camera_outlined,
                    color: Colors.black, size: 28),
              ),
              IconButton(
                onPressed: () {
                  switchSpeakerOptions();
                },
                icon: Icon(_selectedAudioOption, color: Colors.black, size: 28),
              ),
            ],
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1), // 1px height
          child: Container(
            color: Colors.grey[300], // Grey color line
            height: 1, // Line height
            width: double.infinity, // Full width
          ),
        ),
      ),
      body: Stack(
        children: [
          // Doctor's Video (Full Screen)
          Positioned.fill(
            child: Image.asset(
              'assets/images/pngs/photo.png', // Dummy image
              fit: BoxFit.cover,
            ),
          ),

          // Patient's Video (Small Window)
          Positioned(
            top: 10,
            right: 10,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/pngs/cilent.png', // Dummy image
                    width: 100,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.camera_alt, color: Colors.green, size: 20),
                  ),
                ),
              ],
            ),
          ),

          // Name & Timer Section
          Positioned(
            bottom: 120,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kathryn Cooper",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Physiotherapist",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "00:21:45",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Shadow Effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120, // Adjust height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0), // Fully transparent at the top
                    Colors.black.withOpacity(0.1), // Dark at the bottom
                    Colors.black.withOpacity(0.2), // Dark at the bottom
                    Colors.black.withOpacity(0.3), // Dark at the bottom
                    Colors.black.withOpacity(0.4), // Dark at the bottom
                    Colors.black.withOpacity(0.5), // Dark at the bottom
                    Colors.black.withOpacity(0.6), // Dark at the bottom
                    Colors.black.withOpacity(0.7), // Dark at the bottom
                    Colors.black.withOpacity(0.8), // Dark at the bottom
                    Colors.black.withOpacity(0.9), // Dark at the bottom
                  ],
                ),
              ),
            ),
          ),

          // Bottom Control Buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(Icons.mic, Colors.white),
                _buildButton(Icons.call_end, Colors.pink, isEndCall: true),
                _buildButton(Icons.camera_alt, Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, Color color, {bool isEndCall = false}) {
    return IconButton(
      onPressed: () {
        if (isEndCall) {
          Get.offAll(ConsultationEndedScreen(isNutrition: false,));
        }
      },
      icon: CircleAvatar(
        radius: 28,
        backgroundColor: color,
        child: Icon(icon,
            color: isEndCall ? Colors.white : Colors.black, size: 28),
      ),
    );
  }
}

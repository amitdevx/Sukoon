import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/Booking%20Tab/cancle_reshedule.dart';
import 'package:sukoon/features/dashboard/screens/Home/videocall_screen.dart';

class UpcomingSection extends StatefulWidget {
  const UpcomingSection({super.key});

  @override
  State<UpcomingSection> createState() => _UpcomingSectionState();
}

class _UpcomingSectionState extends State<UpcomingSection> {
  void cancleReshedule() {
    showModalBottomSheet(
        showDragHandle: false,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => CancleReshedule());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> bookings = [
      {
        "icon": "assets/images/pngs/physiotherapist.png",
        "title": "Dietitian",
        "fee": "₹350/",
        "date": "28-03-2025",
        "time": "4:30PM",
        "type": "Chat Consult",
      },
      {
        "icon": "assets/images/pngs/physiotherapist.png",
        "title": "Nutritionist",
        "fee": "₹350/",
        "date": "15-04-2025",
        "time": "4:30PM",
        "type": "Instant Consult",
      },
      {
        "icon": "assets/images/pngs/physiotherapist.png",
        "title": "Dietitian",
        "fee": "₹350/",
        "date": "28-04-2025",
        "time": "4:30PM",
        "type": "Video Consult",
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        var booking = bookings[index];
        return Card(
          color: Colors.white,
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          booking["icon"]!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking["title"]!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Consulting fee: ${booking["fee"]}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 18, 135, 96),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Slot Date: ${booking["date"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Slot Time: ${booking["time"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => cancleReshedule(),
                      icon: const Icon(Icons.more_vert),
                      color: const Color.fromARGB(255, 18, 135, 96),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                        elevation: 0,
                        backgroundColor:
                            const Color.fromARGB(255, 244, 244, 244),
                        label: Text(booking["type"]!)),
                    TextButton(
                      style: TextButton.styleFrom(overlayColor: Colors.green),
                      onPressed: () {
                        Get.to(VideoCallScreen());
                      },
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          const Text(
                            "Start Session",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 18, 135, 96),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5), 
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color.fromARGB(255, 18, 135, 96),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

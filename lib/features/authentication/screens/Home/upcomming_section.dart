import 'package:flutter/material.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

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
        "type": "Insta Consult",
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
                      child: Image.asset(
                        booking["icon"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      // Yeh ensure karega ki Column pura space lele
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
                    Icon(Icons.more_vert), 
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
                      onPressed: () {},
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Min width tak limit rakhega
                        children: [
                          const Text(
                            "Start Session",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 18, 135, 96),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5), // Thoda gap dene ke liye
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

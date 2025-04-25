import 'package:flutter/material.dart';

class ShortsSection extends StatelessWidget {
  final List<Map<String, String>> shortsData = [
    {
      'image': 'assets/images/fruits.jpg',
      'profile': 'assets/images/pngs/girlProfile.png',
      'name': 'Anna Mary',
    },
    {
      'image': 'assets/images/pngs/post2.jpg',
      'profile': 'assets/images/pngs/girlProfile.png',
      'name': 'Anna Mary',
    },
    {
      'image': 'assets/images/pngs/post.png',
      'profile': 'assets/images/pngs/girlProfile.png',
      'name': 'Anna Mary',
    },
    {
      'image': 'assets/images/fruits.jpg',
      'profile': 'assets/images/pngs/girlProfile.png',
      'name': 'Anna Mary',
    },
    {
      'image': 'assets/images/fruits.jpg',
      'profile': 'assets/images/pngs/girlProfile.png',
      'name': 'Anna Mary',
    },
  ];

  ShortsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Shorts",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(

          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shortsData.length,
            
            itemBuilder: (context, index) {
              final item = shortsData[index];
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.asset(
                        item['image']!,
                        width: 140,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 8,
                        bottom: 8,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(item['profile']!),
                              radius: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

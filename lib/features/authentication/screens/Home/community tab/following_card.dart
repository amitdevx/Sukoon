import 'package:flutter/material.dart';

class FollowingCard extends StatelessWidget {
  const FollowingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width, // Fixed width
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/pngs/girlProfile.png'),
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Anna Mary",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.access_time,
                                      size: 14, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(
                                    "2 Hours ago",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const Text(
                    "The most important thing I learned in 2020?...",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  child: Image.asset(
                    'assets/images/pngs/post.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.favorite_border,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          SizedBox(width: 4),
                          Text("209"),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.comment,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          SizedBox(width: 4),
                          Text("16"),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.share,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          SizedBox(width: 4),
                          Text("24"),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.4,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

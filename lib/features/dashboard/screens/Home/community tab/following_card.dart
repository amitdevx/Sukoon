import 'package:flutter/material.dart';

class PostData {
  int likeCount;
  int commentCount;
  int shareCount;
  bool isLiked;

  PostData({
    this.likeCount = 209,
    this.commentCount = 16,
    this.shareCount = 24,
    this.isLiked = false,
  });
}

class FollowingCard extends StatefulWidget {
  const FollowingCard({super.key});

  @override
  State<FollowingCard> createState() => _FollowingCardState();
}

class _FollowingCardState extends State<FollowingCard> {
  late List<PostData> posts;

  @override
  void initState() {
    super.initState();
    posts = List.generate(5, (index) {
      return PostData(
        likeCount: 209 + index,
        commentCount: 16 + index,
        shareCount: 24 + index,
        isLiked: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(posts.length, (index) {
        final post = posts[index];
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
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle like status and update likeCount
                                if (post.isLiked) {
                                  post.likeCount--;
                                } else {
                                  post.likeCount++;
                                }
                                post.isLiked = !post.isLiked;
                              });
                            },
                            child: post.isLiked
                                ? Icon(Icons.favorite, color: Colors.red)
                                : Icon(Icons.favorite_border,
                                    color: Colors.grey),
                          ),
                          SizedBox(width: 8),
                          Text(post.likeCount.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.comment,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          const SizedBox(width: 4),
                          Text(post.commentCount.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.share,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          const SizedBox(width: 4),
                          Text(post.shareCount.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.4,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

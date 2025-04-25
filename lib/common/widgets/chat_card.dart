import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/comment_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/detailed_post.dart';

class SocialPostCard extends StatefulWidget {
  const SocialPostCard({super.key});

  @override
  State<SocialPostCard> createState() => _SocialPostCardState();
}

class _SocialPostCardState extends State<SocialPostCard> {
  List<PostData> posts = List.generate(
    5,
    (index) => PostData(
      isLiked: false,
      likeCount: 209 + index,
      commentCount: 16 + index,
      shareCount: 24 + index,
    ),
  );

  void showComment() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CommentBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Card(
                  color: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
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
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(DetailedPost());
                        },
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "The most important thing I learned in 2020?...",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 5),
                            ClipRRect(
                              child: Image.asset(
                                'assets/images/pngs/post2.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 140,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                      post.isLiked = !post.isLiked;
                                      post.likeCount += post.isLiked ? 1 : -1;
                                    });
                                  },
                                  child: post.isLiked
                                      ? Icon(Icons.favorite,
                                          size: 28, color: Colors.red)
                                      : Icon(Icons.favorite_border,
                                          size: 28, color: Colors.black),
                                ),
                                const SizedBox(width: 8),
                                Text(post.likeCount.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: showComment,
                                    icon: const Icon(Icons.comment_outlined),
                                    color: const Color.fromARGB(255, 0, 0, 0)),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostData {
  bool isLiked;
  int likeCount;
  int commentCount;
  int shareCount;

  PostData({
    this.isLiked = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
  });
}

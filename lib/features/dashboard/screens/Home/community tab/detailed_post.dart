import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/comment_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/full_img_view.dart';

class DetailedPost extends StatefulWidget {
  const DetailedPost({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailedPost createState() => _DetailedPost();
}

class _DetailedPost extends State<DetailedPost> {
  TextEditingController _commentController = TextEditingController();
  String commentText = '';
  bool isFavorite = false;
  bool isLiked = false;

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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Add share functionality if needed
            },
          ),
          IconButton(
            icon: isFavorite
                ? Icon(Icons.bookmark, color: Color(0xFF00764C),)
                : Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 70), // To give space for comment box
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(VisualPostScreen());
                    },
                    child: Image.asset(
                      'assets/images/pngs/post2.jpg',
                      
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: isLiked
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_border, color: Colors.grey),
                        ),
                        SizedBox(width: 8),
                        Text('16'),
                        SizedBox(width: 16),
                 
                        IconButton(onPressed: showComment, icon: Icon(Icons.comment,color:Color(0xFF00764C),),),
                    
                        Text('16'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '3 Hobbies That Can Improve Your Memory',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundImage:
                              AssetImage('assets/images/pngs/girlProfile.png'),
                        ),
                        SizedBox(width: 8),
                        Text("Thomas Oppugn • 5 min read • 20 Nov"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '''Cognitive decline is inevitable as we get older. According to the American Psychological Association, “the brain’s volume peaks in the early 20s and gradually declines for the rest of life”.

But your lifestyle can slow the process. You can preserve and even enhance your mental capabilities as you age. Simple behaviour changes can help us stay sharp for as long as possible. What you do or don’t do makes a huge difference to your memory skills.

Pursuing both intellectual and physical challenges, as uncomfortable as it may be, is''',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
                color: Colors.white,
              ),
              child: TextField(
                controller: _commentController,
                onChanged: (value) {
                  setState(() {
                    commentText = value;
                  });
                },
                cursorColor: Color(0xFF00764C),
                decoration: InputDecoration(
                  hintText: 'Write Comment here...',
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.send,
                    color: commentText.isNotEmpty ? Color(0xFF00764C) : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

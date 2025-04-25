import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/comment_screen.dart';

class VisualPostScreen extends StatefulWidget {
  const VisualPostScreen({super.key});

  @override
  State<VisualPostScreen> createState() => _VisualPostScreenState();
}

class _VisualPostScreenState extends State<VisualPostScreen> {
  bool isLiked = false;
  bool isFavorite = false;
  final TextEditingController _controller = TextEditingController();
  String inputText = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void showComment() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: 24, color: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: isFavorite
                ? Icon(
                    Icons.bookmark,
                    color: Color(0xFF00764C),
                  )
                : Icon(Icons.bookmark_border, color: Colors.white),
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
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/pngs/post2.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),

          // Bottom info overlay
          Positioned(
              left: 12,
              right: 12,
              bottom: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/pngs/girlProfile.png'),
                            SizedBox(width: 4),
                            Text(
                              "Thomas Oppong",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        CustomCaption(
                          text:
                              "3 Hobbies That Can Improve Your Memory is a great way to enhance your brain power, try them today!",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: SizedBox(
                      height: 24,
                      child: GestureDetector(
                        onTap: showComment,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.comment,
                              size: 20,
                              color: Color(0xFF00764C),
                            ),
                            const SizedBox(width: 4),
                            const Text('16'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),

          // Bottom comment field
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: isLiked
                        ? Icon(Icons.favorite, size: 35, color: Colors.red)
                        : Icon(Icons.favorite_border,
                            size: 28, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            onTap: () {
                              showComment(); // Open bottom sheet on tap
                              FocusScope.of(context)
                                  .unfocus(); // Optional: remove default focus highlight
                            },
                            onChanged: (val) {
                              setState(() {
                                inputText = val;
                              });
                            },
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              hintText: 'your comment here',
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.send,
                            color: inputText.isNotEmpty
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCaption extends StatefulWidget {
  final String text;
  const CustomCaption({super.key, required this.text});

  @override
  State<CustomCaption> createState() => _CustomCaptionState();
}

class _CustomCaptionState extends State<CustomCaption> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<String> words = widget.text.split(" ");
    String preview =
        words.length > 4 ? "${words.sublist(0, 4).join(" ")}..." : widget.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isExpanded ? widget.text : preview,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        if (words.length > 4)
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                _isExpanded ? "See less" : "See more",
                style: const TextStyle(
                  color: Color(0xFF00764C),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

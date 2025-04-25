import 'package:flutter/material.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  String inputText = '';

  final List<Map<String, String>> comments = [
    {
      'name': 'Maude Hall',
      'time': '14 min',
      'comment':
          'That\'s a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'John Doe',
      'time': '20 min',
      'comment':
          'This feature really improved the user experience. I\'m excited to see more updates like this!',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'Jane Smith',
      'time': '25 min',
      'comment':
          'I love the new design! The colors are vibrant, and the layout is very clean.',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'Mark Johnson',
      'time': '30 min',
      'comment':
          'It\'s amazing how you incorporated feedback from the community. Keep up the great work!',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'Alice Green',
      'time': '35 min',
      'comment':
          'The new feature is very helpful for users. Can\'t wait to see the next update!',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'Chris Black',
      'time': '40 min',
      'comment':
          'I had some issues with the previous update, but this one seems to work perfectly. Great job!',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'Sophia White',
      'time': '45 min',
      'comment':
          'Nice work on improving the user interface. It\'s much easier to navigate now.',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
    {
      'name': 'Liam Brown',
      'time': '50 min',
      'comment':
          'The new feature is exactly what I needed. It saves a lot of time. Thank you!',
      'avatar': 'assets/images/pngs/girlProfile.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context)
            .viewInsets
            .bottom, // this adjusts for keyboard
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 1),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Comment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(comment['avatar']!),
                    ),
                    title: Row(
                      children: [
                        Text(
                          comment['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          comment['time']!,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    subtitle: Text(comment['comment']!),
                  );
                },
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (val) {
                          setState(() {
                            inputText = val;
                          });
                        },
                        cursorColor: Color(0xFF00764C),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
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
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: inputText.isNotEmpty
                                ? Color(0xFF00764C)
                                : Colors.grey,
                          ),
                          onPressed: inputText.isNotEmpty
                              ? () {
                                  setState(() {
                                    comments.insert(0, {
                                      'name': 'You',
                                      'time': 'Just now',
                                      'comment': inputText,
                                      'avatar':
                                          'assets/images/pngs/girlProfile.png',
                                    });
                                    _controller.clear();
                                    inputText = '';
                                  });
                                }
                              : null,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

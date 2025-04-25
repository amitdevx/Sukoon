import 'package:flutter/material.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({required this.title, super.key});

  final String title ;

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatHistory> {
  final TextEditingController _controller = TextEditingController();
  String inputText = '';
  List<Map<String, dynamic>> messages = [
    {
      "text":
          "I'll share with you a PDF that includes all the information about our services! You can find more information on our website!",
      "isMe": true,
      "time": "15:18"
    },
    {"text": "please share..", "isMe": false, "time": "15:18"},
    {
      "text": "File. Pdf",
      "isMe": true,
      "time": "12:09 pm",
    },
  ];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "text": text,
        "isMe": true,
        "time": TimeOfDay.now().format(context),
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(widget.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: msg['isMe']
                          ? Color(0xFF00764C)
                          : const Color.fromARGB(255, 231, 231, 231),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        msg.containsKey("image")
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(msg["image"]),
                              )
                            : Text(
                                msg["text"],
                                style: TextStyle(
                                  color:
                                      msg['isMe'] ? Colors.white : Colors.black,
                                ),
                              ),
                        SizedBox(height: 4),
                        Text(
                          msg['time'],
                          style: TextStyle(
                            fontSize: 10,
                            color:
                                msg['isMe'] ? Colors.white70 : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
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
                            onChanged: (val) {
                              setState(() {
                                inputText = val;
                              });
                            },
                            cursorColor: Color(0xFF00764C),
                            decoration: const InputDecoration(
                              
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              hintText: 'Write your message here...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.attachment,
                    color: Colors.black,
                  ),
                  onPressed: () {}
                ),
                IconButton(
                  icon: Icon(
                    Icons.mic,
                    color:  Colors.black,
                  ),
                  onPressed: () {}
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: inputText.isNotEmpty ? Color(0xFF00764C) : Colors.black,
                  ),
                  onPressed: () => _sendMessage(_controller.text),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

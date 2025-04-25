import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/posted.dart';

class CaptionScreen extends StatefulWidget {
  final String imagePath;
  const CaptionScreen({super.key, required this.imagePath});

  @override
  State<CaptionScreen> createState() => _CaptionScreenState();
}

class _CaptionScreenState extends State<CaptionScreen> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write caption', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(widget.imagePath),
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Caption",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _captionController,
                        decoration: InputDecoration(
                          hintText: "write caption",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                          const SizedBox(height: 20),
                      const Spacer(), // ye ensure karega ki SHARE button niche jaye
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            Get.off(Posted());
                          },
                          style: FilledButton.styleFrom(
                            elevation: 0,
                            side: const BorderSide(color: Colors.transparent),
                            backgroundColor: const Color.fromARGB(255, 18, 135, 96),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("SHARE",
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 20),
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

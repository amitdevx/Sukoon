import 'package:flutter/material.dart';

class ThoughtsSection extends StatelessWidget {
  const ThoughtsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Find You Thoughts",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

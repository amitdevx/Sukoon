import 'package:flutter/material.dart';

class FormAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double progress; // 0.0 to 1.0 progress value
  final String title;
  const FormAppbar({super.key, required this.progress, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600, // Bold effect for text
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *
                    0.15, // Total width of progress bar
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Light grey background
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: progress, // Dynamic progress
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF127760), // Green color
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1), // 1px height
        child: Container(
          color: Colors.grey[300], // Grey color line
          height: 1, // Line height
          width: double.infinity, // Full width
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

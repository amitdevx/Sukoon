import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onVoiceSearch;

  const CustomSearchBar(
      {super.key, required this.controller, this.onVoiceSearch});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 184, 184, 184)),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onVoiceSearch,
                child: const Icon(Icons.mic, color:   Color.fromARGB(255, 18, 135, 96),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

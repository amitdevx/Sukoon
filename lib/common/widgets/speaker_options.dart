import 'package:flutter/material.dart';


class SpeakerOptions extends StatelessWidget {
  final IconData selectedIcon;
  final Function(IconData) onOptionSelected;

  const SpeakerOptions({super.key, required this.selectedIcon, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Audio Output", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
          Divider(),
          buildAudioOption(Icons.volume_up, "Auto", context),
          Divider(),
          buildAudioOption(Icons.speaker, "Speaker", context),
          Divider(),
          buildAudioOption(Icons.headphones_outlined, "Earphone", context),
          Divider(),
          buildAudioOption(Icons.phone_outlined, "Phone", context),
          Divider(),
          buildAudioOption(Icons.bluetooth_audio_rounded, "Bluetooth Device", context),
        ],
      ),
    );
  }

  Widget buildAudioOption(IconData icon, String label, BuildContext context) {
    bool isSelected = icon == selectedIcon; // Check if current option is selected
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(label, style: TextStyle(fontSize: 16)),
      trailing: isSelected ? Icon(Icons.check, color: Colors.green) : null, // Show check icon if selected
      onTap: () {
        onOptionSelected(icon);
        Navigator.pop(context);
      },
    );
  }
}

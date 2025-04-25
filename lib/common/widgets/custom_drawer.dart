import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/home_screen.dart';
import 'package:sukoon/features/dashboard/screens/profile/profile_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomDrawerState();
  }
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0; // Track selected item index

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex, // Set selected index
      backgroundColor: Colors.white,
      indicatorColor: Color.fromARGB(55, 18, 135, 96),
      onDestinationSelected: (int index) {
        setState(() {
          selectedIndex = index; // Update selected index
        });

        // Handle navigation here
        switch (index) {
          case 0:
            Get.offAll(HomeScreen());
            break;
          case 1:
            Get.to(ProfileScreen());
            break;
          case 2:
            // Navigator.pushNamed(context, "/settings");
            break;
          case 3:
            // Navigator.pushNamed(context, "/help");
            break;
          case 4:
            // Navigator.pushNamed(context, "/logout");
            break;
        }
      },
      children: [
        SizedBox(
          height: 20,
        ),
        // Profile Section

        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
                backgroundImage: AssetImage(
                    "assets/images/pngs/girlProfile.png"), // Replace with actual profile image
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Anna Mary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "annamary@example.com",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),

        // Navigation Options
        NavigationDrawerDestination(
          icon: const Icon(Icons.home),
          selectedIcon: const Icon(Icons.home, color: Colors.green),
          label: const Text("Home"),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.person),
          selectedIcon: const Icon(Icons.person, color: Colors.green),
          label: const Text("Profile"),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.settings),
          selectedIcon: const Icon(Icons.settings, color: Colors.green),
          label: const Text("Settings"),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.help),
          selectedIcon: const Icon(Icons.help, color: Colors.green),
          label: const Text("Help & Support"),
        ),
      ],
    );
  }
}

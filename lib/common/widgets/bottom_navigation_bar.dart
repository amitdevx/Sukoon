import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 18, 135, 96),
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: [
        _buildNavItem(Icons.home, "Home", 0),
        _buildNavItem(Icons.groups_outlined, "Community", 1),
        _buildNavItem(Icons.calendar_month_outlined, "Bookings", 2),
        _buildNavItem(Icons.chat_outlined, "Chats", 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(bottom: 4), 
        child: Column(
          children: [
            if (isSelected)
              Container(
                width: 50, 
                height: 2, 
                color: const Color.fromARGB(255, 18, 135, 96),
              ),
            SizedBox(height: 4), 
            Icon(icon, color: isSelected ?const Color.fromARGB(255, 18, 135, 96): Colors.black),
          ],
        ),
      ),
      label: label,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sukoon/features/dashboard/screens/Home/Booking%20Tab/cancle_section.dart';
import 'package:sukoon/features/dashboard/screens/Home/Booking%20Tab/complete_section.dart';
import 'package:sukoon/features/dashboard/screens/Home/Booking%20Tab/upcomming_section.dart';

class BookingTopNavigation extends StatefulWidget {
  const BookingTopNavigation({super.key});

  @override
  State<BookingTopNavigation> createState() => _BookingTopNavigationState();
}

class _BookingTopNavigationState extends State<BookingTopNavigation> {
  int _selectedIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: Card(
              elevation: 0,
               color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem("Cancel", 0),
                  _buildNavItem("Upcoming", 1),
                  _buildNavItem("Complete", 2),
                ],
              ),
            ),
          ),
          Expanded(
            child: _selectedIndex == 1
                ? const UpcomingSection()
                : _selectedIndex == 0
                    ? CancleSection()
                    : CompleteSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _selectedIndex == index ? const Color.fromARGB(255, 18, 135, 96) : Colors.black54,
        ),
      ),
    );
  }
}

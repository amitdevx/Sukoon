import 'package:flutter/material.dart';
import 'package:sukoon/common/widgets/bottom_navigation_bar.dart';
import 'package:sukoon/common/widgets/custom_drawer.dart';
import 'package:sukoon/features/dashboard/screens/Home/Booking%20Tab/booking_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/Chat%20screen/chat_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/community_screen.dart';
import 'package:sukoon/features/dashboard/screens/Home/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeContent(),
    CommunityScreen(),
    BookingScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer(); 
                },
                borderRadius: BorderRadius.circular(12),
                child: Icon(Icons.menu_rounded, size: 35, color: Colors.black),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              overlayColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: const Color.fromARGB(255, 18, 135, 96),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: const Color.fromARGB(255, 18, 135, 96),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
}

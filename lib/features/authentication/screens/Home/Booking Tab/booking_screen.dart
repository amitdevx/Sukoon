import 'package:flutter/material.dart';
import 'package:sukoon/features/authentication/screens/Home/Booking%20Tab/booking_top_navigation.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: BookingTopNavigation());
  }
}

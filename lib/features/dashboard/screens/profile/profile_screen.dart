// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sukoon/features/dashboard/screens/Home/community%20tab/following_card.dart';
import 'package:sukoon/features/dashboard/screens/profile/edit_profile.dart';
import 'package:sukoon/features/dashboard/screens/profile/leagal_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _onProfileTap(BuildContext context) {
     Get.to(EditProfileScreen());
    print("Profile tapped");
  }

  void _onReferTap(BuildContext context) {
    // Navigate to refer & earn
    print("Refer and Earn tapped");
  }

  void _onLegalTap(BuildContext context) {
    Get.to(LeagalSection());
    print("Legal tapped");
  }

  void _onLogoutTap(BuildContext context) {
    // Sign out logic
    print("Logout tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.black),
            title: Text("Profile", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Change Picture and name"),
            onTap: () => _onProfileTap(context),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.campaign_outlined, color: Colors.black),
            title: Text("Refer and Earn", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Refer and earn rewards"),
            onTap: () => _onReferTap(context),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.black),
            title: Text("Legal", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Privacy policy"),
            onTap: () => _onLegalTap(context),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text("Logout", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Sign out from here"),
            onTap: () => _onLogoutTap(context),
          ),
          Divider(height: 1),
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Your Posts",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
               
                FollowingCard()
              ],
            ),
        ],
      ),
    );
  }
}

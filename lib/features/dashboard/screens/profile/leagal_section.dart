import 'package:flutter/material.dart';

class LeagalSection extends StatelessWidget {
  const LeagalSection({super.key});

  void _onProfileTap(BuildContext context) {
    // Navigate to profile change screen
    print("Profile tapped");
  }

  void _onReferTap(BuildContext context) {
    // Navigate to refer & earn
    print("Refer and Earn tapped");
  }

  void _onLegalTap(BuildContext context) {
    // Navigate to privacy policy
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
        title: Text("Legal", style: TextStyle(fontWeight: FontWeight.bold)),
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
            leading: Icon(Icons.policy, color: Colors.black),
            title:
                Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Privacy Policy for app"),
            onTap: () => _onProfileTap(context),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.gavel, color: Colors.black),
            title: Text("Terms & Conditions",
                style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Terms & Conditions for using this app"),
            onTap: () => _onReferTap(context),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.back_hand, color: Colors.black),
            title: Text("Do's and Dont's", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Do's and Dont's while using this service"),
            onTap: () => _onLegalTap(context),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.business_rounded, color: Colors.black),
            title:
                Text("About", style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("Learn more about Sukoon"),
            onTap: () => _onLogoutTap(context),
          ),
              Divider(height: 1),
        ],
      ),
    );
  }
}

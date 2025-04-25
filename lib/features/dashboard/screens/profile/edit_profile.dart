import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/home_screen.dart';
import 'package:sukoon/utils/helper/image_picker_helper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditProfileScreenState();
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String gender = 'Female';

  String? _profileImagePath; // to hold picked image path

  Future<void> _pickImage() async {
    final pickedPath = await FilePickerHelper.pickImageFile();
    if (pickedPath != null) {
      setState(() {
        _profileImagePath = pickedPath;
      });
    }
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFF00764C),
                  child: CircleAvatar(
                    radius: 57,
                    backgroundImage: _profileImagePath == null
                        ? AssetImage('assets/images/pngs/girlProfile.png')
                            as ImageProvider
                        : FileImage(File(_profileImagePath!)),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF00764C),
                      radius: 16,
                      child: Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Edit Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                      label: "Email", initialValue: "annamary@example.com"),
                  _buildTextField(
                      label: "Mobile Number", initialValue: "+91 6388254321"),
                  _buildTextField(label: "Name *", initialValue: "Anna Mary"),
                  _buildDropdownField(
                      label: "Gender *",
                      value: gender,
                      items: ["Male", "Female"]),
                  _buildTextField(
                    label: "Permanent Address *",
                    initialValue:
                        "RAK Operations Centre, Emirates Road, Ras Al Khaimah, U.A.E, Ras Al Khaimah, UAE .",
                  ),
                  _buildTextField(
                    label: "Current Address *",
                    initialValue:
                        "RAK Operations Centre, Emirates Road, Ras Al Khaimah, U.A.E, Ras Al Khaimah, UAE .",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => {
                  Get.offAll(HomeScreen()),
                },
                style: FilledButton.styleFrom(
                  elevation: 0,
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                  backgroundColor: const Color.fromARGB(255, 18, 135, 96),
                  // padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Save",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, String? initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        value: value,
        onChanged: (val) => setState(() => gender = val!),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Home/home_screen.dart';
class AddDetailsScreen extends StatelessWidget {
  AddDetailsScreen({super.key});

  final TextEditingController ageController = TextEditingController();
  final TextEditingController permanentAddressController = TextEditingController();
  final TextEditingController currentAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Details", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        
      ),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            _buildTextField("Age", ageController),
            _buildTextField("Permanent Address", permanentAddressController),
            _buildTextField("Current Address", currentAddressController),
            
             const Spacer(),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                   onPressed: () {
                    Get.to(HomeScreen());
                   },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    overlayColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),

                    backgroundColor:
                        const Color.fromARGB(255, 18, 135, 96), // Active color
                    foregroundColor: Colors.white, // Active text color
                    disabledBackgroundColor: const Color.fromARGB(
                        255, 229, 229, 229), // Light grey when disabled
                    disabledForegroundColor: const Color.fromARGB(
                        255, 149, 148, 148), // Dark grey when disabled
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),  
                ),
              ),
             const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
             decoration: const InputDecoration(
               border: OutlineInputBorder(
                borderRadius: BorderRadius.all( Radius.circular(8)),
               ),
               enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all( Radius.circular(8)),
               ),
               disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all( Radius.circular(8)),
               ),
               focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all( Radius.circular(8)),
               ),
             ),
          ),
        ],
      ),
    );
  }
}

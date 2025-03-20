import 'package:flutter/material.dart';
import 'package:sukoon/common/widgets/form_appbar.dart';
import 'package:sukoon/common/widgets/time_slot.dart';
import 'package:sukoon/features/authentication/screens/Home/appointment_timeslot.dart';

class ServicesScreen extends StatefulWidget {
  final bool isNutrition;
  const ServicesScreen({required this.isNutrition, super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  void timeSlot() {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => widget.isNutrition ? AppointmentTimeslot() : TimeSlotSelector(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: FormAppbar(
          title: 'Services',
          progress: .5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Image
            Stack(
              children: [
                Container(
                  height: 255,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        30,
                      ),
                      bottomRight: Radius.circular(
                        30,
                      ),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/pngs/servicesImg.png"), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 228, 228, 228),
                        width: .8,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Icon
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 228, 228, 228),
                                  width: .8,
                                )),
                            child: Image.asset(
                              widget.isNutrition
                                  ? 'assets/images/pngs/nutrition-plan.png'
                                  : 'assets/images/pngs/apple1.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Title
                          Text(
                            widget.isNutrition ? "Nutritionist" : "Dietitian",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Doctor Info Card

            // Pricing Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Pricing",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 239, 239, 239),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text("Chat", style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text("\$32.00",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 239, 239, 239),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text("Video Call", style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text("\$32.00",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Service Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Service Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai...",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),

            // Benefits
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Benefits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  3,
                  (index) => Row(
                    children: const [
                      Icon(Icons.circle, size: 8, color: Colors.black),
                      SizedBox(width: 8),
                      Expanded(
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style: TextStyle(fontSize: 16))),
                    ],
                  ),
                ),
              ),
            ),

            // Specialties
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Specialties",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8,
                children: [
                  _buildChip("Reproductive Psychiatry"),
                  _buildChip("Psychiatry"),
                ],
              ),
            ),

            // Book Now Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => timeSlot(),
                  style: FilledButton.styleFrom(
                    elevation: 0,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                    backgroundColor: const Color.fromARGB(255, 18, 135, 96),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Book Now",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 14)),
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
    );
  }
}

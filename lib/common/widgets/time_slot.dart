  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:sukoon/features/authentication/screens/Home/booking_detail.dart';

  class TimeSlotSelector extends StatefulWidget {
    const TimeSlotSelector({super.key});

    @override
    State<TimeSlotSelector> createState() => _TimeSlotSelectorState();
  }

  class _TimeSlotSelectorState extends State<TimeSlotSelector> {
    String? selectedTime;
    String? consultationType;
    final List<String> timeSlots = ['4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM'];

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select your slot start time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: timeSlots
                  .map((time) => TimeSlotButton(
                        time: time,
                        isSelected: selectedTime == time,
                        onTap: () => setState(() => selectedTime = time),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ConsultationTypeButton(
                //   type: 'Chat',
                //   isSelected: consultationType == 'Chat',
                //   onTap: () => setState(() => consultationType = 'Chat'),
                // ),
                // ConsultationTypeButton(
                //   type: 'Video Call',
                //   isSelected: consultationType == 'Video Call',
                //   onTap: () => setState(() => consultationType = 'Video Call'),
                // ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      if (selectedTime != null) {
                        Get.to(BookingDetailsScreen(
                          consultationType: 'Chat',
                          selectedTime: selectedTime!,
                          isNutrition: false,
                        ));
                      } else {
                        Get.snackbar("Error", "Please select a time slot");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 18, 135, 96)),
                      foregroundColor: const Color.fromARGB(255, 18, 135, 96),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Chat',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (selectedTime != null) {
                        Get.to(BookingDetailsScreen(
                          selectedTime: selectedTime!,
                          consultationType: 'Video Call',
                          isNutrition: false,
                        ));
                      } else {
                        Get.snackbar("Time!", "Please select a time slot", 
                        
                        );
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(255, 18, 135, 96),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Video Call',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  class TimeSlotButton extends StatelessWidget {
    final String time;
    final bool isSelected;
    final VoidCallback onTap;

    const TimeSlotButton({
      super.key,
      required this.time,
      required this.isSelected,
      required this.onTap,
    });

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 18, 135, 96)
                : const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromARGB(255, 237, 237, 237)),
          ),
          child: Text(time,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      );
    }
  }

  class ConsultationTypeButton extends StatelessWidget {
    final String type;
    final bool isSelected;
    final VoidCallback onTap;

    const ConsultationTypeButton({
      super.key,
      required this.type,
      required this.isSelected,
      required this.onTap,
    });

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(type,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      );
    }
  }

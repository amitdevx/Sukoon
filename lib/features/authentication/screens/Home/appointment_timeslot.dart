import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/authentication/screens/Home/booking_detail.dart';

class AppointmentTimeslot extends StatefulWidget {
  const AppointmentTimeslot({super.key});

  @override
  State<AppointmentTimeslot> createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<AppointmentTimeslot> {
  String? selectedTime;
  int? selectedDateIndex;
  final List<String> timeSlots = ['4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM'];
  final List<Map<String, String>> availableDates = [
    {"date": "Today, 23 Feb", "slots": "No slots available"},
    {"date": "Today, 24 Feb", "slots": "9 slots available"},
    {"date": "Today, 25 Feb", "slots": "No slots available"},
  ];

  void proceedToBooking(String consultationType) {
    if (selectedDateIndex == null && selectedTime == null) {
      Get.snackbar("", "Please select day and time slot",backgroundColor: Colors.red,snackPosition: SnackPosition.TOP,colorText: Colors.white, );
    } else {
      Get.to(BookingDetailsScreen(
        selectedTime: selectedTime!,
        consultationType: consultationType,
        isNutrition: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose your day',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          DateSelectionWidget(
            availableDates: availableDates,
            selectedDateIndex: selectedDateIndex,
            onDateSelected: (index) {
              setState(() {
                selectedDateIndex = index;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text('Select your slot start time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 15,
              children: timeSlots
                  .map((time) => TimeSlotButton(
                        time: time,
                        isSelected: selectedTime == time,
                        onTap: () => setState(() => selectedTime = time),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => proceedToBooking('Chat'),
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
                  onPressed: () => proceedToBooking('Video Call'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    foregroundColor: Colors.white,
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

class DateSelectionWidget extends StatelessWidget {
  final List<Map<String, String>> availableDates;
  final int? selectedDateIndex;
  final Function(int) onDateSelected;

  const DateSelectionWidget({
    super.key,
    required this.availableDates,
    required this.selectedDateIndex,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: availableDates.asMap().entries.map((entry) {
          int index = entry.key;
          var dateInfo = entry.value;
          bool isSelected = selectedDateIndex == index;

          return GestureDetector(
            onTap: () => onDateSelected(index),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(255, 18, 135, 96)
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? const Color.fromARGB(255, 18, 135, 96)
                      : const Color.fromARGB(255, 237, 237, 237),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    dateInfo["date"]!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dateInfo["slots"]!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/common/widgets/form_appbar.dart';
import 'package:sukoon/features/dashboard/screens/Home/payment.dart';

class BookingDetailsScreen extends StatefulWidget {
  final bool isNutrition;
  const BookingDetailsScreen(
      {required this.isNutrition,
      super.key,
      required this.consultationType,
      required this.selectedTime});
  final String consultationType;
  final String selectedTime;

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: const FormAppbar(
            title: 'Booking Details',
            progress: .75,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Booking Details Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Booking Details',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 214, 215, 215)),
                                    ),
                                    child: Image.asset(
                                      widget.isNutrition
                                          ? 'assets/images/pngs/healthyfood.png'
                                          : 'assets/images/pngs/diet.png',
                                      width: 50,
                                      height: 50
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          widget.isNutrition
                                              ? 'Nutritionist'
                                              : 'Dietitian',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          _infoTile('Slot Date', '28-10-2023'),
                                          const SizedBox(width: 20),
                                          _infoTile(
                                              'Slot Time', widget.selectedTime),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 242, 250, 243),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 18, 135, 96)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Consulting fee:',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 18, 135, 96),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      '₹350/',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 18, 135, 96),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                            'Age', _ageController, 'Enter Age', true),
                        const SizedBox(height: 10),
                        const Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          spacing: 15,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: ['Male', 'Female'].map((gender) {
                            return Expanded(
                              child: ChoiceChip(
                                showCheckmark: false,
                                label: Center(child: Text(gender)),
                                selected: selectedGender == gender,
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedGender = gender;
                                  });
                                },
                                selectedColor: Color.fromARGB(255, 18, 135, 96),
                                backgroundColor: Colors.white,
                                labelStyle: TextStyle(
                                    color: selectedGender == gender
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                            'Region', _regionController, 'Enter Region', false),
                        const SizedBox(
                            height:
                                20), // Region aur Button ke beech gap maintain karega
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.isNutrition ? Get.off(Payment(isNutrition: true,)) : Get.off(Payment(isNutrition: false,));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Color.fromARGB(255, 18, 135, 96),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Confirmed',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildTextField(
      String label, TextEditingController controller, String hint, bool isAge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        TextFormField(
          style: const TextStyle(color: Colors.black, fontSize: 16),
          controller: controller,
          keyboardType: isAge ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 246, 130, 130))),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 246, 130, 130))),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '$label is required';
            }
            if (isAge) {
              if (int.tryParse(value) == null || int.parse(value) <= 0) {
                return 'Enter a valid age';
              }
            }
            return null;
          },
        ),
      ],
    );
  }

  static Widget _infoTile(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

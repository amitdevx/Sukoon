import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
// import 'package:sukoon/features/authentication/screens/Home/home_screen.dart';
import 'package:sukoon/features/authentication/screens/Login/otp.dart';
// import 'package:sukoon/features/authentication/screens/Login/otp.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PhoneVerificationScreenState();
  }
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  String phoneNumber = '';
  String countryCode = '+91';
  String flag = '🇮🇳';
  bool isValidNumber = false;

  void validateNumber(String number, String countryCode) {
    final dialCode = countryCode.replaceAll('+', '');
    Country? selectedCountry;

    try {
      selectedCountry = countries.firstWhere(
        (country) => country.dialCode == dialCode,
      );
    } catch (e) {
      selectedCountry = null;
    }

    if (selectedCountry != null && number.isNotEmpty) {
      final isValid = number.length >= selectedCountry.minLength &&
          number.length <= selectedCountry.maxLength;
      setState(() {
        isValidNumber = isValid;
      });
    } else {
      setState(() {
        isValidNumber = false;
      });
    }
  }

  void showCountryPicker() {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<Country> filteredCountries = countries;

        return StatefulBuilder(
          builder: (context, setStateModal) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search country...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (query) {
                      setStateModal(() {
                        filteredCountries = countries
                            .where((c) => c.name
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = filteredCountries[index];
                        return ListTile(
                          leading: Text(country.flag,
                              style: TextStyle(fontSize: 24)),
                          title: Text(country.name),
                          subtitle: Text("+${country.dialCode}"),
                          onTap: () {
                            Navigator.pop(context);
                            final newCountryCode = "+${country.dialCode}";
                            setState(() {
                              countryCode = newCountryCode;
                              flag = country.flag;
                            });
                            validateNumber(phoneNumber, newCountryCode);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Verify your phone number with code",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We'll send you a code. It helps keep your account secure",
                style: TextStyle(
                    fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(height: 30),
              Text(
                "Your Phone number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: showCountryPicker,
                    child: Container(
                      width: 120,
                      height: 58,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 213, 213, 213)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(flag, style: TextStyle(fontSize: 20)),
                          SizedBox(width: 5),
                          Text(countryCode, style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      // controller: TextEditingController(text: phoneNumber),0
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 213, 213, 213)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 213, 213, 213)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 213, 213, 213)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 213, 213, 213)),
                        ),
                        hintText: "Enter phone number",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 164, 164, 164),
                            fontSize: 16),
                      ),
                      onChanged: (phone) {
                        setState(() {
                          phoneNumber = phone;
                        });
                        validateNumber(phone, countryCode);
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isValidNumber
                      ? () {
                          Get.to(
                            OtpVerificationScreen(
                              phoneNumber: '$countryCode$phoneNumber',
                            ),
                          );
                        }
                      : null,
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
                  child: Text(
                    "OTP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

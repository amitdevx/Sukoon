import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukoon/features/dashboard/screens/Add%20details/add_details.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<StatefulWidget> createState() {
    return _OtpVerificationScreenState();
  }
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  //TextEditingControllers,
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  //FocusNode
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  // 45 sec timer
  int _start = 45;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  //reset timer function
  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _start = 45;
    });
    //set new timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _otpControllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
    setState(() {});
  }

  bool get _isOtpComplete {
    for (var controller in _otpControllers) {
      if (controller.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _resendCode() {
    _startTimer();
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((e) => e.text).join();

    debugPrint("Entered OTP: $otp");
    if (otp == "123456") {
    Get.offAll(() => AddDetailsScreen());
  } else {
    Get.snackbar("Error", "Invalid OTP", snackPosition: SnackPosition.BOTTOM);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "We just sent an SMS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Enter the security code we sent",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 18, 135, 96),
                      ),
                    ),
                  ),
                
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Text( 'to ${widget.phoneNumber}')
                ],  ),
              const SizedBox(height: 30),
              //OTP boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    // height: 55,
                    child: TextField(
                      cursorColor: const Color.fromARGB(255, 18, 135, 96),
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        
                        counterText: "", 
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 213, 213, 213)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 18, 135, 96),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) => _onOtpChanged(value, index),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),
              // Resend + Timer
              Row(
                children: [
                  const Text("Didn't get the code? "),
                 SizedBox(
                  width: 185,
                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       GestureDetector(
                      onTap: _start == 0 ? _resendCode : null,
                      child: Text(
                        "Resend it",
                        style: TextStyle( 
                          color: _start == 0
                              ? const Color.fromARGB(255, 18, 135, 96)
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Timer
                    Text(
                      _start > 0 ? "${_start}s" : "",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                   ),
                 )
                ],
              ),

              const Spacer(),
              // OTP btn
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                   onPressed: _isOtpComplete ? _verifyOtp : null,
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
                    "OTP",
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
      ),
    );
  }
}

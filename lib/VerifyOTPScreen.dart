import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Verifyotpscreen extends StatelessWidget {
  const Verifyotpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
    List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent shifting when keyboard appears
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Fixed background SVG
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 130, right: 20),
                child: Opacity(
                  opacity: 0.3,
                  child: SvgPicture.asset(
                    'assets/police.svg',
                    fit: BoxFit.fill,
                    color: const Color(0xFF8AC7FF),
                  ),
                ),
              ),
            ),

            // Main content
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        Image.asset(
                          'assets/verify_otp_.png',
                          height: size.height * 0.30,
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          "SMS has been sent to your number",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // OTP fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 50,
                              child: TextField(
                                controller: otpControllers[index],
                                focusNode: focusNodes[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),

                        // Submit
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              String otp = otpControllers.map((e) => e.text).join();
                              if (otp.length == 4) {
                                // handle OTP verification
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please enter a 4-digit OTP")),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF101276),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Resend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Did not receive OTP? "),
                            TextButton(
                              onPressed: () {
                                // handle resend
                              },
                              child: const Text(
                                "Resend OTP",
                                style: TextStyle(
                                  color: Color(0xFF101276),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Designed by IncomIT Technologies",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

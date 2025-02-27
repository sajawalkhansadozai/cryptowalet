// lib/screens/CreatePasswordScreen.dart
import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/SecreteRecoveryPhase.dart';
import 'package:cryptowalet/screens/wallet_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  int _currentStep = 0; // Step tracking
  bool isChecked = false; // Track checkbox state

  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context), // Header function from wallet_widgets.dart
          const SizedBox(height: 20),
          buildStepper(
            _currentStep,
            _onStepTapped,
          ), // Stepper with tap function
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create Password", style: TextStyle(fontSize: 25)),
                const Text(
                  "The Password will lock your wallet only \non this device.",
                  style: TextStyle(color: Color.fromARGB(255, 201, 195, 195)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: "New Password",
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Transform.scale(
                      scale: 0.7, // Adjusts checkbox size
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                        activeColor: const Color.fromRGBO(68, 217, 162, 1.0),
                        checkColor: Colors.white,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    const SizedBox(width: 5), // Add spacing
                    RichText(
                      text: const TextSpan(
                        text:
                            'I understand Crypto cannot Recover \nthis password for me.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 201, 195, 195),
                        ),
                        children: [
                          TextSpan(
                            text: ' Learn more',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecreteRecoveryPhase(),
                        ),
                      ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Create Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 5), // Add spacing
                RichText(
                  text: TextSpan(
                    text: 'Already have Wallet ',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 201, 195, 195),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Import Wallet',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Handle navigation
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            ImportScreen(), // Replace with actual screen
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/WriteDownInOrder.dart';
import 'package:cryptowalet/screens/wallet_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SecreteRecoveryPhase extends StatefulWidget {
  const SecreteRecoveryPhase({super.key});

  @override
  State<SecreteRecoveryPhase> createState() => _SecreteRecoveryPhaseState();
}

class _SecreteRecoveryPhaseState extends State<SecreteRecoveryPhase> {
  int _currentStep = 1; // Step tracking

  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  // Function to create a single recovery phrase container
  Widget buildRecoveryContainer(String text) {
    return Container(
      height: 45, // Reduced height
      width: 90, // Reduced width
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: const Color.fromRGBO(68, 217, 162, 1.0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey, // Changed text color to blue
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sample recovery phrases
    List<String> recoveryPhrases = [
      "apple",
      "banana",
      "cherry",
      "dog",
      "elephant",
      "fox",
      "grape",
      "house",
      "ice",
      "jungle",
      "kite",
      "lion",
      "monkey",
      "nest",
      "orange",
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context), // Ensure this function is implemented elsewhere
          const SizedBox(height: 20),
          buildStepper(
            _currentStep,
            _onStepTapped,
          ), // Ensure this function is implemented elsewhere
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Secret Recovery Phrase",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "This is your secret recovery phrase. Write it down\n"
                  "and save it somewhere safe. Never share it with anyone.",
                  style: TextStyle(color: Color.fromARGB(255, 201, 195, 195)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 380, // Adjusted height
              padding: const EdgeInsets.all(15), // Adjusted inner padding
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 230, 230),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ), // Spacing between rows
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (colIndex) {
                        int phraseIndex = rowIndex * 3 + colIndex;
                        return buildRecoveryContainer(
                          recoveryPhrases[phraseIndex],
                        );
                      }),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WriteDownInOrder()),
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
                "Continue",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
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

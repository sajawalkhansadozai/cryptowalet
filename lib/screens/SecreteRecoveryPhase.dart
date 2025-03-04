import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/WriteDownInOrder.dart' as writeDown;
import 'package:cryptowalet/screens/wallet_widgets.dart' as walletWidgets;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SecreteRecoveryPhase extends StatefulWidget {
  const SecreteRecoveryPhase({super.key});

  @override
  State<SecreteRecoveryPhase> createState() => _SecreteRecoveryPhaseState();
}

class _SecreteRecoveryPhaseState extends State<SecreteRecoveryPhase> {
  int _currentStep = 1; // Step tracking

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 1) {
        _currentStep--;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CreatePasswordScreen()),
        );
      }
    });
  }

  Widget buildRecoveryContainer(
    String text,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(68, 217, 162, 1.0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.035,
          fontWeight: FontWeight.bold,
          color: Colors.grey, // Changed text color to grey
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              buildHeader(
                context,
                _previousStep,
              ), // Pass _previousStep for back navigation
              SizedBox(height: screenHeight * 0.03),
              walletWidgets.buildStepper(
                context,
                _currentStep,
                (int index) {}, // Fixed null error
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Secret Recovery Phrase",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "This is your secret recovery phrase. Write it down\n"
                      "and save it somewhere safe. Never share it with anyone.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 201, 195, 195),
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 242, 242),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (rowIndex) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(3, (colIndex) {
                          int phraseIndex = rowIndex * 3 + colIndex;
                          if (phraseIndex < recoveryPhrases.length) {
                            return buildRecoveryContainer(
                              recoveryPhrases[phraseIndex],
                              screenWidth,
                              screenHeight,
                            );
                          } else {
                            return SizedBox();
                          }
                        }),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _nextStep();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => writeDown.WriteDownInOrder(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have Wallet ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 201, 195, 195),
                        fontSize: screenWidth * 0.035,
                      ),
                      children: [
                        TextSpan(
                          text: 'Import Wallet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: screenWidth * 0.035,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImportScreen(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header with a back button and title
  Widget buildHeader(BuildContext context, VoidCallback onBack) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            left: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ElevatedButton(
            onPressed: onBack, // Trigger the _previousStep logic
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
          ),
          child: Text(
            "Create New Wallet",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

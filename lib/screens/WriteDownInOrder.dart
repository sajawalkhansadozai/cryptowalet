import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/SecreteRecoveryPhase.dart';
import 'package:cryptowalet/screens/WelcomeScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WriteDownInOrder extends StatefulWidget {
  const WriteDownInOrder({super.key});

  @override
  State createState() => _WriteDownInOrderState();
}

class _WriteDownInOrderState extends State {
  int _currentStep = 2;

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 2) {
        _currentStep--;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecreteRecoveryPhase()),
        );
      }
    });
  }

  Widget buildRecoveryContainer(
    String text,
    double screenWidth,
    double screenHeight,
  ) {
    return Flexible(
      child: Container(
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
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String repeatedText = "----";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            buildHeader(
              context,
              _previousStep,
            ), // Pass _previousStep for back navigation
            SizedBox(height: screenHeight * 0.03),
            buildStepper(context, _currentStep, _onStepTapped),
            SizedBox(height: screenHeight * 0.04),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Write Down In Order",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "This is your secret recovery phrase. Write it down and save it somewhere safe.",
                    style: TextStyle(
                      color: Colors.grey,
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
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(5, (rowIndex) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(3, (colIndex) {
                          return buildRecoveryContainer(
                            repeatedText,
                            screenWidth,
                            screenHeight,
                          );
                        }),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _nextStep();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
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
            SizedBox(height: screenHeight * 0.04),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have a Wallet? ',
                  style: TextStyle(
                    color: Colors.grey,
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
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  /// Builds the header with a back button and title
  Widget buildHeader(BuildContext context, VoidCallback onBack) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.03, // 3% vertical spacing
            left: screenWidth * 0.05, // 5% left padding
          ),
          child: ElevatedButton(
            onPressed: onBack, // Trigger the _previousStep logic
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(screenWidth * 0.03), // 3% padding
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: screenWidth * 0.07, // Responsive icon size
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02), // 2% horizontal spacing
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.03,
          ), // 3% vertical spacing
          child: Text(
            "Create New Wallet",
            style: TextStyle(
              fontSize: screenWidth * 0.05, // Responsive font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the stepper UI
  Widget buildStepper(
    BuildContext context,
    int currentStep,
    Function(int) onStepTapped,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1,
      ), // 10% horizontal padding
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Stepper Line
          Row(
            children: List.generate(2, (index) {
              return Expanded(
                child: Container(
                  height: screenHeight * 0.006, // 0.6% of screen height
                  color:
                      currentStep > index
                          ? const Color.fromRGBO(68, 217, 162, 1.0)
                          : const Color.fromARGB(255, 221, 216, 216),
                ),
              );
            }),
          ),
          // Stepper Circles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () => onStepTapped(index),
                child: Container(
                  width: screenWidth * 0.08, // 8% of screen width
                  height: screenWidth * 0.08, // 8% of screen width
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          currentStep >= index
                              ? const Color.fromRGBO(68, 217, 162, 1.0)
                              : Colors.grey,
                      width: screenWidth * 0.008, // Responsive border width
                    ),
                    color:
                        currentStep > index
                            ? const Color.fromRGBO(68, 217, 162, 1.0)
                            : Colors.white,
                  ),
                  child:
                      currentStep > index
                          ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: screenWidth * 0.04, // Responsive icon size
                          )
                          : currentStep == index
                          ? Center(
                            child: Container(
                              width: screenWidth * 0.02, // 2% of screen width
                              height: screenWidth * 0.02, // 2% of screen width
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(68, 217, 162, 1.0),
                              ),
                            ),
                          )
                          : null,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }
}

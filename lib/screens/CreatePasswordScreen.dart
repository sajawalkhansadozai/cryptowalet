import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/SecreteRecoveryPhase.dart';
import 'package:cryptowalet/screens/StartHome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State {
  int _currentStep = 0;
  bool isChecked = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isButtonEnabled = false;

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Starthome()),
        );
      }
    });
  }

  void _validateInput() {
    setState(() {
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      // Enable the button only if passwords match, checkbox is ticked, and fields are not empty
      isButtonEnabled =
          password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          password == confirmPassword &&
          isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.02),
          buildHeader(context, _previousStep),
          SizedBox(height: screenHeight * 0.03),
          buildStepper(context, _currentStep),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Password",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "The Password will lock your wallet only on this device.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  onChanged: (value) => _validateInput(),
                  decoration: InputDecoration(
                    labelText: "New Password",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.015,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  onChanged: (value) => _validateInput(),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.015,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue ?? false;
                        });
                        _validateInput();
                      },
                      activeColor: const Color.fromRGBO(68, 217, 162, 1.0),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text:
                              'I understand that this password cannot be recovered.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
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
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                ElevatedButton(
                  onPressed:
                      isButtonEnabled
                          ? () {
                            _nextStep(); // Move to the next step
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecreteRecoveryPhase(),
                              ),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isButtonEnabled
                            ? const Color.fromRGBO(68, 217, 162, 1.0)
                            : Colors.grey,
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
                    "Create Password",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Already have a wallet? ',
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
        ],
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
            top: screenHeight * 0.03,
            left: screenWidth * 0.05,
          ),
          child: ElevatedButton(
            onPressed: onBack,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(screenWidth * 0.03),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: screenWidth * 0.07,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.03),
          child: Text(
            "Create New Wallet",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the stepper UI
  Widget buildStepper(BuildContext context, int currentStep) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Stepper Line
          Row(
            children: List.generate(2, (index) {
              return Expanded(
                child: Container(
                  height: screenHeight * 0.006,
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
                onTap: null, // Disable direct tapping on stepper circles
                child: Container(
                  width: screenWidth * 0.08,
                  height: screenWidth * 0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          currentStep >= index
                              ? const Color.fromRGBO(68, 217, 162, 1.0)
                              : Colors.grey,
                      width: screenWidth * 0.008,
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
                            size: screenWidth * 0.04,
                          )
                          : currentStep == index
                          ? Center(
                            child: Container(
                              width: screenWidth * 0.02,
                              height: screenWidth * 0.02,
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
}

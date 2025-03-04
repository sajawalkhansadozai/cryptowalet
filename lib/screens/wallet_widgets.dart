import 'package:flutter/material.dart';

/// 🔹 Builds the header with a back button and title
Widget buildHeader(BuildContext context) {
  // Get screen dimensions for responsiveness
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.03, // 3% of screen height
          left: screenWidth * 0.05, // 5% of screen width
        ),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
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
      SizedBox(width: screenWidth * 0.02), // 2% spacing
      Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.03,
        ), // 3% of screen height
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

/// 🔹 Builds the stepper UI
Widget buildStepper(
  BuildContext context,
  int currentStep,
  Function(int) onStepTapped,
) {
  // Get screen dimensions for responsiveness
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
                          ? const Color.fromRGBO(
                            68,
                            217,
                            162,
                            1.0,
                          ) // Completed step color
                          : Colors.white,
                ),
                child:
                    currentStep > index
                        ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: screenWidth * 0.04, // Responsive icon size
                        ) // Checkmark for completed steps
                        : currentStep == index
                        ? Center(
                          // Active step - with small dot
                          child: Container(
                            width: screenWidth * 0.02, // 2% of screen width
                            height: screenWidth * 0.02, // 2% of screen width
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(68, 217, 162, 1.0),
                            ),
                          ),
                        )
                        : null, // No dot for inactive steps
              ),
            );
          }),
        ),
      ],
    ),
  );
}

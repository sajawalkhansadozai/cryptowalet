import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final String text;

  const OnboardingPage({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.04,
        ), // 4% vertical padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: width, // Already passed as a parameter (responsive)
                height: height, // Already passed as a parameter (responsive)
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    screenWidth * 0.02,
                  ), // Responsive border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: screenWidth * 0.02, // Responsive blur radius
                      spreadRadius:
                          screenWidth * 0.01, // Responsive spread radius
                      offset: Offset(
                        screenWidth * 0.02,
                        screenWidth * 0.02,
                      ), // Responsive offset
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    screenWidth * 0.02,
                  ), // Responsive border radius
                  child: Image.asset(
                    imagePath,
                    width: width, // Already passed as a parameter (responsive)
                    height:
                        height, // Already passed as a parameter (responsive)
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08, // 8% horizontal padding
                vertical: screenHeight * 0.03, // 3% vertical padding
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 65, 63, 63),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.045, // Responsive font size
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 65, 63, 63),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cryptowalet/screens/ImportCustomToken.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      // Row for Back Button & Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back, size: 28), // Back button
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Transaction History", // The main text
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ETH", // Additional styled text
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            // Navigate to ImportCustomToken screen
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        ImportCustomToken(),
                                              ),
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Removed CustomButton logic entirely
                        ],
                      ),
                      const SizedBox(height: 20), // Add spacing
                      buildToken(context),
                      buildToken(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Token Component
Widget buildToken(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/profile_image.png"),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Account no 1 \nBalance 0.0",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

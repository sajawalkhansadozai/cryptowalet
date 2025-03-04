import 'package:cryptowalet/screens/ImportCustomToken.dart';

import 'package:cryptowalet/screens/TransactionHistory.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

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
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start, // Align all children to the start
                    children: [
                      // ✅ Row for Back Button & Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "Send", // The main text
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold, // Bold styling
                                    color: Colors.black, // Text color
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " ETH", // Additional styled text
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey[200],
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer:
                                          TapGestureRecognizer()
                                            ..onTap = () {
                                              // Navigate to ImportCustomToken screen
                                              Navigator.pop(context);
                                            },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MediaQuery.of(context).size.width < 350
                              ? SizedBox.shrink() // Hide button on small screens
                              : CustomButton(), // Show button on large screens
                        ],
                      ),
                      const SizedBox(height: 20), // Add spacing
                      // ✅ "From" Label Aligned to the Left
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "From",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing
                      buildToken(context),

                      const SizedBox(height: 20), // Add spacing
                      // ✅ "To" Label Aligned to the Left
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "To",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing
                      // ✅ TextField with Image and Label
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomTextField(
                          labelText: "Search public address here",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/QR.png", // Ensure this image exists in assets
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Divider(
                        color: Colors.grey[350], // Color of the line
                        thickness: 1, // Thickness of the line
                        height: 20, // Spacing above & below the line
                      ),
                      const SizedBox(height: 20),

                      // ✅ Reusable TextFields Below Divider
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: CustomTextField(labelText: "Token Number"),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: CustomTextField(labelText: "Token ID"),
                      ),
                      const SizedBox(
                        height: 20,
                      ), // Add spacing before the button
                    ],
                  ),
                ),
              ),
            ),

            // ✅ Button fixed at the bottom
            Padding(
              padding: const EdgeInsets.all(16), // Padding around the button
              child: ElevatedButton(
                onPressed: () {
                  // Perform action when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionHistory(),
                    ), // Replace with your page
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                    68,
                    217,
                    162,
                    1,
                  ), // Button color
                  foregroundColor: Colors.white, // Text color
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ), // Full width, fixed height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: Text(
                  "Next", // Button text
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ **Reusable Button Widget**
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to ImportCustomToken screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImportCustomToken()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: Color.fromRGBO(68, 217, 162, 1.0), width: 1),
        minimumSize: Size(120, 45),
      ),
      child: Text("Cancel", style: TextStyle(fontSize: 14)),
    );
  }
}

/// ✅ **Token Component**
Widget buildToken(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
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

/// ✅ **Reusable TextField Widget**
class CustomTextField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;

  const CustomTextField({super.key, required this.labelText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText, // Label text
          prefixIcon: prefixIcon, // Optional prefix icon
          border: InputBorder.none, // Remove default underline
          contentPadding: const EdgeInsets.all(
            15,
          ), // Padding inside the text field
        ),
        style: TextStyle(fontSize: 16, color: Colors.black), // Text style
      ),
    );
  }
}

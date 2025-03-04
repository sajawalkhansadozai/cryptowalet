import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/ImportToken.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

ButtonStyle commonButtonStyle({
  required Color backgroundColor,
  required Color foregroundColor,
  required double screenWidth,
}) {
  return ElevatedButton.styleFrom(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    elevation: 10,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        screenWidth * 0.03,
      ), // Responsive border radius
    ),
    padding: EdgeInsets.symmetric(
      vertical: screenWidth * 0.02,
    ), // Responsive padding
  );
}

class _ImportScreenState extends State<ImportScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05, // 5% of screen height
              left: screenWidth * 0.05, // 5% of screen width
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Import Account\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Import an existing wallet by entering its details",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.03, // Responsive font size
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // 5% of screen height
          // White Card below the text
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    screenWidth * 0.05,
                  ), // Responsive border radius
                  topRight: Radius.circular(
                    screenWidth * 0.05,
                  ), // Responsive border radius
                ),
              ),
              padding: EdgeInsets.all(screenWidth * 0.05), // 5% padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.03, // 3% of screen height
                      left: screenWidth * 0.02, // 2% of screen width
                    ),
                    child: Text(
                      "Import Account Details",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // 2% of screen height
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Secret Recovery Phrase",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ), // Responsive font size
                      filled: true, // Adds a background color
                      fillColor: Colors.grey[200], // Light grey background
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03, // 3% of screen width
                        vertical: screenHeight * 0.015, // 1.5% of screen height
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.02,
                        ), // Responsive border radius
                        borderSide: BorderSide.none, // No visible border
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // 2% of screen height
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Your Password",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ), // Responsive font size
                      filled: true, // Adds a background color
                      fillColor: Colors.grey[200], // Light grey background
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03, // 3% of screen width
                        vertical: screenHeight * 0.015, // 1.5% of screen height
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.02,
                        ), // Responsive border radius
                        borderSide: BorderSide.none, // No visible border
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height
                  // Buttons
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.8, // 80% of screen width
                          height: screenHeight * 0.07, // 7% of screen height
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImportToken(),
                                ),
                              );
                            },
                            style: commonButtonStyle(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color.fromRGBO(
                                68,
                                217,
                                162,
                                1.0,
                              ),
                              screenWidth: screenWidth,
                            ),
                            child: Text(
                              "Import Existing",
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.04, // Responsive font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.08,
                        ), // 8% of screen height
                        SizedBox(
                          width: screenWidth * 0.8, // 80% of screen width
                          height: screenHeight * 0.07, // 7% of screen height
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreatePasswordScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.white, // Button background color
                              foregroundColor: const Color.fromRGBO(
                                68,
                                217,
                                162,
                                1.0,
                              ), // Text color
                              elevation: 0, // Removes shadow (no elevation)
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius
                                        .zero, // No border radius (sharp edges)
                                side: BorderSide.none, // Removes border
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenWidth * 0.02,
                              ), // Responsive padding
                            ),
                            child: Text(
                              "Create New Wallet",
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.04, // Responsive font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

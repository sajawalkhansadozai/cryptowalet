import 'package:flutter/material.dart';

class ImportCustomToken extends StatelessWidget {
  const ImportCustomToken({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          "Import Custom Token",
          style: TextStyle(
            fontSize: screenWidth * 0.05,
          ), // Responsive font size
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ), // 5% horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02), // 2% of screen height
            // Info Container
            Container(
              width: double.infinity,
              height: screenHeight * 0.18, // 18% of screen height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 169, 238, 213),
                borderRadius: BorderRadius.circular(
                  screenWidth * 0.03,
                ), // Responsive border radius
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenWidth * 0.08,
                      left: screenWidth * 0.08,
                    ), // 8% padding
                    child: Icon(
                      Icons.info_outline,
                      size: screenWidth * 0.07, // Responsive icon size
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.08), // 8% padding
                      child: Text(
                        "Anyone can create a token, including fake versions of existing tokens. Learn more about scams and security risks.",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035, // Responsive font size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.04), // 4% of screen height
            // Borderless TextFields with Light Grey Background
            _buildTextField("Token Name", screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.04), // 4% of screen height
            _buildTextField("Token Symbol", screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.04), // 4% of screen height
            _buildTextField("Token Decimal", screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.04), // 4% of screen height
            // Import Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07, // 7% of screen height
              child: ElevatedButton(
                onPressed: () {
                  // Import action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                  ), // Responsive padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.02,
                    ), // Responsive border radius
                  ),
                ),
                child: Text(
                  "Import",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ), // Responsive font size
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04), // 4% of screen height
            // Cancel Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07, // 7% of screen height
              child: ElevatedButton(
                onPressed: () {
                  // Cancel action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 4,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                  ), // Responsive padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.02,
                    ), // Responsive border radius
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ), // Responsive font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Reusable function to build text fields
  Widget _buildTextField(
    String hintText,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      height: screenHeight * 0.1, // 10% of screen height
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
      ), // 3% horizontal padding
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(
          screenWidth * 0.02,
        ), // Responsive border radius
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.04,
          ), // Responsive font size
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015,
          ), // Responsive padding
        ),
      ),
    );
  }
}

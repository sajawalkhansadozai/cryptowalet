import 'package:flutter/material.dart';

class ImportNFT extends StatelessWidget {
  const ImportNFT({super.key});
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
          "Import NFT",
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ), // Responsive font size
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ), // 5% horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.04), // 4% of screen height
            // Token Name TextField
            _buildTextField("Token Name", screenWidth, screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "0/42",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03), // 4% of screen height
            // Token Symbol TextField
            _buildTextField("Token Symbol", screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.02), // 4% of screen height
            // Contract Address TextField
            _buildTextField("Contract Address", screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.06), // 4% of screen height
            // Import Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07, // 7% of screen height
              child: ElevatedButton(
                onPressed: () {
                  // Perform import action here
                  print("Import button pressed");
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
            SizedBox(height: screenHeight * 0.03), // 3% of screen height
            // Cancel Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07, // 7% of screen height
              child: ElevatedButton(
                onPressed: () {
                  // Perform cancel action here
                  print("Cancel button pressed");
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
            SizedBox(height: screenHeight * 0.05), // 5% of screen height
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
      height: screenHeight * 0.07, // Reduced from 0.1 to 0.07 (30% smaller)
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.002, // Add minimal vertical padding
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(screenWidth * 0.01),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.035, // Slightly smaller text
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.008, // Reduced content padding
          ),
        ),
      ),
    );
  }
}

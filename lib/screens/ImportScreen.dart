import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/ImportToken.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(screenWidth, screenHeight),
          SizedBox(height: screenHeight * 0.1),
          _buildWhiteCard(screenWidth, screenHeight),
        ],
      ),
    );
  }

  // Header Section
  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 50),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(child: SizedBox(height: 40)),
            TextSpan(
              text: "Import Account\n",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            WidgetSpan(child: SizedBox(height: 40)),
            TextSpan(
              text: "import your exiting account by \nentering its detail",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // White Card Section
  Widget _buildWhiteCard(double screenWidth, double screenHeight) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.05),
            topRight: Radius.circular(screenWidth * 0.05),
          ),
        ),
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle("Import Account Details", screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.035),
              _buildTextField(
                "Secret Recovery Phrase",
                screenWidth,
                screenHeight,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildTextField("Your Password", screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.1),
              _buildButtons(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  // Title Widget
  Widget _buildTitle(String title, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.03,
        left: screenWidth * 0.02,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField(
    String labelText,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: screenWidth * 0.035,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.02,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Buttons Section
  Widget _buildButtons(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        children: [
          _buildButton(
            "Import Existing",
            screenWidth,
            screenHeight,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImportToken()),
              );
            },
            commonButtonStyle(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
              screenWidth: screenWidth,
            ),
          ),
          SizedBox(height: screenHeight * 0.06),
          _buildButton(
            "Create New Wallet",
            screenWidth,
            screenHeight,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePasswordScreen()),
              );
            },
            ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide.none,
              ),
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
            ),
          ),
        ],
      ),
    );
  }

  // Button Widget
  Widget _buildButton(
    String text,
    double screenWidth,
    double screenHeight,
    VoidCallback onPressed,
    ButtonStyle buttonStyle,
  ) {
    return SizedBox(
      width: screenWidth * 0.8,
      height: screenHeight * 0.07,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          text,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Common Button Style
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
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
    );
  }
}

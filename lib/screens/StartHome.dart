import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:flutter/material.dart';

class Starthome extends StatelessWidget {
  const Starthome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(screenWidth, screenHeight),
          SizedBox(height: 100),
          _buildImage(screenWidth, screenHeight),
          SizedBox(height: 100),
          _buildButtons(context, screenWidth, screenHeight),
        ],
      ),
    );
  }

  // Header Section
  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 33),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Wallet Setup\n",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            WidgetSpan(child: SizedBox(height: 30)),
            TextSpan(
              text: "Import an existing wallet or create \na new wallet",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Image Section
  Widget _buildImage(double screenWidth, double screenHeight) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/fourth_image.png",
          width: screenWidth * 1,
          height: screenHeight * 0.4,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Buttons Section
  Widget _buildButtons(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Center(
      child: Column(
        children: [
          _buildButton(
            context,
            "Import Existing",
            Colors.white,
            const Color.fromRGBO(68, 217, 162, 1.0),
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImportScreen()),
            ),
          ),
          const SizedBox(height: 20),
          _buildButton(
            context,
            "Create New",
            const Color.fromRGBO(68, 217, 162, 1.0),
            Colors.white,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePasswordScreen()),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Button Function
  Widget _buildButton(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color foregroundColor,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 350,
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 5,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

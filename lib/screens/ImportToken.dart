import 'package:flutter/material.dart';
import 'package:cryptowalet/screens/ImportCustomToken.dart';

class ImportToken extends StatelessWidget {
  const ImportToken({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                children: [
                  Header(screenWidth: screenWidth, screenHeight: screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return TokenContainer(
                          text: "Token ${index + 1}",
                          imagePath: "assets/QR.png",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.02,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              child: FixedBottomButton(screenWidth: screenWidth),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const Header({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            size: screenWidth * 0.07,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            "Import Token",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (screenWidth >= 350)
          CustomButton(screenWidth: screenWidth, screenHeight: screenHeight),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const CustomButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImportCustomToken()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        minimumSize: Size(screenWidth * 0.3, screenHeight * 0.06),
      ),
      child: Text(
        "Custom Token",
        style: TextStyle(fontSize: screenWidth * 0.035),
      ),
    );
  }
}

class FixedBottomButton extends StatelessWidget {
  final double screenWidth;

  const FixedBottomButton({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Keep full width
      child: ElevatedButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImportCustomToken()),
            ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          minimumSize: Size(
            screenWidth,
            screenWidth * 0.12,
          ), // Slightly increased height
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.035,
          ), // Adjusted padding
        ),
        child: Text(
          "Import Token",
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TokenContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  final double screenWidth;
  final double screenHeight;

  const TokenContainer({
    super.key,
    required this.text,
    required this.imagePath,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.08,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 1, // How much the shadow spreads
            blurRadius: 4, // Softness of the shadow
            offset: Offset(
              0,
              2,
            ), // Position of the shadow (horizontal, vertical)
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.04,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey[400],
          ),
          SizedBox(width: screenWidth * 0.03),
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

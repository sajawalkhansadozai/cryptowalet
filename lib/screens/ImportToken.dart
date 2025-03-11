import 'package:flutter/material.dart';
import 'package:cryptowalet/screens/ImportCustomToken.dart';

class ImportToken extends StatelessWidget {
  const ImportToken({super.key});

  // Token data list with unique names and images
  final List<TokenData> tokens = const [
    TokenData(name: 'USDT', image: 'assets/i1.png'),
    TokenData(name: 'THETA', image: 'assets/i2.png'),
    TokenData(name: 'SHIBA', image: 'assets/i3.png'),
    TokenData(name: 'USDC', image: 'assets/i4.png'),
    TokenData(name: 'HEX', image: 'assets/i5.png'),
    TokenData(name: 'ETH', image: 'assets/i6.png'),
    TokenData(name: 'XRP', image: 'assets/i7.png'),
    TokenData(name: 'BNB', image: 'assets/i8.png'),
  ];

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
                  SizedBox(height: screenHeight * 0.04),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tokens.length,
                      itemBuilder: (context, index) {
                        return buildTokenContainer(
                          context,
                          tokens[index].name,
                          tokens[index].image,
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

  // Reusable Token Container Function
  Widget buildTokenContainer(
    BuildContext context,
    String text,
    String imagePath,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.08,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.04,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey[300],
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

// Token data model
class TokenData {
  final String name;
  final String image;

  const TokenData({required this.name, required this.image});
}

// Header remains unchanged
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
              fontSize: screenWidth * 0.044,
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

// CustomButton remains unchanged
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
        minimumSize: Size(screenWidth * 0.3, screenHeight * 0.04),
      ),
      child: Text(
        "Custom Token",
        style: TextStyle(fontSize: screenWidth * 0.035),
      ),
    );
  }
}

// FixedBottomButton remains unchanged
class FixedBottomButton extends StatelessWidget {
  final double screenWidth;

  const FixedBottomButton({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
          minimumSize: Size(screenWidth, screenWidth * 0.12),
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.035),
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

import 'package:cryptowalet/screens/CreateAccountScreen.dart';
import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:flutter/material.dart';

class Starthome extends StatelessWidget {
  const Starthome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Common button style
    ButtonStyle commonButtonStyle({
      required Color backgroundColor,
      required Color foregroundColor,
    }) {
      return ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns text left
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Wallet Setup\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Import an existing wallet or create a new wallet",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Centered Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/fourth_image.png",
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Buttons
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 55,
                    child: ElevatedButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImportScreen(),
                            ),
                          ),
                      style: commonButtonStyle(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromRGBO(
                          68,
                          217,
                          162,
                          1.0,
                        ),
                      ),
                      child: const Text(
                        "Import Existing",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateWalletScreen(),
                          ),
                        );
                      },
                      style: commonButtonStyle(
                        backgroundColor: const Color.fromRGBO(
                          68,
                          217,
                          162,
                          1.0,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Create one",
                        style: TextStyle(
                          fontSize: 18,
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
    );
  }
}

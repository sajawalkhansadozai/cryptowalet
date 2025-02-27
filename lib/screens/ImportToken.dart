import 'package:cryptowalet/screens/ImportCustomToken.dart';
import 'package:flutter/material.dart';

class ImportToken extends StatelessWidget {
  const ImportToken({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // ✅ Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  // ✅ Row for Back Button & Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back, size: 28),
                      Expanded(
                        child: Text(
                          "Import Token",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      MediaQuery.of(context).size.width < 350
                          ? SizedBox.shrink() // Hide button on small screens
                          : CustomButton(), // Show button on large screens
                    ],
                  ),
                  const SizedBox(height: 10),

                  // ✅ Button (Full width on small screens)
                  if (MediaQuery.of(context).size.width < 350) CustomButton(),

                  // ✅ Token List (Scrollable)
                  Expanded(
                    child: ListView.builder(
                      itemCount: 30, // Change as needed
                      itemBuilder: (context, index) {
                        return TokenContainer(
                          text: "Token ${index + 1}",
                          imagePath: "assets/avatar.png",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Fixed Bottom Button
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: FixedBottomButton(),
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
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(68, 217, 162, 1.0),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(120, 45),
      ),
      child: Text("Custom Token", style: TextStyle(fontSize: 14)),
    );
  }
}

/// ✅ **Fixed Bottom Button (Full Width)**
class FixedBottomButton extends StatelessWidget {
  const FixedBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImportCustomToken(),
            ), // Replace `NextPage` with your target page
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(68, 217, 162, 1.0),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 14), // Adjust height
        ),
        child: Text(
          "Import Token",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/// ✅ **Reusable Token Container**
class TokenContainer extends StatelessWidget {
  final String text;
  final String imagePath;

  const TokenContainer({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey[400],
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

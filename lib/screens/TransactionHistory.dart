import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

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
                    children: [
                      // Row for Back Button & Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, size: 28),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "Transaction History", // The main text
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " ETH", // Additional styled text
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Removed CustomButton logic entirely
                        ],
                      ),
                      const SizedBox(height: 20), // Add spacing
                      buildToken(context),
                      buildToken(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Token Component
Widget buildToken(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
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
            "50.00THETA \n50\$",
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

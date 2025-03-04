import 'package:flutter/material.dart';

class AmountPage extends StatelessWidget {
  const AmountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button & Title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Custombutton(context),
                  ),
                ],
              ),
              SizedBox(height: 30),
              buildToken(context, 'ETH'),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "0",
                  style: TextStyle(
                    color: Color.fromRGBO(68, 217, 162, 1.0),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Add other widgets here
              Center(child: Text("Balance: 0.0ETH")),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16), // Padding around the button
                child: ElevatedButton(
                  onPressed: () {
                    // Perform action when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AmountPage(),
                      ), // Replace with your page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                      68,
                      217,
                      162,
                      1,
                    ), // Button color
                    foregroundColor: Colors.white, // Text color
                    minimumSize: Size(
                      double.infinity,
                      50,
                    ), // Full width, fixed height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Rounded corners
                    ),
                  ),
                  child: Text(
                    "Next", // Button text
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Custombutton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to ImportCustomToken screen
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: Color.fromRGBO(68, 217, 162, 1.0), width: 1),
        minimumSize: Size(120, 45),
      ),
      child: Text("Cancel", style: TextStyle(fontSize: 14)),
    );
  }
}

/// ✅ **Token Component**
Widget buildToken(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 10,
    ), // Flexible padding
    child: Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16), // Proper padding for text
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 122, 122, 122),
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.expand_more, size: 18, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

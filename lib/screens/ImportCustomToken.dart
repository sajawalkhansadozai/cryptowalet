import 'package:flutter/material.dart';

class ImportCustomToken extends StatelessWidget {
  const ImportCustomToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Import Custom Token"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Info Container
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 169, 238, 213),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.info_outline),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Anyone can create a token, including fake versions of existing tokens. Learn more about scams and security risks.",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30), // Spacing
            // Borderless TextFields with Light Grey Background
            _buildTextField("Token Name"),
            SizedBox(height: 30), // Spacing
            _buildTextField("Token Symbol"),
            SizedBox(height: 30), // Spacing
            _buildTextField("Contract Address"),
            SizedBox(height: 30), // Spacing
            // Import Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Import action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(68, 217, 162, 1.0),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Import", style: TextStyle(fontSize: 16)),
              ),
            ),

            SizedBox(height: 40), // Spacing
            // Cancel Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Cancel action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 4,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Cancel", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Reusable function to build text fields
  Widget _buildTextField(String hintText) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ImportNFT extends StatelessWidget {
  const ImportNFT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        title: const Text("Import NFT"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30), // Spacing
            // Token Name TextField
            _buildTextField("Token Name"),
            const SizedBox(height: 30), // Spacing
            // Token Symbol TextField
            _buildTextField("Token Symbol"),
            const SizedBox(height: 30), // Spacing
            // Contract Address TextField
            _buildTextField("Contract Address"),
            const SizedBox(height: 30), // Spacing
            // Import Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Perform import action here
                  print("Import button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Import", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 20), // Spacing
            // Cancel Button (Full Width)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Perform cancel action here
                  print("Cancel button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Cancel", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 40), // Spacing
          ],
        ),
      ),
    );
  }

  /// ✅ Reusable function to build text fields
  Widget _buildTextField(String hintText) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

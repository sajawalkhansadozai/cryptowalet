import 'package:cryptowalet/screens/CreateAccountScreen.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

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

class _ImportScreenState extends State<ImportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Import Account\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Import an existing wallet by entering its details",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 70),

          // White Card below the text
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 10),
                    child: Text(
                      "Import Account Details",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Secret Recovery Phrase",
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true, // Adds a background color
                      fillColor: Colors.grey[200], // Light grey background
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded edges
                        borderSide: BorderSide.none, // No visible border
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Your Password",
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true, // Adds a background color
                      fillColor: Colors.grey[200], // Light grey background
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded edges
                        borderSide: BorderSide.none, // No visible border
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
                              foregroundColor: Colors.white,
                              backgroundColor: const Color.fromRGBO(
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
                        const SizedBox(height: 80),
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.white, // Button background color
                              foregroundColor: const Color.fromRGBO(
                                68,
                                217,
                                162,
                                1.0,
                              ), // Text color
                              elevation: 0, // Removes shadow (no elevation)
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius
                                        .zero, // No border radius (sharp edges)
                                side: BorderSide.none, // Removes border
                              ),
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
          ),
        ],
      ),
    );
  }
}

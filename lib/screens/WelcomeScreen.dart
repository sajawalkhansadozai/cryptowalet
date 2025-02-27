import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/OpenWallet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

// Common button style function
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

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome Back\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Please Login to your Account using \nyour password",
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
                    padding: EdgeInsets.only(top: 90, left: 10),
                    child: Text(
                      "Enter Password to Unlock",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 100),
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
                                    builder: (context) => Openwallet(),
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
                              "Open Wallet",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Checkbox and disclaimer text
                      ],
                    ),
                  ),
                  const SizedBox(height: 90),
                  // Setup New Wallet Text
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'Can’t login? You can erase your current wallet and ',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 201, 195, 195),
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Setup New Wallet',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => CreatePasswordScreen(),
                                      ),
                                    );
                                  },
                          ),
                        ],
                      ),
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

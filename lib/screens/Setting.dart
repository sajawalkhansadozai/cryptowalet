import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                    "Settings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Currency Conversion Section
              RichTextSection(
                title: "Currency Conversion",
                subtitle:
                    "Currency conversion, Primary currency,\n Language & Search engine",
              ),
              const SizedBox(height: 15),
              buildToken(context, "   USD"), // Pass text without spaces
              const SizedBox(height: 20),
              // Current Language Section
              RichTextSection(
                title: "Current Language",
                subtitle: "Manage private key & Export wallet",
              ),
              buildToken(context, "   ETH"), // Pass text without spaces
              SizedBox(height: 20),
              RichTextSection(
                title: "Show Private Key",
                subtitle: "Tap and Hold to reveal and copy key",
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "About Cryptomask",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              padding: const EdgeInsets.only(
                left: 16,
              ), // Proper padding for text
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
}

/// ✅ **RichTextSection Widget**
class RichTextSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const RichTextSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black, // Fallback style
            fontSize: 16, // Fallback font size
          ),
          children: <TextSpan>[
            TextSpan(
              text: '$title\n\n',
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            TextSpan(
              text: subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/SecreteRecoveryPhase.dart';
import 'package:cryptowalet/screens/WriteDownInOrder.dart';
import 'package:flutter/material.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  int _currentStep = 0; // Track step index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Expanded(child: Center(child: buildStepContent(_currentStep))),
            buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  /// 🔹 Builds the content of each step
  Widget buildStepContent(int step) {
    switch (step) {
      case 0:
        return navigateTo(CreatePasswordScreen());
      case 1:
        return navigateTo(SecreteRecoveryPhase());
      case 2:
        return navigateTo(WriteDownInOrder());
      default:
        return const Text(
          "Unknown Step",
          style: TextStyle(fontSize: 20, color: Colors.black),
        );
    }
  }

  /// 🔹 Handles navigation in a safer way
  Widget navigateTo(Widget screen) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    });
    return const SizedBox(); // Return an empty widget to prevent UI issues
  }

  /// 🔹 Builds navigation buttons (Next & Previous)
  Widget buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentStep > 0)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep -= 1; // Go to previous step
                });
              },
              child: const Text("Previous"),
            ),
          const SizedBox(width: 10),
          if (_currentStep < 2)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep += 1; // Go to next step
                });
              },
              child: const Text("Next"),
            ),
        ],
      ),
    );
  }
}

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
  final int _currentStep = 0; // Track step index

  /// 🔹 Builds the content of each step
  Widget buildStepContent(int step) {
    switch (step) {
      case 0:
        return CreatePasswordScreen();
      case 1:
        return SecreteRecoveryPhase();
      case 2:
        return WriteDownInOrder();
      default:
        return Text(
          "Unknown Step",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.black,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Expanded(child: Center(child: buildStepContent(_currentStep))),
            ],
          ),
        ),
      ),
    );
  }
}

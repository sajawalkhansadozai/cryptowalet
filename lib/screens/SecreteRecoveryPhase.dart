import 'package:cryptowalet/screens/CreatePasswordScreen.dart';
import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/WriteDownInOrder.dart' as writeDown;
import 'package:cryptowalet/screens/wallet_widgets.dart' as walletWidgets;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SecreteRecoveryPhase extends StatefulWidget {
  const SecreteRecoveryPhase({super.key});

  @override
  State<SecreteRecoveryPhase> createState() => _SecreteRecoveryPhaseState();
}

class _SecreteRecoveryPhaseState extends State<SecreteRecoveryPhase> {
  int _currentStep = 1; // Step tracking

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 1) {
        _currentStep--;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CreatePasswordScreen()),
        );
      }
    });
  }

  Widget buildRecoveryContainer(
    String text,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      height: screenHeight * 0.04,
      width: screenWidth * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(68, 217, 162, 1.0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.035,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<String> recoveryPhrases = [
      "apple",
      "treat",
      "cherry",
      "dog",
      "expand",
      "fox",
      "grape",
      "house",
      "ice",
      "jug",
      "kite",
      "lion",
      "key",
      "nest",
      "range",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, _previousStep),
              _buildStepper(context, _currentStep),
              _buildTitleSection(screenWidth, screenHeight),
              SizedBox(height: 10),
              _buildRecoveryPhraseGrid(
                recoveryPhrases,
                screenWidth,
                screenHeight,
              ),
              _buildContinueButton(screenWidth, screenHeight),
              _buildImportWalletText(screenWidth),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header with a back button and title
  Widget _buildHeader(BuildContext context, VoidCallback onBack) {
    return Row(
      children: [
        _buildBackButton(context, onBack),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        _buildHeaderText(context),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context, VoidCallback onBack) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ElevatedButton(
        onPressed: onBack,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: MediaQuery.of(context).size.width * 0.07,
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.06),
      child: Text(
        "Create New Wallet",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  /// Builds the stepper widget
  Widget _buildStepper(BuildContext context, int currentStep) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
      ),
      child: walletWidgets.buildStepper(
        context,
        currentStep,
        (int index) {}, // Fixed null error
      ),
    );
  }

  /// Builds the title section
  Widget _buildTitleSection(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.1,
        top: screenHeight * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Secret Recovery Phrase",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "This is your secret recovery. Write it down \nand save it somewhere This is your secret \nrecovery. Write it down and save it\n somewhere",
            style: TextStyle(
              color: Color.fromARGB(255, 201, 195, 195),
              fontSize: screenWidth * 0.035,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the grid of recovery phrases
  Widget _buildRecoveryPhraseGrid(
    List<String> recoveryPhrases,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (rowIndex) {
            return Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (colIndex) {
                  int phraseIndex = rowIndex * 3 + colIndex;
                  if (phraseIndex < recoveryPhrases.length) {
                    return buildRecoveryContainer(
                      recoveryPhrases[phraseIndex],
                      screenWidth,
                      screenHeight,
                    );
                  } else {
                    return SizedBox();
                  }
                }),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// Builds the "Continue" button
  Widget _buildContinueButton(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.05,
      ),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _nextStep();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => writeDown.WriteDownInOrder(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(68, 217, 162, 1.0),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
                vertical: screenHeight * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the "Already have Wallet? Import Wallet" text
  Widget _buildImportWalletText(double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.04),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Already have a Wallet ',
            style: TextStyle(
              color: Color.fromARGB(255, 201, 195, 195),
              fontSize: screenWidth * 0.035,
            ),
            children: [
              TextSpan(
                text: 'Import Wallet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(68, 217, 162, 1.0),
                  fontSize: screenWidth * 0.035,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImportScreen(),
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

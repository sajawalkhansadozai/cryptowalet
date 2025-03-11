import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/SecreteRecoveryPhase.dart';
import 'package:cryptowalet/screens/WelcomeScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WriteDownInOrder extends StatefulWidget {
  const WriteDownInOrder({super.key});

  @override
  State<WriteDownInOrder> createState() => _WriteDownInOrderState();
}

class _WriteDownInOrderState extends State<WriteDownInOrder> {
  int _currentStep = 2;

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 2) {
        _currentStep--;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecreteRecoveryPhase()),
        );
      }
    });
  }

  Widget buildRecoveryContainer(
    String text,
    double screenWidth,
    double screenHeight,
  ) {
    return Flexible(
      child: Container(
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
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, _previousStep),
              SizedBox(height: screenHeight * 0.03),
              _buildStepper(context, _currentStep, _onStepTapped),
              SizedBox(height: screenHeight * 0.02),
              _buildTitleSection(screenWidth, screenHeight),
              SizedBox(height: 10),
              _buildRecoveryPhraseGrid(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildContinueButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildImportWalletText(screenWidth),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header with a back button and title
  Widget _buildHeader(BuildContext context, VoidCallback onBack) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        _buildBackButton(screenWidth, screenHeight, onBack),
        SizedBox(width: screenWidth * 0.02),
        _buildHeaderText(screenWidth),
      ],
    );
  }

  Widget _buildBackButton(
    double screenWidth,
    double screenHeight,
    VoidCallback onBack,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.03,
        left: screenWidth * 0.05,
      ),
      child: ElevatedButton(
        onPressed: onBack,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(screenWidth * 0.03),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: screenWidth * 0.07,
        ),
      ),
    );
  }

  Widget _buildHeaderText(double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.03),
      child: Text(
        "Create New Wallet",
        style: TextStyle(
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  /// Builds the stepper UI
  Widget _buildStepper(
    BuildContext context,
    int currentStep,
    Function(int) onStepTapped,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildStepperLine(currentStep, screenWidth, screenHeight),
          _buildStepperCircles(currentStep, screenWidth),
        ],
      ),
    );
  }

  Widget _buildStepperLine(
    int currentStep,
    double screenWidth,
    double screenHeight,
  ) {
    return Row(
      children: List.generate(2, (index) {
        return Expanded(
          child: Container(
            height: screenHeight * 0.003,
            color:
                currentStep > index
                    ? const Color.fromRGBO(68, 217, 162, 1.0)
                    : const Color.fromARGB(255, 221, 216, 216),
          ),
        );
      }),
    );
  }

  Widget _buildStepperCircles(int currentStep, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () => _onStepTapped(index),
          child: Container(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    currentStep >= index
                        ? const Color.fromRGBO(68, 217, 162, 1.0)
                        : Colors.grey.shade300,
                width: screenWidth * 0.016,
              ),
              color:
                  currentStep > index
                      ? const Color.fromRGBO(68, 217, 162, 1.0)
                      : Colors.white,
            ),
            child:
                currentStep > index
                    ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: screenWidth * 0.04,
                    )
                    : currentStep == index
                    ? Center(
                      child: Container(
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(68, 217, 162, 1.0),
                        ),
                      ),
                    )
                    : null,
          ),
        );
      }),
    );
  }

  /// Builds the title section
  Widget _buildTitleSection(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Write Down In Order",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "This is your secret recovery. Write it down \nand save it somewhere This is your secret \nrecovery. Write it down and save it\n somewhere",
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.035),
          ),
        ],
      ),
    );
  }

  /// Builds the grid of recovery phrases
  Widget _buildRecoveryPhraseGrid(double screenWidth, double screenHeight) {
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
                  return buildRecoveryContainer(
                    "-----",
                    screenWidth,
                    screenHeight,
                  );
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
                MaterialPageRoute(builder: (context) => Welcomescreen()),
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

  /// Builds the "Already have a Wallet? Import Wallet" text
  Widget _buildImportWalletText(double screenWidth) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have a Wallet? ',
          style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.035),
          children: [
            TextSpan(
              text: 'Import Wallet',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(68, 217, 162, 1.0),
                fontSize: screenWidth * 0.035,
                decoration: TextDecoration.underline,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImportScreen()),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }

  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }
}

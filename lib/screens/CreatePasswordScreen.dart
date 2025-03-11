import 'package:cryptowalet/screens/ImportScreen.dart';
import 'package:cryptowalet/screens/SecreteRecoveryPhase.dart';
import 'package:cryptowalet/screens/StartHome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State {
  int _currentStep = 0;
  bool isChecked = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isButtonEnabled = false;

  // Step Navigation Methods
  void _nextStep() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Starthome()),
        );
      }
    });
  }

  // Input Validation
  void _validateInput() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      isButtonEnabled =
          password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          password == confirmPassword &&
          isChecked;
    });
  }

  // Build UI Components
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, _previousStep),
              SizedBox(height: screenHeight * 0.03),
              _buildStepper(context, _currentStep),
              SizedBox(height: screenHeight * 0.04),
              _buildTitleSection(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.05),
              _buildPasswordField(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.08),
              _buildCreatePasswordButton(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.18),
              _buildImportWalletText(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  // Header with Back Button
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
        top: screenHeight * 0.02,
        left: screenWidth * 0.02,
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

  // Title Section
  Widget _buildTitleSection(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create Password",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "The Password will lock your wallet only on this device.",
            style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
          ),
        ],
      ),
    );
  }

  // Password Fields
  Widget _buildPasswordField(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            "New Password",
            _passwordController,
            screenWidth,
            screenHeight,
          ),
          SizedBox(height: screenHeight * 0.02),
          _buildTextField(
            "Confirm Password",
            _confirmPasswordController,
            screenWidth,
            screenHeight,
          ),
          SizedBox(height: screenHeight * 0.04),
          _buildCheckboxAndText(screenWidth),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String labelText,
    TextEditingController controller,
    double screenWidth,
    double screenHeight,
  ) {
    return TextField(
      controller: controller,
      obscureText: true,
      onChanged: (value) => _validateInput(),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: screenWidth * 0.04,
          fontFamily: 'Poppins',
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.01),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Checkbox and Text
  Widget _buildCheckboxAndText(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.001),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue ?? false;
              });
              _validateInput();
            },
            activeColor: const Color.fromRGBO(68, 217, 162, 1.0),
          ),
          SizedBox(height: 20),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'I understand that this password cannot be recovered.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.035,
                ),
                children: [
                  TextSpan(
                    text: ' Learn more',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(68, 217, 162, 1.0),
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

  // Create Password Button
  Widget _buildCreatePasswordButton(double screenWidth, double screenHeight) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.75, // Full width to match text fields
        child: ElevatedButton(
          onPressed:
              isButtonEnabled
                  ? () {
                    _nextStep();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecreteRecoveryPhase(),
                      ),
                    );
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isButtonEnabled
                    ? const Color.fromRGBO(68, 217, 162, 1.0)
                    : Colors.grey,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal:
                  screenWidth * 0.04, // Matches text field horizontal padding
              vertical:
                  screenHeight * 0.023, // Matches text field vertical padding
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
          ),
          child: Text(
            "Create Password",
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Import Wallet Text
  Widget _buildImportWalletText(double screenWidth) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have a wallet? ',
          style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.035),
          children: [
            TextSpan(
              text: 'Import Wallet',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(68, 217, 162, 1.0),
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImportScreen(),
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }

  // Stepper UI
  Widget _buildStepper(BuildContext context, int currentStep) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
          onTap: null,
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
                width:
                    currentStep >= index
                        ? screenWidth * 0.016
                        : screenWidth * 0.016,
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
}

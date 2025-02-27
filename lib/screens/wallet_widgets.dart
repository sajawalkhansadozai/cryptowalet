import 'package:flutter/material.dart';

/// 🔹 Builds the header with a back button and title
Widget buildHeader(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          child: const Icon(Icons.chevron_left, color: Colors.black, size: 30),
        ),
      ),
      const SizedBox(width: 10),
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          "Create New Wallet",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

/// 🔹 Builds the stepper UI
Widget buildStepper(int currentStep, Function(int) onStepTapped) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Stepper Line
        Row(
          children: List.generate(2, (index) {
            return Expanded(
              child: Container(
                height: 4,
                color:
                    currentStep > index
                        ? const Color.fromRGBO(68, 217, 162, 1.0)
                        : const Color.fromARGB(255, 221, 216, 216),
              ),
            );
          }),
        ),
        // Stepper Circles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () => onStepTapped(index),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        currentStep >= index
                            ? const Color.fromRGBO(68, 217, 162, 1.0)
                            : Colors.grey,
                    width: 3,
                  ),
                  color:
                      currentStep > index
                          ? const Color.fromRGBO(
                            68,
                            217,
                            162,
                            1.0,
                          ) // Completed step color
                          : Colors.white,
                ),
                child:
                    currentStep > index
                        ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ) // Checkmark for completed steps
                        : currentStep == index
                        ? Center(
                          // Active step - with small dot
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(68, 217, 162, 1.0),
                            ),
                          ),
                        )
                        : null, // No dot for inactive steps
              ),
            );
          }),
        ),
      ],
    ),
  );
}

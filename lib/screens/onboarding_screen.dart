import 'package:cryptowalet/screens/StartHome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentIndex = 0;

  // List of titles for each screen
  final List<String> appBarTitles = [
    "Trust By Mission",
    "Safe, Reliable and Superfast",
    "Your Key to Explore Web3",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double boxWidth = screenWidth * 0.8;
    double boxHeight = screenHeight * 0.55;

    return Scaffold(
      appBar: buildAppBar(appBarTitles[currentIndex]),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                  currentIndex = index;
                });
              },
              children: [
                OnboardingPage(
                  width: boxWidth,
                  height: boxHeight,
                  imagePath: "assets/first_image.png",
                  text:
                      "Here you can write the description of the page and find out what you want.",
                ),
                OnboardingPage(
                  width: boxWidth,
                  height: boxHeight,
                  imagePath: "assets/second_image.png",
                  text:
                      "Here you can write the description of the page and find out what you want.",
                ),
                OnboardingPage(
                  width: boxWidth,
                  height: boxHeight,
                  imagePath: "assets/third_image.png",
                  text:
                      "Here you can write the description of the page and find out what you want.",
                ),
              ],
            ),
          ),
          buildBottomSection(),
        ],
      ),
    );
  }

  /// **Function to Build App Bar with Dynamic Title**
  PreferredSizeWidget buildAppBar(String title) {
    return AppBar(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        if (!isLastPage)
          TextButton(
            onPressed: () => _controller.jumpToPage(2),
            child: Text("Skip", style: TextStyle(color: Colors.white)),
          ),
      ],
    );
  }

  /// **Function to Build Bottom Section with SmoothPageIndicator and Button**
  Widget buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Color.fromRGBO(68, 217, 162, 1.0),
              dotColor: Colors.grey,
              dotHeight: 5,
              dotWidth: 5,
              expansionFactor: 4,
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              if (isLastPage) {
                // Navigate to StartHome when it's the last page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Starthome()),
                );
              } else {
                // Move to the next page
                _controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            child: Text(
              isLastPage ? "Get Started" : "Skip",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(68, 217, 162, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

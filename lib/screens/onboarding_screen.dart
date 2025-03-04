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

  final List<String> appBarTitles = [
    "Trust By Mission",
    "Safe, Reliable and Superfast",
    "Your Key to Explore Web3",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final boxWidth = screenWidth * 0.8;
    final boxHeight = screenHeight * 0.55;

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
          buildBottomSection(screenWidth, screenHeight),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
      centerTitle: true,
      actions: [
        if (!isLastPage)
          TextButton(
            onPressed: () => _controller.jumpToPage(2),
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildBottomSection(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Color.fromRGBO(68, 217, 162, 1.0),
              dotColor: Colors.grey,
              dotHeight: screenHeight * 0.007,
              dotWidth: screenWidth * 0.02,
              expansionFactor: 4,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          TextButton(
            onPressed: () {
              if (isLastPage) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Starthome()),
                );
              } else {
                _controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            child: Text(
              isLastPage ? "Get Started" : "Skip",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Color.fromRGBO(68, 217, 162, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

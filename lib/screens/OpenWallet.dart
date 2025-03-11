import 'package:cryptowalet/screens/ImportNFT.dart';
import 'package:cryptowalet/screens/ImportToken.dart';
import 'package:cryptowalet/screens/SendPage.dart';
import 'package:cryptowalet/screens/Setting.dart';
import 'package:cryptowalet/screens/SwapPage.dart';
import 'package:cryptowalet/screens/TransactionHistory.dart';
import 'package:flutter/material.dart';

class Openwallet extends StatefulWidget {
  const Openwallet({super.key});

  @override
  State createState() => _OpenwalletState();
}

class _OpenwalletState extends State<Openwallet> {
  int selectedTabIndex = 0; // Track selected tab (0 = Token, 1 = Collection)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Custom Profile Section (Centered)
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 200),
                child: Text(
                  "EOONIA",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ), // Add spacing
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50, // Adjust size as needed
                      backgroundImage: AssetImage("assets/profile_image.png"),
                    ),
                    const SizedBox(height: 10), // Space between image and text
                    Text(
                      "Account No 1",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(68, 217, 162, 1.0),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ), // Space between account name and email
                    Text(
                      "esrfg 543.....\n0USD",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Wallet'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_outlined),
                title: const Text('Transaction History'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransactionHistory(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share_outlined),
                title: const Text('Share Public Address'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove_red_eye_outlined),
                title: const Text('View on Etherson'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(), // Push remaining content to the bottom
              const SizedBox(height: 100), // Add spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Color.fromRGBO(68, 217, 162, 1), // Set opacity to 0.1
                  thickness: 1.3,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Get help'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFE74C3C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Transform.rotate(
                      angle: 3.14, // Rotate by 180 degrees (π radians)
                      child: Icon(Icons.logout, color: Colors.white),
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),

                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                buildWalletHeader(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionButton(
                      icon: Icons.arrow_downward,
                      text: "Receive",
                      onTap: () {
                        showReceiveDialog(context);
                      },
                    ),
                    ActionButton(
                      icon: Icons.arrow_upward,
                      text: "Send",
                      navigationPage: SendPage(),
                    ),
                    ActionButton(
                      icon: Icons.swap_vert,
                      text: "Swap",
                      navigationPage: const SwapPage(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTabButton(index: 0, text: "Token"),
                    buildTabButton(index: 1, text: "Collection"),
                  ],
                ),
                const SizedBox(height: 10),
                IndexedStack(
                  index: selectedTabIndex,
                  children: [
                    buildToken(context), // Token Tab
                    buildCollection(context), // Collection Tab
                  ],
                ),
                const SizedBox(height: 30),
                if (selectedTabIndex == 0)
                  Center(child: buildLastText(context)),
                const SizedBox(height: 20),
              ],
            ),
            // Positioned Text "Ethereum" in the Top-Right Corner
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  top: 30,
                ), // Add some padding for spacing
                child: Container(
                  height: 32,
                  width: 93,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Ethereum",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(68, 217, 162, 1.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned Menu Button in the Top-Left Corner
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 30,
                ), // Add some padding for spacing
                child: Builder(
                  builder:
                      (context) => IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer(); // Open the drawer
                        },
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ **Reusable Function to Show Receive Dialog**
  void showReceiveDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: SizedBox(
            width: 380,
            height: screenHeight * 0.5,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Receive",
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Scan QR code to Receive your payment",
                    style: TextStyle(fontSize: screenWidth * 0.03),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Image.asset(
                    "assets/QR.png",
                    width: screenWidth * 0.5,
                    height: screenWidth * 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.05,
                        color: Colors.grey[200],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "0xd4rdc......",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.copy, size: screenWidth * 0.06),
                                  SizedBox(width: screenWidth * 0.02),
                                  Icon(Icons.share, size: screenWidth * 0.06),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// ✅ **Wallet Header Section**
  Widget buildWalletHeader() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(68, 217, 162, 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/profile_image.png"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Account No 1",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "dfg456.......",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "0 USD",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// ✅ **Reusable Function for Tabs (Token & Collection)**
  Widget buildTabButton({required int index, required String text}) {
    bool isSelected = selectedTabIndex == index;
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return GestureDetector(
      onTap: () => setState(() => selectedTabIndex = index),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:
                  isSelected
                      ? const Color.fromRGBO(68, 217, 162, 1.0)
                      : Colors.black,
            ),
          ),
          // Conditionally render either the grey line or the green line
          Container(
            width: screenWidth * 0.5, // 50% of screen width
            height: 5, // Height of the line
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? const Color.fromRGBO(
                        68,
                        217,
                        162,
                        1.0,
                      ) // Green line when selected
                      : Colors.grey.withOpacity(
                        0.5,
                      ), // Grey line when not selected
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildToken(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/profile_image.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "0.00THET \n0USD",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Icon(Icons.chevron_right, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ **Collection Component**
  Widget buildCollection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: Column(
          children: [
            Text(
              "Don't you See your NFT??",
              style: TextStyle(color: const Color.fromARGB(255, 211, 204, 204)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImportNFT()),
                );
              },
              child: const Text(
                "Import NFT",
                style: TextStyle(
                  color: Color.fromRGBO(68, 217, 162, 1.0),
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ **Import Token Text**
  Widget buildLastText(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Don't you see your token??",
            style: TextStyle(color: const Color.fromARGB(255, 211, 204, 204)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImportToken()),
              );
            },
            child: const Text(
              "Import Token",
              style: TextStyle(color: Color.fromRGBO(68, 217, 162, 1.0)),
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ **Reusable Action Button Widget**
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? navigationPage;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.text,
    this.navigationPage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            if (navigationPage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => navigationPage!),
              );
            }
          },
      child: Container(
        width: 80, // Set the width of the square box
        height: 80, // Set the height of the square box
        decoration: BoxDecoration(
          color: Colors.grey[200], // Background color of the box
          borderRadius: BorderRadius.circular(
            10,
          ), // Optional: Add rounded corners
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            Icon(
              icon,
              size: 30,
              color: const Color.fromRGBO(68, 217, 162, 1.0),
            ),
            const SizedBox(height: 5), // Add spacing between icon and text
            Text(
              text,
              textAlign: TextAlign.center, // Ensure text is centered
              style: const TextStyle(
                fontSize: 12,
              ), // Adjust font size if needed
            ),
          ],
        ),
      ),
    );
  }
}

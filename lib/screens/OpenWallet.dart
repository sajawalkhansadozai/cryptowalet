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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(),
                accountName: const Text(
                  "Account No 1",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(68, 217, 162, 1.0),
                  ),
                ),
                accountEmail: const Text(
                  "esrfg543.....",
                  style: TextStyle(color: Color.fromARGB(255, 179, 172, 172)),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_image.png"),
                ),
              ),
              const Spacer(), // Push content to the bottom
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Wallet'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
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
                leading: const Icon(Icons.share),
                title: const Text('Share Public Address'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.view_agenda),
                title: const Text('View on Etherson'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 100),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Get Detail'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
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
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.red,
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
        body: ListView(
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
            if (selectedTabIndex == 0) Center(child: buildLastText(context)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// ✅ **Reusable Function to Show Receive Dialog**
  void showReceiveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Receive",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const Text("Scan QR code to Receive your payment"),
                  Image.asset("assets/QR.png"),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40,
                        color: const Color.fromARGB(255, 216, 211, 211),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("0xd4rdc......"),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 150),
                            child: Icon(Icons.copy),
                          ),
                          const Icon(Icons.share),
                        ],
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
            ],
          ),
        ),
      ],
    );
  }

  /// ✅ **Reusable Function for Tabs (Token & Collection)**
  Widget buildTabButton({required int index, required String text}) {
    bool isSelected = selectedTabIndex == index;

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
          if (isSelected)
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(68, 217, 162, 1.0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  /// ✅ **Token Component**
  Widget buildToken(BuildContext context) {
    return const Center(child: Text("Token List Placeholder"));
  }

  /// ✅ **Collection Component**
  Widget buildCollection(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImportNFT()),
          );
        },
        child: const Text("Import NFT"),
      ),
    );
  }

  /// ✅ **Import Token Text**
  Widget buildLastText(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImportToken()),
          );
        },
        child: const Text("Import Token"),
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
      child: Column(
        children: [
          Icon(icon, size: 30, color: const Color.fromRGBO(68, 217, 162, 1.0)),
          Text(text),
        ],
      ),
    );
  }
}

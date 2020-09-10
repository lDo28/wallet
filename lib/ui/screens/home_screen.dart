import 'package:flutter/material.dart';
import 'package:wallet/ui/vo/tab_bar_item.dart';
import 'package:wallet/ui/widgets/w_button.dart';
import 'package:wallet/ui/widgets/w_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text("Without loading"),
                _buildButton(),
                SizedBox(height: 30),
                Text("With loading"),
                _buildLoadingButton(icon: Icons.add, label: 'Add'),
                _buildLoadingButton(icon: Icons.remove),
                SizedBox(height: 30),
                Text("Tab bar"),
                WTabBar(
                  items: [
                    TabBarItem(0,
                        label: "Home", leading: Icons.home, color: Colors.red),
                    TabBarItem(1,
                        label: "Category",
                        leading: Icons.category,
                        color: Colors.green),
                    TabBarItem(2,
                        label: "Settings",
                        leading: Icons.settings,
                        color: Colors.blue),
                    TabBarItem(3, label: "Profile", leading: Icons.person),
                  ],
                  onSelectChanged: (index){

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingButton({IconData icon, String label}) {
    return WButton(
      loading: CircularProgressIndicator(),
      icon: icon,
      label: label,
      onPressed: () async {
        await Future.delayed(Duration(seconds: 2));
        print("Tap");
      },
    );
  }

  Widget _buildButton() {
    return WButton(
      icon: Icons.add,
      label: "Add",
      textAllCaps: true,
      onPressed: () async {
        print("Tap");
      },
    );
  }
}

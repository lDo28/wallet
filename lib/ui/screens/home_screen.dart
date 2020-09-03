import 'package:flutter/material.dart';
import 'package:wallet/ui/widgets/w_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
                SizedBox(height: 50),
                Text("Without loading"),
                _buildButton(),
                SizedBox(height: 50),
                Text("With loading"),
                _buildLoadingButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingButton() {
    return WButton(
      vsync: this,
      loading: CircularProgressIndicator(),
      icon: Icons.add,
      label: "Add",
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

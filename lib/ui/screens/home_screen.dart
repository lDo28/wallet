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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              Center(
                child: _buildButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return WButton(
      // vsync: this,
      // loading: CircularProgressIndicator(),
      icon: Icons.add,
      label: "ABC",
      onPressed: () async {
        await Future.delayed(Duration(seconds: 2));
        print("Tap");
      },
    );
  }
}

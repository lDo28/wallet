import 'package:flutter/material.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/constants/exts/exts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text(
                Constants.appName,
                style: TextStyle().bold.splashLogoFontSize,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

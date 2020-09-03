import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WFlushBar extends StatefulWidget {
  WFlushBar({Key key}) : super(key: key);

  @override
  _WFlushBarState createState() => _WFlushBarState();

  static show() {
    Get.dialog(Container(
      height: 100,
      width: MediaQuery.of(Get.key.currentContext).size.width,
      color: Colors.red,
    ));
  }
}

class _WFlushBarState extends State<WFlushBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

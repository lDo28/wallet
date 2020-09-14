import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/ui/vo/tab_bar_item.dart';

class HomeController extends GetxController {
  final tabs = [
    TabBarItem(0, label: 'Home', leading: Icons.home),
    TabBarItem(
      1,
      label: 'Category',
      leading: Icons.category,
      color: Colors.green,
    ),
    TabBarItem(
      2,
      label: 'User',
      leading: Icons.person,
      color: Colors.red,
    ),
  ];
}

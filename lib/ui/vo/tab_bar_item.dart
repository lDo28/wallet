import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarItem {
  final int index;
  final String label;
  final IconData leading;
  final Color color;

  TabBarItem(this.index,
      {this.label, this.leading, this.color = Colors.deepPurple});
}

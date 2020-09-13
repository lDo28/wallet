import 'package:flutter/material.dart';
import 'package:wallet/constants/exts/exts.dart';

class WActionChip extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor, foregroundColor;

  const WActionChip({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(title),
      shape: StadiumBorder(side: BorderSide(color: foregroundColor, width: 2)),
      labelStyle: TextStyle(color: foregroundColor).bold,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
    );
  }
}

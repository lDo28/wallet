import 'package:flutter/material.dart';

class WAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final PreferredSizeWidget bottom;

  const WAppBar({
    Key key,
    this.title = "",
    this.centerTitle = true,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (this.bottom?.preferredSize?.height ?? 0.0));
}

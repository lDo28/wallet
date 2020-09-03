import 'package:flutter/material.dart';

class WSliverAppBar extends StatefulWidget {
  @override
  _WSliverAppBarState createState() => _WSliverAppBarState();
}

class _WSliverAppBarState extends State<WSliverAppBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      primary: true,
      floating: true,
      snap: true,
      pinned: true,
      bottom: TabBar(
          controller: _tabController,
          tabs: [1, 2, 3].map((e) => Tab(text: e.toString())).toList()),
      flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
        fit: BoxFit.cover,
      )),
    );
  }
}

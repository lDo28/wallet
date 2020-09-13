import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/ui/screens/home/home_controller.dart';
import 'package:wallet/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        title: 'Wallet',
      ),
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => WHomeCard(
              title: '$index',
              subtitle: '$index subtitle',
              onCardPress: () {},
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}

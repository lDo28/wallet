import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/ui/screens/home/home_controller.dart';
import 'package:wallet/ui/screens/home/w_home_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => WHomeCard(
        title: "$index",
        subtitle: '',
        onCardPress: () {},
      ),
      itemCount: 3,
    );
  }
}

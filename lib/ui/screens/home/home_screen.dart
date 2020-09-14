import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/ui/screens/home/home_controller.dart';
import 'package:wallet/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final HomeController _controller = Get.put(HomeController());
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: WTabBar(
        paddingTop: MediaQuery.of(context).padding.top,
        items: _controller.tabs,
        onSelectChanged: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        },
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _controller.tabs.length,
          itemBuilder: (context, index) => Text(_controller.tabs[index].label),
        ).paddingOnly(top: Dimens.largePadding),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

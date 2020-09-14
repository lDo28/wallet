import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/ui/screens/category/category_screen.dart';
import 'package:wallet/ui/screens/home/home_screen.dart';
import 'package:wallet/ui/screens/main/main_controller.dart';
import 'package:wallet/ui/screens/person/person_screen.dart';
import 'package:wallet/ui/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  final MainController _controller = Get.put(MainController());
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
            curve: Curves.easeInOut,
          );
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            HomeScreen(),
            CategoryScreen(),
            PersonScreen(),
          ],
        ).paddingOnly(top: Dimens.largePadding),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

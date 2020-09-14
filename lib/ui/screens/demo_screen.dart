import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/ui/screens/home/w_home_card.dart';
import 'package:wallet/ui/vo/tab_bar_item.dart';
import 'package:wallet/ui/widgets/w_pie_chart.dart';
import 'package:wallet/ui/widgets/widgets.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> with TickerProviderStateMixin {
  var tags = ['Design', 'Home', 'Work', 'Phone', 'New'];
  var selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildItem(
                  label: 'Button',
                  item: WButton(
                    icon: Icons.add,
                    label: 'Add',
                    textAllCaps: true,
                    onPressed: () async {
                      print("Tap");
                    },
                  ),
                ),
                _buildItem(
                  label: 'Button color',
                  item: WButton(
                    icon: Icons.add,
                    label: 'Add',
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textAllCaps: true,
                    onPressed: () async {
                      print("Tap");
                    },
                  ),
                ),
                _buildItem(
                  label: 'Button with loading animation',
                  item: WButton(
                    loading: CircularProgressIndicator(),
                    icon: Icons.add,
                    label: 'Add',
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 2));
                      print("Tap");
                    },
                  ),
                ),
                _buildItem(
                  label: 'Button with loading animation, color',
                  item: WButton(
                    loading: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.add,
                    label: 'Add',
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 2));
                      print("Tap");
                    },
                  ),
                ),
                _buildItem(
                  label: 'Icon button',
                  item: WButton(
                    icon: Icons.add,
                    onPressed: () async {
                      print("Tap");
                    },
                  ),
                ),
                _buildItem(
                  label: 'Tab bar',
                  item: WTabBar(
                    items: [
                      TabBarItem(0,
                          label: "Home",
                          leading: Icons.home,
                          color: Colors.red),
                      TabBarItem(1,
                          label: "Category",
                          leading: Icons.category,
                          color: Colors.green),
                      TabBarItem(2,
                          label: "Settings",
                          leading: Icons.settings,
                          color: Colors.blue),
                      TabBarItem(3, label: "Profile", leading: Icons.person),
                    ],
                    onSelectChanged: (index) {},
                  ),
                ),
                _buildItem(
                  label: 'Home card',
                  item: WHomeCard(
                    title: 'Title: Home Card',
                    subtitle: 'Subtitle: ... task(s)/item(s)',
                    onCardPress: () {},
                  ),
                ),
                _buildItem(
                  label: 'Editable home card',
                  item: WHomeCard(
                    title: 'Title: Editable Home card',
                    subtitle: 'Subtitle: ... task(s)/item(s)',
                    highlightColor: Colors.red,
                    onCardPress: () {},
                    onEditPress: () {},
                  ),
                ),
                _buildItem(
                  label: 'Tag',
                  item: WTagCard(
                    children: [
                      for (var tag in tags)
                        WFilterChip(
                          title: tag,
                          isSelected: selectedTags.contains(tag),
                          onSelectChanged: (title, selected) {
                            setState(() {
                              if (selected) {
                                selectedTags.add(title);
                              } else {
                                selectedTags.remove(title);
                              }
                            });
                          },
                        ),
                      WFilterChip(
                        title: 'Color chip',
                        isSelected: selectedTags.contains('Color chip'),
                        unselectedBackground: Colors.red.withOpacity(.2),
                        unselectedForeground: Colors.red,
                        selectedBackground: Colors.red,
                        selectedForeground: Colors.white,
                        onSelectChanged: (title, selected) {
                          setState(() {
                            if (selected) {
                              selectedTags.add(title);
                            } else {
                              selectedTags.remove(title);
                            }
                          });
                        },
                      ),
                      WActionChip(
                        title: 'Add new tag',
                        onPressed: () {
                          setState(() {
                            tags.add(Random().nextInt(100).toString());
                          });
                        },
                      ),
                      WActionChip(
                        title: 'Color action',
                        foregroundColor: Colors.red,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                _buildItem(
                  label: 'PieChart',
                  item: WPieChart(
                    currentProgress: 95,
                    size: 70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem({@required String label, @required Widget item}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Dimens.largerHeightSpace,
        Text(label),
        item,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wallet/ui/vo/tab_bar_item.dart';

class WTabBar extends StatefulWidget {
  final Color backgroundColor;
  final List<TabBarItem> items;
  final Function(int selectIndex) onSelectChanged;

  WTabBar({
    Key key,
    this.backgroundColor = Colors.white,
    @required this.items,
    this.onSelectChanged,
  }) : super(key: key);

  @override
  _WTabBarState createState() => _WTabBarState();
}

class _WTabBarState extends State<WTabBar> {
  int _selectIndex = 0;

  _updateSelect(int index) {
    if (_selectIndex == index) return;
    setState(() {
      _selectIndex = index;
    });
    widget.onSelectChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      height: kToolbarHeight,
      child: Row(
        children: widget.items.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Widget _buildItem(TabBarItem item) {
    return GestureDetector(
      child: _TabBarView(
        item: item,
        selected: item.index == _selectIndex,
      ),
      onTap: () {
        _updateSelect(item.index);
      },
    );
  }
}

class _TabBarView extends StatefulWidget {
  final bool selected;
  final TabBarItem item;

  const _TabBarView({Key key, this.selected, this.item}) : super(key: key);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<_TabBarView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 300),
      child: Container(
        width: widget.selected
            ? MediaQuery.of(context).size.width - (kToolbarHeight * 3)
            : kToolbarHeight,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              Icon(widget.item.leading, color: widget.item.color),
              Visibility(
                visible: widget.selected,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 16),
                    Text(
                      widget.item.label.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.item.color,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

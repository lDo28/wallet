import 'package:flutter/material.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/constants/exts/exts.dart';
import 'package:wallet/ui/vo/tab_bar_item.dart';

class WTabBar extends StatefulWidget {
  final Color backgroundColor;
  final List<TabBarItem> items;
  final Function(int selectIndex) onSelectChanged;

  WTabBar({
    Key key,
    this.backgroundColor = WColors.backgroundColor,
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
        length: widget.items.length,
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
  final int length;

  const _TabBarView({Key key, this.selected, this.item, this.length})
      : super(key: key);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<_TabBarView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Constants.duration,
      child: Container(
        width: widget.selected
            ? MediaQuery.of(context).size.width -
                (kToolbarHeight * (widget.length - 1))
            : kToolbarHeight,
        child: SingleChildScrollView(
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
                    Dimens.defaultWidthSpace,
                    Text(
                      widget.item.label.toUpperCase(),
                      style:
                          TextStyle(color: widget.item.color).bold.tabFontSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).defaultPaddingAll,
      ),
    );
  }
}

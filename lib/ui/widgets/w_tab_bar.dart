import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/constants/exts/exts.dart';
import 'package:wallet/ui/vo/tab_bar_item.dart';
import 'package:wallet/ui/widgets/controllers/w_tab_bar_controller.dart';

class WTabBar extends StatelessWidget with PreferredSizeWidget {
  final Color backgroundColor;
  final List<TabBarItem> items;
  final Function(int selectIndex) onSelectChanged;
  final double paddingTop;
  final WTabBarController _controller = Get.put(WTabBarController());

  WTabBar({
    Key key,
    this.backgroundColor = Colors.white,
    @required this.items,
    this.onSelectChanged,
    this.paddingTop = 0,
  }) : super(key: key);

  _updateSelect(int index) {
    _controller.updateIndex(index);
    if (onSelectChanged != null) {
      onSelectChanged(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: kToolbarHeight + paddingTop,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _buildItem(items[index]),
        itemCount: items.length,
      ),
    ).paddingOnly(top: paddingTop);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget _buildItem(TabBarItem item) {
    return Obx(
      () => GestureDetector(
        child: _TabBarView(
          item: item,
          selected: item.index == _controller.selectIndex.value,
          length: items.length,
        ),
        onTap: () {
          _updateSelect(item.index);
        },
      ),
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
        ).paddingAll(Dimens.largePadding),
      ),
    );
  }
}

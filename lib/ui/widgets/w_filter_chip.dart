import 'package:flutter/material.dart';
import 'package:wallet/constants/colors.dart';

class WFilterChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(String selectedTitle, bool selected) onSelectChanged;
  final Color unselectedBackground,
      selectedBackground,
      unselectedForeground,
      selectedForeground;

  const WFilterChip({
    Key key,
    @required this.title,
    @required this.isSelected,
    @required this.onSelectChanged,
    this.unselectedBackground = WColors.tagUnselectedColor,
    this.selectedBackground = WColors.tagSelectedColor,
    this.unselectedForeground = WColors.tagSelectedColor,
    this.selectedForeground = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isSelected,
      showCheckmark: false,
      label: Text(title),
      selectedColor: selectedBackground,
      backgroundColor: unselectedBackground,
      labelStyle: TextStyle(
        color: isSelected ? selectedForeground : unselectedForeground,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      onSelected: (selected) {
        onSelectChanged(title, selected);
      },
    );
  }
}

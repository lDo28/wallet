import 'package:flutter/material.dart';
import 'package:wallet/constants/colors.dart';
import 'package:wallet/ui/widgets/pie_chart_painter.dart';

class WPieChart extends StatelessWidget {
  final double currentProgress;
  final Color color;
  final double size, outlineWidth;

  const WPieChart({
    Key key,
    @required this.currentProgress,
    this.color = WColors.primaryColor,
    this.size = 50.0,
    double outlineWidth,
  })  : this.outlineWidth = outlineWidth ?? size / 20,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PieChartPainter(
        currentProgress: currentProgress,
        color: color,
        outlineWidth: outlineWidth,
      ),
      child: SizedBox(width: size, height: size),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wallet/constants/constants.dart';
import 'package:wallet/constants/exts/exts.dart';
import 'package:wallet/ui/widgets/tag_clipper.dart';

class WTagCard extends StatefulWidget {
  final List<Widget> children;
  final double spacing;

  WTagCard({
    Key key,
    @required this.children,
    this.spacing = Dimens.smallPadding,
  }) : super(key: key);

  @override
  _WTagCardState createState() => _WTagCardState();
}

class _WTagCardState extends State<WTagCard> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TagClipper(radius: 25, startX: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_offer,
              color: Colors.blue,
            ),
            Dimens.defaultHeightSpace,
            Wrap(children: widget.children, spacing: widget.spacing),
          ],
        ).paddingAll(Dimens.largePadding),
      ),
    ).paddingSymmetric(horizontal: Dimens.largePadding);
  }
}

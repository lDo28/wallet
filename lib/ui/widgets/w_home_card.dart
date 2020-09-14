import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/constants/constants.dart';

class WHomeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color highlightColor;
  final VoidCallback onCardPress, onEditPress;

  const WHomeCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    this.highlightColor = WColors.primaryColor,
    this.onCardPress,
    this.onEditPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: EdgeInsets.zero,
      child: RaisedButton(
        elevation: 0,
        onPressed: onCardPress,
        shape: RoundedRectangleBorder(borderRadius: Dimens.borderRadius),
        color: WColors.backgroundColor,
        disabledColor: WColors.disableColor,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: Dimens.defaultPadding,
                decoration: BoxDecoration(
                  color: highlightColor,
                  borderRadius: Dimens.borderRadius,
                ),
              ),
              Dimens.defaultWidthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.headline6),
                    Dimens.smallHeightSpace,
                    Text(subtitle, style: TextStyle(color: Colors.grey)),
                  ],
                ).paddingSymmetric(vertical: Dimens.largePadding),
              ),
              if (onEditPress != null)
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: onEditPress,
                ),
            ],
          ),
        ).paddingSymmetric(
          horizontal: Dimens.largePadding,
          vertical: Dimens.defaultPadding,
        ),
      ),
    ).paddingSymmetric(horizontal: Dimens.largePadding);
  }
}

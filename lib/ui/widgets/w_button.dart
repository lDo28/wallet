import 'package:flutter/material.dart';
import 'package:wallet/constants/button_type.dart';

class WButton extends StatelessWidget {
  final ButtonType type;
  final IconData icon;
  final String label;
  final Color backgroundColor, foregroundColor, disabledColor;
  final double elevation;
  final VoidCallback onPressed;

  const WButton(
      {Key key,
      this.type = ButtonType.raise,
      this.icon,
      this.label,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.deepPurple,
      this.disabledColor = Colors.black54,
      this.elevation = 0,
      this.onPressed})
      : assert(icon != null || label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (label?.isNotEmpty == true && icon != null) {
      return _buildIconLabelButton();
    }
    if (icon != null) {
      return _buildIconButton();
    }
    return _buildLabelButton();
  }

  Widget _buildLabelButton() {
    switch (type) {
      case ButtonType.raise:
        return RaisedButton(
          child: Text(label),
          color: backgroundColor,
          textColor: foregroundColor,
          disabledColor: disabledColor.withOpacity(.2),
          disabledTextColor: disabledColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
        );
      case ButtonType.outline:
        return OutlineButton(
          child: Text(label),
          color: backgroundColor,
          textColor: foregroundColor,
          disabledBorderColor: disabledColor.withOpacity(.2),
          disabledTextColor: disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
        );
      default:
        return FlatButton(
          child: Text(label),
          color: backgroundColor,
          textColor: foregroundColor,
          disabledColor: disabledColor.withOpacity(.2),
          disabledTextColor: disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
        );
    }
  }

  Widget _buildIconLabelButton() {
    switch (type) {
      case ButtonType.raise:
        return RaisedButton.icon(
          icon: Icon(icon, color: _iconColor),
          label: Text(label),
          color: backgroundColor,
          textColor: foregroundColor,
          disabledColor: disabledColor.withOpacity(.2),
          disabledTextColor: disabledColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
        );
      case ButtonType.outline:
        return OutlineButton.icon(
          icon: Icon(icon, color: _iconColor),
          label: Text(label),
          color: backgroundColor,
          disabledBorderColor: disabledColor.withOpacity(.2),
          disabledTextColor: disabledColor,
          textColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
        );
      default:
        return FlatButton.icon(
          icon: Icon(icon, color: _iconColor),
          label: Text(label),
          color: backgroundColor,
          textColor: foregroundColor,
          disabledColor: disabledColor.withOpacity(.2),
          disabledTextColor: disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
        );
    }
  }

  Widget _buildIconButton() {
    return ButtonTheme(
      minWidth: 36,
      padding: EdgeInsets.zero,
      child: RaisedButton(
        color: backgroundColor,
        disabledColor: disabledColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: onPressed,
        child: Icon(icon, color: _iconColor),
      ),
    );
  }

  Color get _iconColor => onPressed == null ? disabledColor : foregroundColor;
}

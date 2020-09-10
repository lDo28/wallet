import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet/constants/button_type.dart';

class WButton extends StatefulWidget {
  final ButtonType type;
  final IconData icon;
  final String label;
  final Color backgroundColor, foregroundColor, disabledColor;
  final double elevation;
  final AsyncCallback onPressed;
  final int animationDuration;
  final Curve curve;
  final ProgressIndicator loading;
  final bool textAllCaps;

  const WButton(
      {Key key,
      this.type = ButtonType.raise,
      this.icon,
      this.label,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.deepPurple,
      this.disabledColor = Colors.black54,
      this.elevation = 0,
      this.onPressed,
      this.animationDuration = 500,
      this.curve = Curves.easeIn,
      this.loading,
      this.textAllCaps = false})
      : assert(icon != null || label != null),
        super(key: key);

  @override
  _WButtonState createState() => _WButtonState();
}

class _WButtonState extends State<WButton> with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.loading == null) _buildButtonTheme();
    return Container(
      decoration: BoxDecoration(
        color: _isLoading && !_isOutline
            ? widget.backgroundColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(_isLoading ? 50 : 8),
      ),
      child: AnimatedSize(
        vsync: this,
        curve: widget.curve,
        duration: Duration(milliseconds: widget.animationDuration),
        child: _buildButtonTheme(),
      ),
    );
  }

  Widget _buildButtonTheme() {
    return ButtonTheme(
      padding: widget.label == null
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minWidth: widget.label == null ? 36 : 88,
      child: _buildButton(),
    );
  }

  Widget _buildButton() {
    if (_isLoading && widget.loading != null)
      return SizedBox(
        height: 48,
        width: 48,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: widget.loading,
        ),
      );
    if (widget.label != null && widget.icon != null)
      return _buildIconLabelButton();
    if (widget.icon != null) return _buildIconButton();
    return _buildLabelButton();
  }

  Widget _buildLabelButton() {
    switch (widget.type) {
      case ButtonType.raise:
        return RaisedButton(
          child: Text(_label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          elevation: widget.elevation,
          onPressed: _onPress,
        );
      case ButtonType.outline:
        return OutlineButton(
          child: Text(_label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledBorderColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          onPressed: _onPress,
        );
      default:
        return FlatButton(
          child: Text(_label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          onPressed: _onPress,
        );
    }
  }

  Widget _buildIconLabelButton() {
    switch (widget.type) {
      case ButtonType.raise:
        return RaisedButton.icon(
          icon: Icon(widget.icon, color: _iconColor),
          label: Text(_label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          elevation: widget.elevation,
          onPressed: _onPress,
        );
      case ButtonType.outline:
        return OutlineButton.icon(
          icon: Icon(widget.icon, color: _iconColor),
          label: Text(_label),
          color: widget.backgroundColor,
          disabledBorderColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          textColor: widget.foregroundColor,
          onPressed: _onPress,
        );
      default:
        return FlatButton.icon(
          icon: Icon(widget.icon, color: _iconColor),
          label: Text(_label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          onPressed: _onPress,
        );
    }
  }

  Widget _buildIconButton() {
    switch (widget.type) {
      case ButtonType.raise:
        return RaisedButton(
          color: widget.backgroundColor,
          disabledColor: widget.disabledColor,
          elevation: widget.elevation,
          onPressed: _onPress,
          child: Icon(widget.icon, color: _iconColor),
        );
      case ButtonType.outline:
        return OutlineButton(
          color: widget.backgroundColor,
          disabledBorderColor: widget.disabledColor.withOpacity(.2),
          onPressed: _onPress,
          child: Icon(widget.icon, color: _iconColor),
        );
      default:
        return FlatButton(
          color: widget.backgroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          onPressed: _onPress,
          child: Icon(widget.icon, color: _iconColor),
        );
    }
  }

  Color get _iconColor =>
      widget.onPressed == null ? widget.disabledColor : widget.foregroundColor;

  bool get _isOutline => widget.type == ButtonType.outline;

  String get _label =>
      widget.textAllCaps ? widget.label.toUpperCase() : widget.label;

  _onPress() async {
    _toggleLoading();
    await widget.onPressed();
    _toggleLoading();
  }

  _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }
}

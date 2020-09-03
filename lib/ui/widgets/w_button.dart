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
  final TickerProvider vsync;
  final int animationDuration;
  final Curve curve;
  final ProgressIndicator loading;

  const WButton({
    Key key,
    this.type = ButtonType.raise,
    this.icon,
    this.label = "",
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.deepPurple,
    this.disabledColor = Colors.black54,
    this.elevation = 0,
    this.onPressed,
    this.vsync,
    this.animationDuration = 500,
    this.curve = Curves.easeIn,
    this.loading,
  })  : assert(icon != null || label != null),
        assert(loading == null || (loading != null && vsync != null)),
        super(key: key);

  @override
  _WButtonState createState() => _WButtonState();
}

class _WButtonState extends State<WButton> {
  bool _isLoading = false;
  final ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    if (widget.loading == null) {
      return _buildButton();
    }
    return Container(
      decoration: BoxDecoration(
        color: _isLoading ? widget.backgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(_isLoading ? 50 : 8),
      ),
      child: AnimatedSize(
        vsync: widget.vsync,
        curve: widget.curve,
        duration: Duration(milliseconds: widget.animationDuration),
        child: ButtonTheme(
          minWidth: widget.label == null ? 36 : 88,
          child: _buildButton(),
        ),
      ),
    );
  }

  Widget _buildButton() {
    if (_isLoading && widget.loading != null)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.loading,
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
          child: Text(widget.label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          elevation: widget.elevation,
          shape: shape,
          onPressed: _onPress,
        );
      case ButtonType.outline:
        return OutlineButton(
          child: Text(widget.label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledBorderColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          shape: shape,
          onPressed: _onPress,
        );
      default:
        return FlatButton(
          child: Text(widget.label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          shape: shape,
          onPressed: _onPress,
        );
    }
  }

  Widget _buildIconLabelButton() {
    switch (widget.type) {
      case ButtonType.raise:
        return RaisedButton.icon(
          icon: Icon(widget.icon, color: _iconColor),
          label: Text(widget.label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          elevation: widget.elevation,
          shape: shape,
          onPressed: _onPress,
        );
      case ButtonType.outline:
        return OutlineButton.icon(
          icon: Icon(widget.icon, color: _iconColor),
          label: Text(widget.label),
          color: widget.backgroundColor,
          disabledBorderColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          textColor: widget.foregroundColor,
          shape: shape,
          onPressed: _onPress,
        );
      default:
        return FlatButton.icon(
          icon: Icon(widget.icon, color: _iconColor),
          label: Text(widget.label),
          color: widget.backgroundColor,
          textColor: widget.foregroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          disabledTextColor: widget.disabledColor,
          shape: shape,
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
          shape: shape,
          onPressed: _onPress,
          child: Icon(widget.icon, color: _iconColor),
        );
      case ButtonType.outline:
        return OutlineButton(
          color: widget.backgroundColor,
          disabledBorderColor: widget.disabledColor.withOpacity(.2),
          shape: shape,
          onPressed: _onPress,
          child: Icon(widget.icon, color: _iconColor),
        );
      default:
        return FlatButton(
          color: widget.backgroundColor,
          disabledColor: widget.disabledColor.withOpacity(.2),
          shape: shape,
          onPressed: _onPress,
          child: Icon(widget.icon, color: _iconColor),
        );
    }
  }

  Color get _iconColor =>
      widget.onPressed == null ? widget.disabledColor : widget.foregroundColor;

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

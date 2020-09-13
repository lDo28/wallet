import 'package:flutter/material.dart';

extension TextExts on TextStyle {
  TextStyle get bold => this.copyWith(fontWeight: FontWeight.bold);

  TextStyle get semiBold => this.copyWith(fontWeight: FontWeight.w500);

  TextStyle get smallFontSize => this.copyWith(fontSize: 12);

  TextStyle get largeFontSize => this.copyWith(fontSize: 16);

  TextStyle get tabFontSize => this.copyWith(fontSize: 18);
}

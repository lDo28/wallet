import 'package:flutter/material.dart';
import 'package:wallet/constants/dimens.dart';

extension PaddingExts on Widget {
  Widget get defaultPaddingAll {
    return Padding(
      padding: EdgeInsets.all(Dimens.defaultPadding),
      child: this,
    );
  }

  Widget get defaultPaddingHorizontal {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.defaultPadding),
      child: this,
    );
  }

  Widget get defaultPaddingVertical {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.defaultPadding),
      child: this,
    );
  }

  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }
}

import 'package:flutter/material.dart';

class TagClipper extends CustomClipper<Path> {
  final double radius;
  final double startX;

  TagClipper({@required this.radius, @required this.startX});

  @override
  Path getClip(Size size) {
    return _startPath(size);
  }

  Path _startPath(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(startX, 0)
      ..arcToPoint(Offset(startX + radius, radius / 2),
          radius: Radius.circular(radius))
      ..arcToPoint(Offset(startX + radius * 2, radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width - radius, radius)
      ..arcToPoint(Offset(size.width, radius * 2),
          radius: Radius.circular(radius))
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
  }

  Path _midPath(Size size) {
    //TODO: update code
    return Path()
      ..moveTo(0, 0)
      ..lineTo(startX, 0)
      ..arcToPoint(Offset(startX + radius, radius / 2),
          radius: Radius.circular(radius))
      ..arcToPoint(Offset(startX + radius * 2, radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width - radius, radius)
      ..arcToPoint(Offset(size.width, radius * 2),
          radius: Radius.circular(radius))
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
  }

  Path _endPath(Size size) {
    //TODO: update code
    return Path()
      ..moveTo(0, 0)
      ..lineTo(startX, 0)
      ..arcToPoint(Offset(startX + radius, radius / 2),
          radius: Radius.circular(radius))
      ..arcToPoint(Offset(startX + radius * 2, radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width - radius, radius)
      ..arcToPoint(Offset(size.width, radius * 2),
          radius: Radius.circular(radius))
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => this != oldClipper;
}

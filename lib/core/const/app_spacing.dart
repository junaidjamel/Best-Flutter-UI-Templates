import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  static const double page = 20;
  static const double radiusMedium = 12;

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: page);
  static const EdgeInsets leftPadding = EdgeInsets.only(left: page);
  static const EdgeInsets rightPadding = EdgeInsets.only(right: page);
}

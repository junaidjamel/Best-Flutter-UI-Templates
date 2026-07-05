import 'package:flutter/material.dart';

abstract final class EventCalenderColors {
  static const background = Color(0xFF121210);
  static const backgroundWarm = Color(0xFF2A1C17);
  static const surface = Color(0xFF1D1D1A);
  static const surfaceLight = Color(0xFF292925);
  static const white = Color(0xFFF8F8F3);
  static const muted = Color(0xFFAAA99F);
  static const divider = Color(0xFF373630);
  static const accent = Color(0xFFD5F05A);
  static const orange = Color(0xFFFF5429);
  static const pink = Color(0xFFFF3DA7);

  static const backgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [backgroundWarm, background, background],
    stops: [0, .34, 1],
  );
}

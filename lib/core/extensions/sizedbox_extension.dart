import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetSpacing on int {
  SizedBox get hSpace {
    assert(this >= 0);
    return SizedBox(width: w);
  }

  SizedBox get vSpace {
    assert(this >= 0);
    return SizedBox(height: h);
  }
}

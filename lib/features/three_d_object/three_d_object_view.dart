import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/three_d_object/widgets/category_filter_list.dart';
import 'package:flutter_ui/features/three_d_object/widgets/explore_header.dart';
import 'package:flutter_ui/features/three_d_object/widgets/object_list.dart';

class ThreeDObjectView extends StatelessWidget {
  const ThreeDObjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1C1C1E), Color(0xFF161618), Color(0xFF111113)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Scaffold(
        appBar: const ExploreHeader(),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            const CategoryFilterList(),
            const ObjectList(),
          ],
        ),
      ),
    );
  }
}

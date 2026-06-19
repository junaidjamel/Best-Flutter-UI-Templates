import 'package:flutter/material.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
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
          colors: [Color(0xff3E3E3E), Color(0xFF161618), Color(0xFF111113)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Scaffold(
        appBar: const ExploreHeader(),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.vSpace,
            const CategoryFilterList(),
            20.vSpace,
            const ObjectList(),
          ],
        ),
      ),
    );
  }
}

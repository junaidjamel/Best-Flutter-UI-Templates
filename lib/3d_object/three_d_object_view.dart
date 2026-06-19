import 'package:flutter/material.dart';
import 'package:flutter_ui/3d_object/widget/header_widget.dart';

class ThreeDObjectView extends StatelessWidget {
  const ThreeDObjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1C1C1E), // dark gray-black (top)
            Color(0xFF161618), // slightly deeper (mid)
            Color(0xFF111113), // near-black (bottom)
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Scaffold(
        appBar: const ExploreHeader(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

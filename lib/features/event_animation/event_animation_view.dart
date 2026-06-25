import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';

class EventAnimationView extends StatelessWidget {
  const EventAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EventAnimationColors.whiteClr,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AnimatedContainer(
              height: 300.h,
              duration: const Duration(milliseconds: 300),
              color: EventAnimationColors.blackClr,
            ),
          ],
        ),
      ),
    );
  }
}

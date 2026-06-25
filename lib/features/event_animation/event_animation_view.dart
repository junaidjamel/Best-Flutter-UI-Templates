import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';
import 'package:flutter_ui/features/event_animation/widget/event_art_tile.dart';
import 'package:flutter_ui/features/event_animation/widget/event_bottom_nav.dart';
import 'package:flutter_ui/features/event_animation/widget/event_summary_card.dart';

class EventAnimationView extends StatefulWidget {
  const EventAnimationView({super.key});

  @override
  State<EventAnimationView> createState() => _EventAnimationViewState();
}

class _EventAnimationViewState extends State<EventAnimationView> {
  bool isExpanded = false;

  Widget itemBuilder(BuildContext context, int index) {
    final items = [
      EventArtTile(
        month: "Mar",
        day: "22",
        title: "1-1 Advisory call",
        status: "Incomplete",
        imageUrl:
            "https://i.pinimg.com/736x/46/3f/4a/463f4a60723d27fc22603cb60f022850.jpg",
        isLocked: true,
      ),
      EventArtTile(
        month: "Mar",
        day: "22",
        title: "1-1 Advisory call",
        status: "Incomplete",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
        isLocked: true,
      ),
      EventArtTile(
        month: "Mar",
        day: "22",
        title: "1-1 Advisory call",
        status: "Incomplete",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
        isLocked: true,
      ),
      EventArtTile(
        month: "Mar",
        day: "22",
        title: "1-1 Advisory call",
        status: "Incomplete",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
        isLocked: true,
      ),
      EventArtTile(
        month: "Mar",
        day: "22",
        title: "1-1 Advisory call",
        status: "Incomplete",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
        isLocked: true,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: items[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EventAnimationColors.whiteClr,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                margin: pagePadding,
                height: isExpanded ? 300.h : 70.h,
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeOutCubic,
                decoration: BoxDecoration(
                  color: EventAnimationColors.blackClr,
                  borderRadius: BorderRadius.circular(isExpanded ? 16.r : 24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isExpanded ? 16.r : 24.r),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: isExpanded
                        ? const EventSummaryCard(key: ValueKey("summary"))
                        : const _CollapsedEventCard(key: ValueKey("collapsed")),
                  ),
                ),
              ),
            ),
            30.vSpace,
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                itemCount: 5,
                itemBuilder: itemBuilder,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const EventBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _CollapsedEventCard extends StatelessWidget {
  const _CollapsedEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.view_week_rounded,
              size: 22.sp,
              color: Colors.black,
            ),
          ),
          14.hSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upcoming  ·  Mar 12",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.45),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                3.vSpace,
                Text(
                  "Custom panel",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

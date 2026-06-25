import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';
import 'package:flutter_ui/features/event_animation/widget/event_art_tile.dart';
import 'package:flutter_ui/features/event_animation/widget/event_bottom_nav.dart';
import 'package:flutter_ui/features/event_animation/widget/event_collapse_card.dart';
import 'package:flutter_ui/features/event_animation/widget/event_summary_card.dart';

class EventAnimationView extends StatefulWidget {
  const EventAnimationView({super.key});

  @override
  State<EventAnimationView> createState() => _EventAnimationViewState();
}

class _EventAnimationViewState extends State<EventAnimationView> {
  bool isExpanded = false;
  bool _showExpanded = false; // ← drives AnimatedSwitcher separately

  static const _panelAnimationDuration = Duration(milliseconds: 420);
  static const _contentAnimationDuration = Duration(milliseconds: 210);
  static const _contentDelay = Duration(milliseconds: 80);

  void _toggle() {
    if (!isExpanded) {
      setState(() => isExpanded = true);
      Future.delayed(_contentDelay, () {
        if (mounted) setState(() => _showExpanded = true);
      });
    } else {
      setState(() => _showExpanded = false);
      Future.delayed(_contentDelay, () {
        if (mounted) setState(() => isExpanded = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final expandedHeight = (screenHeight * .34).clamp(270.h, 318.h).toDouble();

    return Scaffold(
      backgroundColor: EventAnimationColors.whiteClr,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: page.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggle,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: isExpanded ? 76.h : expandedHeight,
                    end: isExpanded ? expandedHeight : 76.h,
                  ),
                  duration: _panelAnimationDuration,
                  curve: Curves.easeInOutCubic,
                  builder: (context, height, _) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween(
                        begin: isExpanded ? 26.r : 18.r,
                        end: isExpanded ? 18.r : 26.r,
                      ),
                      duration: _panelAnimationDuration,
                      curve: Curves.easeInOutCubic,
                      builder: (context, radius, _) {
                        return Container(
                          width: double.infinity,
                          height: height,
                          decoration: BoxDecoration(
                            color: EventAnimationColors.blackClr,
                            borderRadius: BorderRadius.circular(radius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .16),
                                blurRadius: isExpanded ? 32.r : 22.r,
                                offset: Offset(0, isExpanded ? 16.h : 10.h),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: AnimatedSwitcher(
                            duration: _contentAnimationDuration,
                            reverseDuration: _contentAnimationDuration,
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            layoutBuilder: (currentChild, previousChildren) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [...previousChildren, ?currentChild],
                              );
                            },
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: _showExpanded
                                ? const EventSummaryCard(
                                    key: ValueKey("summary"),
                                  )
                                : const CollapsedEventCard(
                                    key: ValueKey("collapsed"),
                                  ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            24.vSpace,
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(page.w, 0, page.w, 96.h),
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

  Widget itemBuilder(BuildContext context, int index) {
    final items = [
      EventArtTile(
        month: "Mar",
        day: "22",
        title: "Brand strategy review",
        status: "Incomplete",
        imageUrl:
            "https://i.pinimg.com/736x/46/3f/4a/463f4a60723d27fc22603cb60f022850.jpg",
        isLocked: true,
      ),
      EventArtTile(
        month: "Mar",
        day: "24",
        title: "Founder working session",
        status: "Confirmed",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
        isComplete: true,
      ),
      EventArtTile(
        month: "Mar",
        day: "26",
        title: "Product direction sync",
        status: "Incomplete",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
        isLocked: true,
      ),
      EventArtTile(
        month: "Apr",
        day: "02",
        title: "Creative critique",
        status: "Open",
        imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
      ),
      EventArtTile(
        month: "Apr",
        day: "07",
        title: "Launch prep checklist",
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
}

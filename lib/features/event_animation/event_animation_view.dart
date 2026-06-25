import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';
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
  static const _panelAnimationDuration = Duration(milliseconds: 420);
  static const _contentAnimationDuration = Duration(milliseconds: 210);
  static const _contentDelay = Duration(milliseconds: 80);

  bool _isExpanded = false;
  bool _showSummary = false;

  void _toggle() {
    if (!_isExpanded) {
      setState(() => _isExpanded = true);
      Future.delayed(_contentDelay, () {
        if (mounted) setState(() => _showSummary = true);
      });
    } else {
      setState(() => _showSummary = false);
      Future.delayed(_contentDelay, () {
        if (mounted) setState(() => _isExpanded = false);
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
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: page.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggle,
                child: AnimatedContainer(
                  width: double.infinity,
                  height: _isExpanded ? expandedHeight : 76.h,
                  duration: _panelAnimationDuration,
                  curve: Curves.easeInOutCubic,
                  decoration: BoxDecoration(
                    color: EventAnimationColors.blackClr,
                    borderRadius: BorderRadius.circular(
                      _isExpanded ? 18.r : 26.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .16),
                        blurRadius: _isExpanded ? 32.r : 22.r,
                        offset: Offset(0, _isExpanded ? 16.h : 10.h),
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
                    child: _showSummary
                        ? const EventSummaryCard(key: ValueKey('summary'))
                        : const CollapsedEventCard(key: ValueKey('collapsed')),
                  ),
                ),
              ),
            ),
            24.vSpace,
            Padding(
              padding: leftPadding,
              child: Text('Custom Planner', style: AppTypography.displayMedium),
            ),
            24.vSpace,
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(page.w, 0, page.w, 96.h),
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final event = _events[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: EventArtTile(
                      month: event.month,
                      day: event.day,
                      title: event.title,
                      status: event.status,
                      imageUrl: event.imageUrl,
                      isComplete: event.isComplete,
                      isLocked: event.isLocked,
                    ),
                  );
                },
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

class _EventItem {
  const _EventItem({
    required this.month,
    required this.day,
    required this.title,
    required this.status,
    required this.imageUrl,
    this.isComplete = false,
    this.isLocked = false,
  });

  final String month;
  final String day;
  final String title;
  final String status;
  final String imageUrl;
  final bool isComplete;
  final bool isLocked;
}

const _events = [
  _EventItem(
    month: 'Mar',
    day: '22',
    title: '1-1 Advisory call',
    status: 'Upcoming',
    imageUrl:
        'https://i.pinimg.com/736x/46/3f/4a/463f4a60723d27fc22603cb60f022850.jpg',
    isLocked: true,
  ),
  _EventItem(
    month: 'Mar',
    day: '24',
    title: 'Custom Panel',
    status: 'Confirmed',
    imageUrl:
        'https://i.pinimg.com/736x/b7/dc/56/b7dc56e5b167ac85b5da1fe202ac23e1.jpg',
    isComplete: true,
  ),
  _EventItem(
    month: 'Mar',
    day: '26',
    title: '2027 Roadmap',
    status: 'Incomplete',
    imageUrl:
        'https://i.pinimg.com/736x/43/a5/b2/43a5b2cee67bf2414fc393393a64f2f0.jpg',
    isLocked: true,
  ),
  _EventItem(
    month: 'Apr',
    day: '02',
    title: 'Creative critique',
    status: 'Open',
    imageUrl:
        'https://i.pinimg.com/736x/dd/69/9e/dd699e17c2cb0180549703c680e6d401.jpg',
  ),
  _EventItem(
    month: 'Apr',
    day: '07',
    title: 'Entry Test',
    status: 'Incomplete',
    imageUrl:
        'https://i.pinimg.com/736x/ee/83/c8/ee83c8dcb85c66d49ccb954741f8e549.jpg',
    isLocked: true,
  ),
];

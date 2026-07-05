import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_calender/const/event_calender_colors.dart';
import 'package:flutter_ui/features/event_calender/model/event_item.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailView extends StatefulWidget {
  const EventDetailView({super.key, required this.event});

  final EventItem event;

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  bool _joined = false;

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Scaffold(
      backgroundColor: EventCalenderColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 390.h,
            pinned: true,
            backgroundColor: EventCalenderColors.background,
            foregroundColor: EventCalenderColors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  EventNetworkImage(url: event.imageUrl),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xEE151514)],
                        stops: [.45, 1],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.w,
                    right: 20.w,
                    bottom: 22.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.category,
                          style: GoogleFonts.manrope(
                            color: EventCalenderColors.muted,
                            fontSize: 11.sp,
                          ),
                        ),
                        Text(
                          event.title,
                          style: GoogleFonts.manrope(
                            color: EventCalenderColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30.sp,
                          ),
                        ),
                        Text(
                          '${event.attendees} participants',
                          style: GoogleFonts.manrope(
                            color: EventCalenderColors.muted,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 40.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  title: '${event.date.day} July, 2026',
                  subtitle:
                      '${event.date.hour.toString().padLeft(2, '0')}:${event.date.minute.toString().padLeft(2, '0')} · ${event.location}',
                ),
                SizedBox(height: 12.h),
                _InfoRow(
                  icon: Icons.person_outline_rounded,
                  title: event.host,
                  subtitle: 'Organizer',
                ),
                SizedBox(height: 28.h),
                Text(
                  'About',
                  style: GoogleFonts.manrope(
                    color: EventCalenderColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  event.description,
                  style: GoogleFonts.manrope(
                    color: EventCalenderColors.muted,
                    fontSize: 13.sp,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 28.h),
                FilledButton(
                  onPressed: () => setState(() => _joined = !_joined),
                  style: FilledButton.styleFrom(
                    minimumSize: Size.fromHeight(54.h),
                    backgroundColor: _joined
                        ? EventCalenderColors.surfaceLight
                        : EventCalenderColors.accent,
                    foregroundColor: _joined
                        ? EventCalenderColors.white
                        : EventCalenderColors.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    _joined ? 'You’re going' : 'Join event',
                    style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42.r,
          height: 42.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: EventCalenderColors.surface,
          ),
          child: Icon(icon, color: EventCalenderColors.accent, size: 19.r),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  color: EventCalenderColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.manrope(
                  color: EventCalenderColors.muted,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

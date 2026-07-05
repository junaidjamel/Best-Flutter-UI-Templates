import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_calender/const/event_calender_colors.dart';
import 'package:flutter_ui/features/event_calender/model/event_item.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
    required this.isFavorite,
    required this.onFavorite,
  });

  final EventItem event;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 338.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: EventCalenderColors.surface,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            EventNetworkImage(url: event.imageUrl),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0x33000000),
                    Color(0xED151514),
                  ],
                  stops: [0, .48, 1],
                ),
              ),
            ),
            Positioned(
              top: 14.h,
              left: 14.w,
              child: SizedBox(
                width: (event.guestImageUrls.length * 20 + 12).w,
                height: 31.r,
                child: Stack(
                  children: event.guestImageUrls.indexed
                      .map(
                        (guest) => Positioned(
                          left: (guest.$1 * 20).w,
                          child: _GuestAvatar(imageUrl: guest.$2),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Positioned(
              top: 14.h,
              right: 14.w,
              child: Column(
                children: [
                  _DateBadge(date: event.date),
                  SizedBox(height: 8.h),
                  Material(
                    color: const Color(0x99000000),
                    shape: const CircleBorder(),
                    child: IconButton(
                      onPressed: onFavorite,
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavorite
                            ? EventCalenderColors.accent
                            : EventCalenderColors.white,
                        size: 19.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 18.w,
              right: 18.w,
              bottom: 18.h,
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
                  SizedBox(height: 2.h),
                  Text(
                    event.title,
                    style: GoogleFonts.manrope(
                      color: EventCalenderColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                      height: 1.05,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14.r,
                        color: EventCalenderColors.muted,
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Text(
                          event.location,
                          style: GoogleFonts.manrope(
                            color: EventCalenderColors.muted,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      Text(
                        '${event.attendees} going',
                        style: GoogleFonts.manrope(
                          color: EventCalenderColors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuestAvatar extends StatelessWidget {
  const _GuestAvatar({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31.r,
      height: 31.r,
      padding: EdgeInsets.all(1.5.r),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: EventCalenderColors.white,
      ),
      child: ClipOval(child: EventNetworkImage(url: imageUrl)),
    );
  }
}

class _DateBadge extends StatelessWidget {
  const _DateBadge({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    return Container(
      width: 48.r,
      height: 52.r,
      padding: EdgeInsets.only(top: 6.h),
      decoration: BoxDecoration(
        color: EventCalenderColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(
            '${date.day}',
            style: GoogleFonts.manrope(
              color: EventCalenderColors.background,
              fontSize: 18.sp,
              height: 1,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            months[date.month - 1],
            style: GoogleFonts.manrope(
              color: EventCalenderColors.background,
              fontSize: 9.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

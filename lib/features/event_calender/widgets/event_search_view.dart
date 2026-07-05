import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_calender/const/event_calender_colors.dart';
import 'package:flutter_ui/features/event_calender/model/event_item.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_detail_view.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class EventSearchView extends StatefulWidget {
  const EventSearchView({super.key});

  @override
  State<EventSearchView> createState() => _EventSearchViewState();
}

class _EventSearchViewState extends State<EventSearchView> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final results = EventCalenderData.events.where((event) {
      final query = _query.toLowerCase();
      return event.title.toLowerCase().contains(query) ||
          event.category.toLowerCase().contains(query) ||
          event.location.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: EventCalenderColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: EventCalenderColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.w, 8.h, 20.w, 8.h),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      color: EventCalenderColors.white,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Discover',
                      style: GoogleFonts.manrope(
                        color: EventCalenderColors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 22.h),
                child: TextField(
                  autofocus: true,
                  onChanged: (value) => setState(() => _query = value),
                  style: GoogleFonts.manrope(
                    color: EventCalenderColors.white,
                    fontSize: 14.sp,
                  ),
                  cursorColor: EventCalenderColors.accent,
                  decoration: InputDecoration(
                    hintText: 'Artists, events or places',
                    hintStyle: GoogleFonts.manrope(
                      color: EventCalenderColors.muted,
                      fontSize: 13.sp,
                    ),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,

                      color: EventCalenderColors.accent,
                    ),
                    filled: true,
                    fillColor: EventCalenderColors.surface,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  _query.isEmpty
                      ? 'Curated for you'
                      : '${results.length} results',
                  style: GoogleFonts.manrope(
                    color: EventCalenderColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: results.isEmpty
                    ? Center(
                        child: Text(
                          'Nothing found — try another mood.',
                          style: GoogleFonts.manrope(
                            color: EventCalenderColors.muted,
                            fontSize: 13.sp,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                        itemCount: results.length,
                        separatorBuilder: (_, _) => SizedBox(height: 12.h),
                        itemBuilder: (_, index) {
                          final event = results[index];
                          return _SearchResultCard(
                            event: event,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EventDetailView(event: event),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({required this.event, required this.onTap});

  final EventItem event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: EventCalenderColors.surface,
      borderRadius: BorderRadius.circular(18.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 104.h,
          child: Row(
            children: [
              SizedBox(
                width: 112.w,
                child: EventNetworkImage(url: event.imageUrl),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(14.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.category.toUpperCase(),
                        style: GoogleFonts.manrope(
                          color: EventCalenderColors.accent,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: .7,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        event.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.manrope(
                          color: EventCalenderColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        event.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.manrope(
                          color: EventCalenderColors.muted,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_calender/const/event_calender_colors.dart';
import 'package:flutter_ui/features/event_calender/model/event_item.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_calendar.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_card.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_detail_view.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_search_view.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCalenderView extends StatefulWidget {
  const EventCalenderView({super.key});

  @override
  State<EventCalenderView> createState() => _EventCalenderViewState();
}

class _EventCalenderViewState extends State<EventCalenderView> {
  int _tab = 0;
  DateTime _selectedDate = DateTime(2026, 7, 5);
  final Set<String> _favorites = {};

  void _openEvent(EventItem event) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => EventDetailView(event: event)));
  }

  void _openSearch() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const EventSearchView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: EventCalenderColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: EventCalenderColors.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 14.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _tab == 0 ? 'MONDAY, JUL 5' : 'JULY 2026',
                            style: GoogleFonts.manrope(
                              color: EventCalenderColors.muted,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .9,
                            ),
                          ),
                          Text(
                            _tab == 0 ? 'Events' : 'Calendar',
                            style: GoogleFonts.manrope(
                              color: EventCalenderColors.white,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: _openSearch,
                      icon: const Icon(CupertinoIcons.search),
                      color: EventCalenderColors.white,
                    ),
                    CircleAvatar(
                      radius: 19.r,
                      backgroundColor: EventCalenderColors.orange,

                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 240),
                  child: _tab == 0 ? _buildFeed() : _buildCalendar(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.only(bottom: 10.h),
        child: Center(
          heightFactor: 1,
          child: Container(
            width: 170.w,
            decoration: BoxDecoration(
              color: EventCalenderColors.surface.withValues(alpha: .96),
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(color: EventCalenderColors.divider),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x66000000),
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: NavigationBar(
              height: 60.h,
              selectedIndex: _tab,
              onDestinationSelected: (value) => setState(() => _tab = value),
              backgroundColor: Colors.transparent,
              indicatorColor: EventCalenderColors.accent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.grid_view_rounded),
                  selectedIcon: Icon(
                    Icons.grid_view_rounded,
                    color: Colors.black,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  selectedIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.black,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeed() {
    return ListView.separated(
      key: const ValueKey('feed'),
      padding: EdgeInsets.fromLTRB(14.w, 2.h, 14.w, 94.h),
      itemCount: EventCalenderData.events.length,
      separatorBuilder: (_, _) => SizedBox(height: 14.h),
      itemBuilder: (_, index) {
        final event = EventCalenderData.events[index];
        return EventCard(
          event: event,
          onTap: () => _openEvent(event),
          isFavorite: _favorites.contains(event.title),
          onFavorite: () => setState(() {
            _favorites.contains(event.title)
                ? _favorites.remove(event.title)
                : _favorites.add(event.title);
          }),
        );
      },
    );
  }

  Widget _buildCalendar() {
    final selectedEvents = EventCalenderData.events
        .where((event) => DateUtils.isSameDay(event.date, _selectedDate))
        .toList();
    return ListView(
      key: const ValueKey('calendar'),
      padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 94.h),
      children: [
        EventCalendar(
          selectedDate: _selectedDate,
          events: EventCalenderData.events,
          onSelected: (date) => setState(() => _selectedDate = date),
        ),
        SizedBox(height: 18.h),
        const Divider(color: EventCalenderColors.divider),
        SizedBox(height: 12.h),
        Text(
          selectedEvents.isEmpty ? 'No events this day' : 'On this day',
          style: GoogleFonts.manrope(
            color: EventCalenderColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.h),
        ...selectedEvents.map(
          (event) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ListTile(
              onTap: () => _openEvent(event),
              tileColor: EventCalenderColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              leading: CircleAvatar(
                backgroundColor: EventCalenderColors.accent,
                foregroundColor: EventCalenderColors.background,
                child: Text('${event.date.day}'),
              ),
              title: Text(
                event.title,
                style: GoogleFonts.manrope(
                  color: EventCalenderColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                event.location,
                style: GoogleFonts.manrope(
                  color: EventCalenderColors.muted,
                  fontSize: 11.sp,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: EventCalenderColors.muted,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

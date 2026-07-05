import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_calender/const/event_calender_colors.dart';
import 'package:flutter_ui/features/event_calender/model/event_item.dart';
import 'package:flutter_ui/features/event_calender/widgets/event_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCalendar extends StatelessWidget {
  const EventCalendar({
    super.key,
    required this.selectedDate,
    required this.onSelected,
    required this.events,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onSelected;
  final List<EventItem> events;

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(selectedDate.year, selectedDate.month);
    final days = DateUtils.getDaysInMonth(
      selectedDate.year,
      selectedDate.month,
    );
    final leading = firstDay.weekday % 7;
    const weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Column(
      children: [
        Row(
          children: weekDays
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: GoogleFonts.manrope(
                        color: EventCalenderColors.muted,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: leading + days,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: .86,
          ),
          itemBuilder: (_, index) {
            if (index < leading) return const SizedBox.shrink();
            final day = index - leading + 1;
            final selected = day == selectedDate.day;
            final event = events.cast<EventItem?>().firstWhere(
              (event) =>
                  event != null &&
                  event.date.year == selectedDate.year &&
                  event.date.month == selectedDate.month &&
                  event.date.day == day,
              orElse: () => null,
            );
            return GestureDetector(
              onTap: () => onSelected(
                DateTime(selectedDate.year, selectedDate.month, day),
              ),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: 38.r,
                    height: 38.r,
                    padding: EdgeInsets.all(selected ? 2.r : 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? EventCalenderColors.accent
                          : Colors.transparent,
                    ),
                    child: event == null
                        ? Center(
                            child: Text(
                              '$day',
                              style: GoogleFonts.manrope(
                                color: selected
                                    ? EventCalenderColors.background
                                    : EventCalenderColors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                EventNetworkImage(url: event.imageUrl),
                                const ColoredBox(color: Color(0x3D000000)),
                                Center(
                                  child: Text(
                                    '$day',
                                    style: GoogleFonts.manrope(
                                      color: EventCalenderColors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w800,
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  if (event != null)
                    Container(
                      margin: EdgeInsets.only(top: 3.h),
                      width: 4.r,
                      height: 4.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selected
                            ? EventCalenderColors.accent
                            : EventCalenderColors.orange,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

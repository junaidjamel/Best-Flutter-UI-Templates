import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';

class EventSummaryCard extends StatelessWidget {
  const EventSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dates = [
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 18.w, 14.h),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _SummaryGridPainter())),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming',
                style: TextStyle(
                  color: EventAnimationColors.softText,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'In the next 2 weeks',
                style: TextStyle(
                  color: EventAnimationColors.mutedText,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 14.w,
                runSpacing: 16.h,
                children: [
                  for (final date in dates)
                    _DateDot(label: date, isSelected: date == '12'),
                ],
              ),
            ],
          ),
          Positioned(
            right: 4.w,
            top: 2.h,
            child: Icon(
              Icons.more_vert,
              color: EventAnimationColors.softText.withValues(alpha: .62),
              size: 22.r,
            ),
          ),
        ],
      ),
    );
  }
}

class _DateDot extends StatelessWidget {
  const _DateDot({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      width: 25.r,
      height: 25.r,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xffC4CBC5)
            : EventAnimationColors.darkChip,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? EventAnimationColors.blackClr
              : EventAnimationColors.mutedText,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SummaryGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: .02)
      ..strokeWidth = 1;

    for (double x = 12; x < size.width; x += 16) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 10; y < size.height; y += 16) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

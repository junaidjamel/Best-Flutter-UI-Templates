import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';

class CollapsedEventCard extends StatelessWidget {
  const CollapsedEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Container(
            height: 46.r,
            width: 46.r,
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
                  "Upcoming - Mar 12",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withValues(alpha: .48),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                3.vSpace,
                Text(
                  "Event schedule",
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/subscription_icon.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({
    required this.subscription,
    required this.onTap,
    super.key,
  });

  final Subscription subscription;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 142.w,
      child: Material(
        color: SubscriptionTrackerColors.background,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: SubscriptionTrackerColors.border),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18.r),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SubscriptionIcon(
                      assetPath: subscription.icon,
                      fallback: subscription.name,
                      size: 45,
                    ),
                    const Spacer(),
                    Text(
                      '\$${subscription.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                10.vSpace,
                Text(
                  subscription.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                3.vSpace,
                Text(
                  '12 days left',
                  style: TextStyle(
                    color: SubscriptionTrackerColors.muted,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

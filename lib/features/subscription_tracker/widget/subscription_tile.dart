import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/subscription_icon.dart';

class SubscriptionTile extends StatelessWidget {
  const SubscriptionTile({
    required this.subscription,
    required this.onTap,
    super.key,
    this.compact = false,
  });

  final Subscription subscription;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: subscription.color,
      borderRadius: BorderRadius.circular(18.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
          child: Row(
            children: [
              SubscriptionIcon(
                imageUrl: subscription.iconUrl,
                fallback: subscription.name,
                size: compact ? 40 : 46,
              ),
              12.hSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      subscription.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: (compact ? 15 : 16).sp,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    5.vSpace,
                    Text(
                      compact ? subscription.plan : subscription.nextPayment,
                      style: TextStyle(
                        color: SubscriptionTrackerColors.muted,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
              8.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${subscription.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  5.vSpace,
                  Text(
                    subscription.billingPeriod,
                    style: TextStyle(
                      color: SubscriptionTrackerColors.muted,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

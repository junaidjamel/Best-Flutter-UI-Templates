import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/subscription_icon.dart';

class DetailSubscriptionCard extends StatelessWidget {
  const DetailSubscriptionCard({
    required this.subscription,
    required this.isExpanded,
    required this.onTap,
    required this.onCancel,
    required this.onAction,
    super.key,
  });

  final Subscription subscription;
  final bool isExpanded;
  final VoidCallback onTap;
  final VoidCallback onCancel;
  final ValueChanged<String> onAction;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: isExpanded ? 1 : 0),
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeInOutCubic,
      builder: (context, progress, child) {
        return Container(
          decoration: BoxDecoration(
            color: Color.lerp(
              SubscriptionTrackerColors.background,
              subscription.color,
              progress,
            ),
            border: Border.all(
              color: SubscriptionTrackerColors.border.withValues(
                alpha: 1 - progress,
              ),
            ),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.all(14.r),
                  child: Row(
                    children: [
                      SubscriptionIcon(
                        imageUrl: subscription.icon,
                        fallback: subscription.name,
                        size: 46,
                      ),
                      12.hSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subscription.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            3.vSpace,
                            Text(
                              subscription.plan,
                              style: TextStyle(
                                color: SubscriptionTrackerColors.muted,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${subscription.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          3.vSpace,
                          Text(
                            subscription.billingPeriod,
                            style: TextStyle(
                              color: SubscriptionTrackerColors.muted,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      6.hSpace,
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 280),
                        curve: Curves.easeInOutCubic,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 21.sp,
                          color: SubscriptionTrackerColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeInOutCubic,
                alignment: Alignment.topCenter,
                child: isExpanded
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(18.w, 4.h, 18.w, 18.h),
                        child: Column(
                          children: [
                            _DetailRow(
                              label: 'Payment info',
                              value: '•••• 0205',
                              action: 'Manage',
                              onTap: () => onAction('Payment method'),
                            ),
                            12.vSpace,
                            _DetailRow(
                              label: 'Plan details',
                              value: subscription.plan,
                              action: 'Change',
                              onTap: () => onAction('Plan'),
                            ),
                            20.vSpace,
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: onCancel,
                                style: FilledButton.styleFrom(
                                  backgroundColor:
                                      SubscriptionTrackerColors.ink,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 13.h),
                                ),
                                child: const Text('Cancel Subscription'),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    required this.action,
    required this.onTap,
  });

  final String label;
  final String value;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88.w,
          child: Text(
            label,
            style: TextStyle(
              color: SubscriptionTrackerColors.muted,
              fontSize: 12.sp,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ),
        OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: SubscriptionTrackerColors.ink,
            side: const BorderSide(color: SubscriptionTrackerColors.ink),
            visualDensity: VisualDensity.compact,
            textStyle: TextStyle(fontSize: 10.sp),
          ),
          child: Text(action),
        ),
      ],
    );
  }
}

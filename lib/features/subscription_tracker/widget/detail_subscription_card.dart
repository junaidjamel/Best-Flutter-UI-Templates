import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/subscription_icon.dart';

class DetailSubscriptionCard extends StatelessWidget {
  const DetailSubscriptionCard({
    required this.subscription,
    required this.onCancel,
    required this.onAction,
    super.key,
  });

  final Subscription subscription;
  final VoidCallback onCancel;
  final ValueChanged<String> onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: subscription.color,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SubscriptionIcon(
                imageUrl: subscription.iconUrl,
                fallback: subscription.name,
                size: 50,
              ),
              12.hSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subscription.name,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    3.vSpace,
                    Text(
                      subscription.plan,
                      style: TextStyle(
                        color: SubscriptionTrackerColors.muted,
                        fontSize: 12.sp,
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
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
          22.vSpace,
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
                backgroundColor: SubscriptionTrackerColors.ink,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 13.h),
              ),
              child: const Text('Cancel Subscription'),
            ),
          ),
        ],
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

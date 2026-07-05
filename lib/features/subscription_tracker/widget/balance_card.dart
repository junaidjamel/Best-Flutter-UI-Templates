import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.showBalance,
    required this.onVisibilityChanged,
    super.key,
  });

  final bool showBalance;
  final ValueChanged<bool> onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: SubscriptionTrackerColors.balance,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Balance',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              const Spacer(),

              Switch.adaptive(
                value: showBalance,
                onChanged: onVisibilityChanged,
                activeTrackColor: SubscriptionTrackerColors.ink,
                inactiveThumbColor: SubscriptionTrackerColors.muted,
                inactiveTrackColor: Colors.black12,
              ),
            ],
          ),
          14.vSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: Text(
                  showBalance ? '\$240.50' : '••••••',
                  key: ValueKey(showBalance),
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '07/37',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

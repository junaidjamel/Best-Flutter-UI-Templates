import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_data.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/subscription_detail_view.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/balance_card.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/subscription_tile.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/upcoming_card.dart';

class SubscriptionTrackerView extends StatefulWidget {
  const SubscriptionTrackerView({super.key});

  @override
  State<SubscriptionTrackerView> createState() =>
      _SubscriptionTrackerViewState();
}

class _SubscriptionTrackerViewState extends State<SubscriptionTrackerView> {
  bool _showBalance = true;

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SubscriptionDetailView(subscriptions: subscriptions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SubscriptionTrackerColors.background,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 28.h),
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 27.r,
                  backgroundColor: SubscriptionTrackerColors.medium,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
                  ),
                ),
                12.hSpace,
                Expanded(
                  child: Text(
                    'Daniel Smith',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton.outlined(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add subscription')),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            22.vSpace,
            BalanceCard(
              showBalance: _showBalance,
              onVisibilityChanged: (value) {
                setState(() => _showBalance = value);
              },
            ),
            22.vSpace,
            _SectionHeader(title: 'Upcoming', onViewAll: _openDetails),
            10.vSpace,
            SizedBox(
              height: 122.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: subscriptions.length,
                separatorBuilder: (_, _) => 10.hSpace,
                itemBuilder: (context, index) {
                  final subscription = subscriptions[index];
                  return UpcomingCard(
                    subscription: subscription,
                    onTap: _openDetails,
                  );
                },
              ),
            ),
            22.vSpace,
            _SectionHeader(title: 'All Subscriptions', onViewAll: _openDetails),
            10.vSpace,
            ...subscriptions
                .take(3)
                .map(
                  (subscription) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SubscriptionTile(
                      subscription: subscription,
                      onTap: _openDetails,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onViewAll});

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
          ),
        ),
        OutlinedButton(
          onPressed: onViewAll,
          style: OutlinedButton.styleFrom(
            foregroundColor: SubscriptionTrackerColors.ink,
            side: const BorderSide(color: SubscriptionTrackerColors.border),
            visualDensity: VisualDensity.compact,
            textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
          ),
          child: const Text('View All'),
        ),
      ],
    );
  }
}

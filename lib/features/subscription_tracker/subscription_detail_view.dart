import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/detail_subscription_card.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/subscription_tile.dart';

class SubscriptionDetailView extends StatefulWidget {
  const SubscriptionDetailView({
    required this.subscriptions,
    required this.selected,
    super.key,
  });

  final List<Subscription> subscriptions;
  final Subscription selected;

  @override
  State<SubscriptionDetailView> createState() => _SubscriptionDetailViewState();
}

class _SubscriptionDetailViewState extends State<SubscriptionDetailView> {
  late Subscription _selected;
  late List<Subscription> _subscriptions;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
    _subscriptions = List.of(widget.subscriptions);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$message settings opened')));
  }

  void _cancelSubscription() {
    setState(() {
      _subscriptions.remove(_selected);
      if (_subscriptions.isNotEmpty) _selected = _subscriptions.first;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Subscription cancelled')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SubscriptionTrackerColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'My Subscriptions',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () => _showMessage('More'),
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: _subscriptions.isEmpty
            ? Center(
                child: Text(
                  'No active subscriptions',
                  style: TextStyle(
                    color: SubscriptionTrackerColors.muted,
                    fontSize: 15.sp,
                  ),
                ),
              )
            : ListView(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
                children: [
                  DetailSubscriptionCard(
                    subscription: _selected,
                    onCancel: _cancelSubscription,
                    onAction: _showMessage,
                  ),
                  12.vSpace,
                  ..._subscriptions
                      .where((item) => item != _selected)
                      .map(
                        (item) => Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: SubscriptionTile(
                            subscription: item,
                            compact: true,
                            onTap: () => setState(() => _selected = item),
                          ),
                        ),
                      ),
                ],
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';
import 'package:flutter_ui/features/subscription_tracker/widget/detail_subscription_card.dart';

class SubscriptionDetailView extends StatefulWidget {
  const SubscriptionDetailView({required this.subscriptions, super.key});

  final List<Subscription> subscriptions;

  @override
  State<SubscriptionDetailView> createState() => _SubscriptionDetailViewState();
}

class _SubscriptionDetailViewState extends State<SubscriptionDetailView> {
  late List<Subscription> _subscriptions;
  int? _expandedIndex;
  int _animationRequest = 0;

  @override
  void initState() {
    super.initState();
    _subscriptions = List.of(widget.subscriptions);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$message settings opened')));
  }

  Future<void> _toggleTile(int index) async {
    final request = ++_animationRequest;

    if (_expandedIndex == index) {
      setState(() => _expandedIndex = null);
      return;
    }

    if (_expandedIndex != null) {
      setState(() => _expandedIndex = null);
      await Future<void>.delayed(const Duration(milliseconds: 220));
      if (!mounted || request != _animationRequest) return;
    }

    setState(() => _expandedIndex = index);
  }

  void _cancelSubscription(int index) {
    setState(() {
      _subscriptions.removeAt(index);
      _expandedIndex = null;
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
                children: List.generate(_subscriptions.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: DetailSubscriptionCard(
                      subscription: _subscriptions[index],
                      isExpanded: _expandedIndex == index,
                      onTap: () => _toggleTile(index),
                      onCancel: () => _cancelSubscription(index),
                      onAction: _showMessage,
                    ),
                  );
                }),
              ),
      ),
    );
  }
}

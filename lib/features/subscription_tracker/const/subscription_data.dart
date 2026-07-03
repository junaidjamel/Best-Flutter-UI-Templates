import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';

const subscriptions = [
  Subscription(
    name: 'Netflix',
    plan: 'Premium',
    price: 19,
    icon: 'assets/subscription_tracker/netflix.png',
    color: SubscriptionTrackerColors.netflix,
  ),
  Subscription(
    name: 'Notion',
    plan: 'Family',
    price: 8.99,
    icon: 'assets/subscription_tracker/notion.png',
    color: SubscriptionTrackerColors.yellow,
  ),
  Subscription(
    name: 'Medium',
    plan: 'Membership',
    price: 39,
    icon: 'assets/subscription_tracker/medium.png',
    color: SubscriptionTrackerColors.medium,
  ),
  Subscription(
    name: 'YouTube',
    plan: 'Premium',
    price: 12,
    icon: 'assets/subscription_tracker/youtube.png',
    color: SubscriptionTrackerColors.balance,
  ),

  Subscription(
    name: 'Adobe Creative Cloud',
    plan: 'All Apps',
    price: 22,
    icon: 'assets/subscription_tracker/adobe_creative_cloud.png',
    color: SubscriptionTrackerColors.adobe,
    billingPeriod: 'every 2 months',
  ),
];

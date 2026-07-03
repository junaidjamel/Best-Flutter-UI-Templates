import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';
import 'package:flutter_ui/features/subscription_tracker/model/subscription.dart';

const subscriptions = [
  Subscription(
    name: 'Netflix',
    plan: 'Premium',
    price: 19,
    iconUrl: 'https://cdn.simpleicons.org/netflix/000000',
    color: SubscriptionTrackerColors.netflix,
  ),
  Subscription(
    name: 'Spotify',
    plan: 'Family',
    price: 8.99,
    iconUrl: 'https://cdn.simpleicons.org/spotify/000000',
    color: SubscriptionTrackerColors.spotify,
  ),
  Subscription(
    name: 'Medium',
    plan: 'Membership',
    price: 39,
    iconUrl: 'https://cdn.simpleicons.org/medium/000000',
    color: SubscriptionTrackerColors.medium,
  ),
  Subscription(
    name: 'YouTube',
    plan: 'Premium',
    price: 12,
    iconUrl: 'https://cdn.simpleicons.org/youtube/000000',
    color: SubscriptionTrackerColors.surface,
  ),
  Subscription(
    name: 'Dropbox',
    plan: 'Plus',
    price: 11,
    iconUrl: 'https://cdn.simpleicons.org/dropbox/000000',
    color: SubscriptionTrackerColors.surface,
  ),
  Subscription(
    name: 'Adobe Creative Cloud',
    plan: 'All Apps',
    price: 22,
    iconUrl: 'https://cdn.simpleicons.org/adobecreativecloud/000000',
    color: SubscriptionTrackerColors.surface,
    billingPeriod: 'every 2 months',
  ),
];

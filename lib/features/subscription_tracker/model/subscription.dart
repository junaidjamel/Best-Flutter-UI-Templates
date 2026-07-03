import 'package:flutter/material.dart';

class Subscription {
  const Subscription({
    required this.name,
    required this.plan,
    required this.price,
    required this.iconUrl,
    required this.color,
    this.billingPeriod = 'per month',
    this.nextPayment = 'March 20, 14:00 pm',
  });

  final String name;
  final String plan;
  final double price;
  final String iconUrl;
  final Color color;
  final String billingPeriod;
  final String nextPayment;
}

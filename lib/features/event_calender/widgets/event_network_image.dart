import 'package:flutter/material.dart';
import 'package:flutter_ui/features/event_calender/const/event_calender_colors.dart';

class EventNetworkImage extends StatelessWidget {
  const EventNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  });

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : const ColoredBox(
              color: EventCalenderColors.surfaceLight,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: EventCalenderColors.accent,
                ),
              ),
            ),
      errorBuilder: (_, _, _) => const ColoredBox(
        color: EventCalenderColors.surfaceLight,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: EventCalenderColors.muted,
          ),
        ),
      ),
    );
  }
}

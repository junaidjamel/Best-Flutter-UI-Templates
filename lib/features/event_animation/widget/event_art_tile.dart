import 'package:flutter/material.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';

class EventArtTile extends StatelessWidget {
  const EventArtTile({
    super.key,
    required this.month,
    required this.day,
    required this.title,
    required this.status,
    required this.imageUrl,
    this.isComplete = false,
    this.isLocked = false,
    this.onTap,
  });

  final String month;
  final String day;
  final String title;
  final String status;
  final String imageUrl;
  final bool isComplete;
  final bool isLocked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color statusColor = isComplete
        ? const Color(0xff7EDCC0)
        : const Color(0xff8E8E93);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: EventAnimationColors.cardBorder,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff8E8E93),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color(0xff2B2B2B),
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff111111),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 13,
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            _TrailingIcon(isComplete: isComplete, isLocked: isLocked),
          ],
        ),
      ),
    );
  }
}

class _TrailingIcon extends StatelessWidget {
  const _TrailingIcon({required this.isComplete, required this.isLocked});

  final bool isComplete;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    if (isComplete) {
      return Container(
        height: 26,
        width: 26,
        decoration: const BoxDecoration(
          color: Color(0xff7EDCC0),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, size: 16, color: Colors.white),
      );
    }

    if (isLocked) {
      return Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffD8D8D8)),
        ),
        child: const Icon(
          Icons.lock_outline_rounded,
          size: 15,
          color: Color(0xff9A9A9A),
        ),
      );
    }

    return const Icon(
      Icons.chevron_right_rounded,
      size: 28,
      color: Color(0xff111111),
    );
  }
}

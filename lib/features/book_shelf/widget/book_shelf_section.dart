import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';
import 'package:flutter_ui/features/book_shelf/model/book_shelf.dart';

class BookShelfSection extends StatelessWidget {
  const BookShelfSection({required this.shelf, required this.onTap, super.key});

  final BookShelf shelf;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${shelf.category}, ${shelf.bookCount} books',
      child: GestureDetector(
        onTap: onTap,

        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  _BookFan(coverUrls: shelf.coverUrls),
                  const _GlassShelf(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: shelf.category,
                children: [
                  TextSpan(
                    text: '  ·  ${shelf.bookCount} books',
                    style: const TextStyle(color: BookShelfColors.mutedText),
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: BookShelfColors.text,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookFan extends StatelessWidget {
  const _BookFan({required this.coverUrls});

  static const _leftPositions = [20.0, 50.0, 70.0];
  static const _topPositions = [60.0, 70.0, 90.0];
  static const _angles = [-.3, .02, .15];

  final List<String> coverUrls;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: List.generate(coverUrls.length, (index) {
          return Positioned(
            left: _leftPositions[index],
            top: _topPositions[index],
            child: Transform.rotate(
              angle: _angles[index],
              child: _BookCover(
                url: coverUrls[index],
                width: 70.w,
                height: 110.h,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _GlassShelf extends StatelessWidget {
  const _GlassShelf();

  static const _radius = 4.0;
  static const _pinOffset = 6.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 3,
      right: 3,
      bottom: 0,
      height: 80.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: BookShelfColors.glassGradient,
              ),
              borderRadius: BorderRadius.circular(_radius),
              boxShadow: const [
                BoxShadow(
                  color: BookShelfColors.glassShadow,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: const Stack(
              children: [
                _GlassHighlight(),
                Positioned(
                  left: _pinOffset,
                  top: _pinOffset,
                  child: _ShelfPin(),
                ),
                Positioned(
                  right: _pinOffset,
                  top: _pinOffset,
                  child: _ShelfPin(),
                ),
                Positioned(
                  left: _pinOffset,
                  bottom: _pinOffset,
                  child: _ShelfPin(),
                ),
                Positioned(
                  right: _pinOffset,
                  bottom: _pinOffset,
                  child: _ShelfPin(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassHighlight extends StatelessWidget {
  const _GlassHighlight();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 14,
      right: 14,
      child: Container(
        height: 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              BookShelfColors.glassHighlight,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}

class _BookCover extends StatelessWidget {
  const _BookCover({
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => ColoredBox(
          color: BookShelfColors.surface,
          child: SizedBox(
            width: width,
            height: height,
            child: const Icon(
              Icons.menu_book_rounded,
              color: BookShelfColors.mutedText,
            ),
          ),
        ),
      ),
    );
  }
}

class _ShelfPin extends StatelessWidget {
  const _ShelfPin();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: BookShelfColors.text.withValues(alpha: .78),
        shape: BoxShape.circle,
        border: Border.all(color: BookShelfColors.pinBorder),
      ),
      child: const Icon(
        Icons.close_rounded,
        size: 5,
        color: BookShelfColors.pinIcon,
      ),
    );
  }
}

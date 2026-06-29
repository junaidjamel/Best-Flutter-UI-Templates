import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';

class BookShelfData {
  const BookShelfData({
    required this.category,
    required this.bookCount,
    required this.coverUrls,
  });

  final String category;
  final int bookCount;
  final List<String> coverUrls;
}

class BookShelfSection extends StatelessWidget {
  const BookShelfSection({required this.shelf, required this.onTap, super.key});

  final BookShelfData shelf;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${shelf.category}, ${shelf.bookCount} books',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  ...List.generate(shelf.coverUrls.length, (index) {
                    final leftPositions = [20.0, 50.0, 70.0];
                    final topPositions = [60.0, 70.0, 90.0];
                    final angles = [-.3, .02, .15];
                    return Positioned(
                      left: leftPositions[index],
                      top: topPositions[index],
                      child: Transform.rotate(
                        angle: angles[index],
                        child: _BookCover(
                          url: shelf.coverUrls[index],
                          width: 70.w,
                          height: 110.h,
                        ),
                      ),
                    );
                  }),
                  Positioned(
                    left: 3,
                    right: 3,
                    bottom: 0,
                    height: 80.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0x18FFFFFF),
                                Color(0x06FFFFFF),
                                Color(0x10FFFFFF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4),

                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 20,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 14,
                                right: 14,
                                child: Container(
                                  height: 1,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Color(0xA6FFFFFF),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 6,
                                top: 6,
                                child: _ShelfPin(),
                              ),
                              const Positioned(
                                right: 6,
                                top: 6,
                                child: _ShelfPin(),
                              ),
                              const Positioned(
                                left: 6,
                                bottom: 6,
                                child: _ShelfPin(),
                              ),
                              const Positioned(
                                right: 6,
                                bottom: 6,
                                child: _ShelfPin(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
        border: Border.all(color: Colors.black26),
      ),
      child: const Icon(Icons.close_rounded, size: 5, color: Colors.black54),
    );
  }
}

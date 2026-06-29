import 'dart:ui';

import 'package:flutter/material.dart';
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
                    final offsets = [-30.0, 0.0, 30.0];
                    final angles = [-.11, .02, .11];
                    return Positioned(
                      top: index == 1 ? 0 : 12,
                      child: Transform.rotate(
                        angle: angles[index],
                        child: _BookCover(
                          url: shelf.coverUrls[index],
                          width: 88,
                          height: 132,
                        ),
                      ),
                    );
                  }),
                  Positioned(
                    left: 3,
                    right: 3,
                    bottom: 0,
                    height: 82,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: BookShelfColors.glass,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: BookShelfColors.glassBorder,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 18,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _ShelfPin(),
                                Spacer(),
                                _ShelfPin(),
                              ],
                            ),
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

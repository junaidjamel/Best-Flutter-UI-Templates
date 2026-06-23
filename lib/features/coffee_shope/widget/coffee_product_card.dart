import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeProduct {
  const CoffeeProduct({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.accent,
    required this.isDarkCup,
  });

  final String name;
  final String subtitle;
  final String price;
  final String rating;
  final Color accent;
  final bool isDarkCup;
}

class CoffeeProductCard extends StatelessWidget {
  const CoffeeProductCard({
    required this.product,
    required this.width,
    super.key,
  });

  final CoffeeProduct product;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff242A34), Color(0xff151A22), Color(0xff0E1218)],
          stops: [0.0, 0.48, 1.0],
        ),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.03),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.24),
            blurRadius: 18.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: SizedBox(
                  height: 128.h,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: CoffeeThumbnailPainter(
                      accent: product.accent,
                      isDarkCup: product.isDarkCup,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.38),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: CoffeeShopeColors.lightOrange,
                        size: 14.sp,
                      ),
                      3.hSpace,
                      Text(
                        product.rating,
                        style: GoogleFonts.poppins(
                          color: CoffeeShopeColors.whiteClr,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          12.vSpace,
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: CoffeeShopeColors.whiteClr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
          5.vSpace,
          Text(
            product.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: CoffeeShopeColors.softGrey,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          12.vSpace,
          Row(
            children: [
              Text(
                r'$',
                style: GoogleFonts.poppins(
                  color: CoffeeShopeColors.lightOrange,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              5.hSpace,
              Expanded(
                child: Text(
                  product.price,
                  style: GoogleFonts.poppins(
                    color: CoffeeShopeColors.whiteClr,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 35.r,
                width: 35.r,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: CoffeeShopeColors.lightOrange,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: CoffeeShopeColors.whiteClr,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CoffeeThumbnailPainter extends CustomPainter {
  const CoffeeThumbnailPainter({
    required this.accent,
    required this.isDarkCup,
    this.compact = false,
  });

  final Color accent;
  final bool isDarkCup;
  final bool compact;

  @override
  void paint(Canvas canvas, Size size) {
    final woodPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          accent.withValues(alpha: 0.96),
          const Color(0xff553018),
          const Color(0xff1D1411),
        ],
      ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, woodPaint);

    final grain = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..strokeWidth = 1.2;
    for (var i = 0; i < 11; i++) {
      final y = size.height * (0.12 + i * 0.085);
      final path = Path()
        ..moveTo(-10, y)
        ..quadraticBezierTo(
          size.width * 0.35,
          y - 24 * math.sin(i),
          size.width + 12,
          y + 16 * math.cos(i),
        );
      canvas.drawPath(path, grain);
    }

    final center = Offset(size.width * 0.5, size.height * 0.51);
    final saucerRadius = size.shortestSide * (compact ? 0.33 : 0.36);
    final cupRadius = saucerRadius * 0.62;

    canvas.drawCircle(
      center.translate(4, 5),
      saucerRadius,
      Paint()..color = Colors.black.withValues(alpha: 0.22),
    );
    canvas.drawCircle(
      center,
      saucerRadius,
      Paint()..color = isDarkCup ? const Color(0xff071012) : Colors.white,
    );
    canvas.drawCircle(
      center,
      saucerRadius * 0.86,
      Paint()
        ..color = isDarkCup ? const Color(0xff071012) : const Color(0xffF1F3F2),
    );
    canvas.drawCircle(
      center,
      cupRadius,
      Paint()
        ..color = isDarkCup ? const Color(0xff0B1417) : const Color(0xffEFEFEA),
    );
    canvas.drawCircle(
      center,
      cupRadius * 0.78,
      Paint()..color = const Color(0xffB56E3F),
    );
    canvas.drawCircle(
      center,
      cupRadius * 0.58,
      Paint()..color = const Color(0xffE7C09A),
    );

    final lattePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = compact ? 2.3 : 2.7;

    for (var i = 0; i < 4; i++) {
      final scale = 1 - i * 0.16;
      final rect = Rect.fromCenter(
        center: center.translate(0, 2.h),
        width: cupRadius * 1.12 * scale,
        height: cupRadius * 0.72 * scale,
      );
      canvas.drawArc(rect, math.pi * 0.18, math.pi * 1.45, false, lattePaint);
    }

    canvas.drawLine(
      center.translate(0, -cupRadius * 0.5),
      center.translate(0, cupRadius * 0.46),
      lattePaint,
    );

    if (!isDarkCup) {
      final spoonPaint = Paint()
        ..color = const Color(0xff2D3332)
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
        Offset(size.width * 0.26, size.height * 0.25),
        Offset(size.width * 0.38, size.height * 0.42),
        spoonPaint,
      );
      canvas.drawLine(
        Offset(size.width * 0.65, size.height * 0.65),
        Offset(size.width * 0.78, size.height * 0.72),
        spoonPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CoffeeThumbnailPainter oldDelegate) {
    return oldDelegate.accent != accent ||
        oldDelegate.isDarkCup != isDarkCup ||
        oldDelegate.compact != compact;
  }
}

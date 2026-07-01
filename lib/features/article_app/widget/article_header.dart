import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleHeader extends StatelessWidget {
  const ArticleHeader({
    required this.title,
    required this.showBackButton,
    required this.onBack,
    required this.onSettings,
    super.key,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback onBack;
  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 18.h),
      child: Row(
        children: [
          if (showBackButton)
            _RoundButton(icon: Icons.arrow_back_rounded, onTap: onBack)
          else
            SizedBox(width: 44.w),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: ArticleColors.primary,
                fontSize: 28.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          _RoundButton(icon: Icons.settings_outlined, onTap: onSettings),
        ],
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ArticleColors.primary,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox.square(
          dimension: 44.w,
          child: Icon(icon, color: Colors.white, size: 23.sp),
        ),
      ),
    );
  }
}

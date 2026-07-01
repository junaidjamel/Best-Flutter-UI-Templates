import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/widget/round_icon_button.dart';
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
            RoundIconButton(icon: Icons.arrow_back_rounded, onTap: onBack)
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
          RoundIconButton(icon: Icons.settings_outlined, onTap: onSettings),
        ],
      ),
    );
  }
}

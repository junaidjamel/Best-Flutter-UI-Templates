import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/const/article_data.dart';
import 'package:flutter_ui/features/article_app/widget/network_article_image.dart';
import 'package:flutter_ui/features/article_app/widget/round_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({required this.article, super.key});

  final ArticleData article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArticleColors.background,
      appBar: AppBar(
        backgroundColor: ArticleColors.background,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: RoundIconButton(
            icon: Icons.arrow_back_rounded,
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'ARTICLE',
          style: GoogleFonts.lora(
            color: ArticleColors.primary,
            fontSize: 28.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 32.h),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: SizedBox(
              height: 230.h,
              child: NetworkArticleImage(
                url: article.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          22.vSpace,
          Text(
            article.title,
            style: TextStyle(
              fontSize: 30.sp,
              height: 1.08,
              fontWeight: FontWeight.w800,
            ),
          ),
          14.vSpace,
          Text(
            '${article.description}\n\n${article.content}',
            style: TextStyle(fontSize: 17.sp, height: 1.55),
          ),
        ],
      ),
    );
  }
}

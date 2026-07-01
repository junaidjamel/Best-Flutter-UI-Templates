import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/const/article_data.dart';
import 'package:flutter_ui/features/article_app/widget/article_detail_page.dart';
import 'package:flutter_ui/features/article_app/widget/network_article_image.dart';

class ArticleFeedPage extends StatelessWidget {
  const ArticleFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 22.h),
      itemCount: articlePosts.length,
      separatorBuilder: (_, _) => 20.vSpace,
      itemBuilder: (context, index) =>
          ArticleCard(article: articlePosts[index]),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({required this.article, super.key});

  final ArticleData article;

  void _openArticle(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ArticleDetailPage(article: article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ArticleColors.surface,
      borderRadius: BorderRadius.circular(28.r),
      child: InkWell(
        onTap: () => _openArticle(context),
        borderRadius: BorderRadius.circular(28.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
            border: Border.all(color: ArticleColors.border),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: SizedBox(
                  height: 174.h,
                  child: NetworkArticleImage(
                    url: article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              14.vSpace,
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 25.sp,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.7,
                ),
              ),
              10.vSpace,
              Text(
                article.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15.sp, height: 1.45),
              ),
              18.vSpace,
              Row(
                children: [
                  TextButton(
                    onPressed: () => _openArticle(context),
                    style: TextButton.styleFrom(
                      foregroundColor: ArticleColors.primary,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'read more',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: ArticleColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(11.w),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 23.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

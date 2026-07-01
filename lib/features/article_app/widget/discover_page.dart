import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/const/article_data.dart';
import 'package:flutter_ui/features/article_app/const/discovery_data.dart';
import 'package:flutter_ui/features/article_app/widget/article_detail_page.dart';
import 'package:flutter_ui/features/article_app/widget/network_article_image.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final articles = discoveryCategories[_selectedCategory].articles;

    return Column(
      children: [
        _CategoryTabs(
          selectedIndex: _selectedCategory,
          onSelected: (index) => setState(() => _selectedCategory = index),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: ListView.separated(
              key: ValueKey(_selectedCategory),
              padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 24.h),
              itemCount: articles.length,
              separatorBuilder: (_, _) => 12.vSpace,
              itemBuilder: (context, index) =>
                  _DiscoveryCard(article: articles[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs({required this.selectedIndex, required this.onSelected});

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemCount: discoveryCategories.length,
        separatorBuilder: (_, _) => 10.hSpace,
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;

          return ChoiceChip(
            selected: selected,
            onSelected: (_) => onSelected(index),
            label: Text(discoveryCategories[index].name),
            showCheckmark: false,
            backgroundColor: ArticleColors.surface,
            selectedColor: ArticleColors.primary,
            side: const BorderSide(color: ArticleColors.border),
            labelStyle: TextStyle(
              color: selected ? Colors.white : ArticleColors.primary,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );
  }
}

class _DiscoveryCard extends StatelessWidget {
  const _DiscoveryCard({required this.article});

  final ArticleData article;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ArticleColors.surface,
      borderRadius: BorderRadius.circular(18.r),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ArticleDetailPage(article: article),
          ),
        ),
        borderRadius: BorderRadius.circular(18.r),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: ArticleColors.border),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13.r),
                child: SizedBox(
                  width: 112.w,
                  height: 112.h,
                  child: NetworkArticleImage(
                    url: article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              14.hSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.sp,
                        height: 1.12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    8.vSpace,
                    Text(
                      article.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ArticleColors.secondaryText,
                        fontSize: 12.sp,
                        height: 1.35,
                      ),
                    ),
                    9.vSpace,
                    Text(
                      '5 min read  →',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

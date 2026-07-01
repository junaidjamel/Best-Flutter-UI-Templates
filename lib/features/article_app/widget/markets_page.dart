import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/widget/network_article_image.dart';

class MarketsPage extends StatefulWidget {
  const MarketsPage({super.key});

  @override
  State<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  int _tab = 0;

  static const _tabs = ['Overview', 'Commodities', 'Indices'];
  static const _stories = [
    (
      title: 'Global economy shows revised growth forecast',
      detail: 'Newly downgraded forecasts damp market mood.',
      image:
          'https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?auto=format&fit=crop&w=600&q=85',
    ),
    (
      title: 'Crypto Markets Collapse Amid Tighter US',
      detail: 'Stablecoins face pressure after new policy changes.',
      image:
          'https://images.unsplash.com/photo-1518546305927-5a555bb7020d?auto=format&fit=crop&w=600&q=85',
    ),
    (
      title: 'Oil prices rise to \$90 per barrel: who will win?',
      detail: 'Supply falls across major producing regions.',
      image:
          'https://images.unsplash.com/photo-1518709594023-6eab9bab7b23?auto=format&fit=crop&w=600&q=85',
    ),
    (
      title: 'China Slows Down: How will it Halt Global Growth?',
      detail: 'Emerging markets rely on China’s infrastructure.',
      image:
          'https://images.unsplash.com/photo-1521295121783-8a321d551ad2?auto=format&fit=crop&w=600&q=85',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 22.h),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _tabs.length,
            (index) => InkWell(
              onTap: () => setState(() => _tab = index),
              borderRadius: BorderRadius.circular(8.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                child: Column(
                  children: [
                    Text(
                      _tabs[index],
                      style: TextStyle(
                        color: _tab == index
                            ? ArticleColors.primary
                            : ArticleColors.muted,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    5.vSpace,
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: _tab == index ? 36.w : 0,
                      height: 2.h,
                      color: ArticleColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        14.vSpace,
        Row(
          children: [
            const Expanded(
              child: _MarketCard(
                name: 'S&P 200',
                value: '24,450.5',
                change: '-1.81%',
                positive: false,
              ),
            ),
            10.hSpace,
            const Expanded(
              child: _MarketCard(
                name: 'S&P 500',
                value: '19,865.3',
                change: '+0.48%',
                positive: true,
              ),
            ),
            10.hSpace,
            const Expanded(
              child: _MarketCard(
                name: 'NASDAQ',
                value: '17,450.1',
                change: '+1.05%',
                positive: true,
              ),
            ),
          ],
        ),
        22.vSpace,
        ...List.generate(
          _stories.length,
          (index) => _MarketStory(
            title: _stories[index].title,
            detail: _stories[index].detail,
            image: _stories[index].image,
            onTap: () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(_stories[index].title))),
          ),
        ),
      ],
    );
  }
}

class _MarketCard extends StatelessWidget {
  const _MarketCard({
    required this.name,
    required this.value,
    required this.change,
    required this.positive,
  });

  final String name;
  final String value;
  final String change;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final color = positive ? ArticleColors.gain : ArticleColors.loss;

    return Container(
      height: 145.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ArticleColors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: ArticleColors.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
          ),
          6.vSpace,
          Text(value, style: TextStyle(fontSize: 11.sp)),
          6.vSpace,
          Text(
            '${positive ? '▲' : '▼'} $change',
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Icon(Icons.show_chart_rounded, color: color, size: 38.sp),
        ],
      ),
    );
  }
}

class _MarketStory extends StatelessWidget {
  const _MarketStory({
    required this.title,
    required this.detail,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String detail;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: ArticleColors.border)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: SizedBox(
                width: 135.w,
                height: 92.h,
                child: NetworkArticleImage(url: image, fit: BoxFit.cover),
              ),
            ),
            14.hSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.08,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  7.vSpace,
                  Text(
                    detail,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp, height: 1.35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

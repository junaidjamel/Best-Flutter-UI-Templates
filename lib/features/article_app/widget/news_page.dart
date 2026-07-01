import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/widget/network_article_image.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const _articles = [
    (
      title: 'How generative AI is changing creative work',
      description:
          'New AI tools are helping designers, writers, and developers move from early ideas to polished work faster.',
      image:
          'https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=1200&q=85',
    ),
    (
      title: 'The next generation of smarter robots',
      description:
          'Advances in machine learning are enabling robots to understand their surroundings and handle complex tasks.',
      image:
          'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&w=1200&q=85',
    ),
    (
      title: 'Why AI assistants are becoming more personal',
      description:
          'Modern assistants can understand context, organize daily work, and provide more useful responses.',
      image:
          'https://images.unsplash.com/photo-1531746790731-6c087fecd65a?auto=format&fit=crop&w=1200&q=85',
    ),
    (
      title: 'Inside the race to build powerful AI chips',
      description:
          'Technology companies are designing faster processors to train larger models with less time and energy.',
      image:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=1200&q=85',
    ),
    (
      title: 'Can artificial intelligence improve healthcare?',
      description:
          'AI systems are helping doctors analyze medical images, discover treatments, and identify health risks earlier.',
      image:
          'https://images.unsplash.com/photo-1576086213369-97a306d36557?auto=format&fit=crop&w=1200&q=85',
    ),
    (
      title: 'The technology powering tomorrow’s smart cities',
      description:
          'Connected sensors and intelligent software are helping cities reduce traffic, energy use, and waste.',
      image:
          'https://images.unsplash.com/photo-1518005020951-eccb494ad742?auto=format&fit=crop&w=1200&q=85',
    ),
    (
      title: 'How quantum computing could transform technology',
      description:
          'Researchers are exploring machines that could solve scientific and computing problems beyond today’s systems.',
      image:
          'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?auto=format&fit=crop&w=1200&q=85',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 22.h),
      itemCount: _articles.length,
      separatorBuilder: (_, _) => 20.vSpace,
      itemBuilder: (context, index) {
        final article = _articles[index];
        return NewsCard(
          title: article.title,
          description: article.description,
          imageUrl: article.image,
        );
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  final String title;
  final String description;
  final String imageUrl;

  void _openArticle(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _ArticleDetail(
          title: title,
          description: description,
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ArticleColors.surface,
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
              child: NetworkArticleImage(url: imageUrl, fit: BoxFit.cover),
            ),
          ),
          14.vSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: 25.sp,
              height: 1.05,
              fontWeight: FontWeight.w800,
              letterSpacing: -.7,
            ),
          ),
          10.vSpace,
          Text(
            description,
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
              Material(
                color: ArticleColors.primary,
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () => _openArticle(context),
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(11.w),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 23.sp,
                    ),
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

class _ArticleDetail extends StatelessWidget {
  const _ArticleDetail({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArticleColors.background,
      appBar: AppBar(
        backgroundColor: ArticleColors.background,
        title: const Text('ARTICLE'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 32.h),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: SizedBox(
              height: 230.h,
              child: NetworkArticleImage(url: imageUrl, fit: BoxFit.cover),
            ),
          ),
          22.vSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: 30.sp,
              height: 1.08,
              fontWeight: FontWeight.w800,
            ),
          ),
          14.vSpace,
          Text(
            '$description\n\nArtificial intelligence is evolving quickly as '
            'researchers and '
            'technology companies introduce more capable tools. Understanding '
            'how these systems work helps people use them thoughtfully and '
            'prepare for the changes they may bring.',
            style: TextStyle(fontSize: 17.sp, height: 1.55),
          ),
        ],
      ),
    );
  }
}

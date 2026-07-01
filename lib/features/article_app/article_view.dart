import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';
import 'package:flutter_ui/features/article_app/widget/article_bottom_nav.dart';
import 'package:flutter_ui/features/article_app/widget/article_header.dart';
import 'package:flutter_ui/features/article_app/widget/markets_page.dart';
import 'package:flutter_ui/features/article_app/widget/news_page.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isArticles = _selectedIndex == 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: ArticleColors.background,
        body: SafeArea(
          child: Column(
            children: [
              ArticleHeader(
                title: isArticles ? 'ARTICLES' : 'MARKETS',
                showBackButton: isArticles,
                onBack: () => Navigator.maybePop(context),
                onSettings: () {},
              ),
              Expanded(
                child: isArticles ? const NewsPage() : const MarketsPage(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ArticleBottomNav(
          selectedIndex: _selectedIndex,
          onSelected: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}

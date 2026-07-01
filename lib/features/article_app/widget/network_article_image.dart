import 'package:flutter/material.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';

class NetworkArticleImage extends StatelessWidget {
  const NetworkArticleImage({required this.url, required this.fit, super.key});

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (_, _, _) => const ColoredBox(
        color: ArticleColors.selectedNav,
        child: Center(child: Icon(Icons.image_not_supported_outlined)),
      ),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const ColoredBox(
          color: ArticleColors.selectedNav,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      },
    );
  }
}

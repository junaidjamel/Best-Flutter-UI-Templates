import 'package:flutter/material.dart';
import 'package:flutter_ui/features/scroll_social/const/scroll_social_colors.dart';

class SocialNetworkImage extends StatelessWidget {
  const SocialNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String imageUrl;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      fit: fit,
      errorBuilder: (context, error, stackTrace) =>
          const ColoredBox(color: ScrollSocialColors.imagePlaceholder),
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null
          ? child
          : const ColoredBox(color: ScrollSocialColors.imageLoading),
    );
    return borderRadius == null
        ? image
        : ClipRRect(borderRadius: borderRadius!, child: image);
  }
}

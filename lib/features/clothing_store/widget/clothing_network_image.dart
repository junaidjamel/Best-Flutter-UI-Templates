import 'package:flutter/material.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';

class ClothingNetworkImage extends StatelessWidget {
  const ClothingNetworkImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const ColoredBox(
          color: ClothingAppColors.surfaceSoft,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: ClothingAppColors.orange,
            ),
          ),
        );
      },
      errorBuilder: (_, _, _) => const ColoredBox(
        color: ClothingAppColors.surfaceSoft,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: ClothingAppColors.muted,
          ),
        ),
      ),
    );
  }
}

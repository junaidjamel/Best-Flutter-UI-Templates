// import 'package:cal_scanner/app_widgets/animation/bouncing_animation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../theme/app_typography.dart';

// class CustomSmallButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color backgroundColor;
//   final Color textColor;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final EdgeInsetsGeometry padding;
//   final double borderRadius;
//   final double? width;
//   final double? height;
//   final Color? borderColor;
//   final double borderWidth;
//   final IconData? icon;
//   final double iconSize;
//   final Color? iconColor;
//   final TextAlign textAlign;
//   final MainAxisAlignment alignment;

//   const CustomSmallButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.backgroundColor = Colors.black,
//     this.textColor = Colors.white,
//     this.fontSize = 14,
//     this.fontWeight = FontWeight.w600,
//     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     this.borderRadius = 30,
//     this.height,
//     this.width,
//     this.borderColor,
//     this.borderWidth = 0,
//     this.icon,
//     this.iconSize = 18,
//     this.iconColor,
//     this.textAlign = TextAlign.center,
//     this.alignment = MainAxisAlignment.center,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Bounce(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height ?? 40.h,
//         padding: padding,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(borderRadius),
//           border: borderColor != null
//               ? Border.all(color: borderColor!, width: borderWidth)
//               : null,
//         ),
//         child: Row(
//           mainAxisAlignment: alignment,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (icon != null) ...[
//               Icon(icon, size: iconSize, color: iconColor ?? textColor),
//               const SizedBox(width: 6),
//             ],
//             Text(
//               text,
//               textAlign: textAlign,
//               style: AppTypography.bodyMedium.copyWith(
//                 color: textColor,
//                 fontSize: fontSize,
//                 fontWeight: fontWeight,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

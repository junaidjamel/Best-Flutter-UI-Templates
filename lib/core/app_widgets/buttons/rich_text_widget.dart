// import 'package:cal_scanner/theme/app_colors.dart';
// import 'package:cal_scanner/theme/app_typography.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomRichText extends StatelessWidget {
//   final String info;
//   final String title;
//   final TextStyle? firstTextStyle;
//   final TextStyle? secondTextStyle;

//   const CustomRichText({
//     super.key,
//     required this.info,
//     required this.title,
//     this.firstTextStyle,
//     this.secondTextStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         text: info,
//         style:
//             firstTextStyle ??
//             AppTypography.bodyMedium.copyWith(
//               color: AppColors.kBlack,
//               fontSize: 17.sp,
//             ),
//         children: [
//           TextSpan(
//             text: ' $title',
//             style:
//                 secondTextStyle ??
//                 AppTypography.bodyMedium.copyWith(
//                   color: AppColors.kBlack,
//                   fontSize: 17.sp,
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cal_scanner/app_widgets/animation/bouncing_animation.dart';
// import 'package:cal_scanner/theme/app_colors.dart';
// import 'package:cal_scanner/theme/app_typography.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// class GoogleButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const GoogleButton({
//     required this.onPressed,
//     required this.text,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Bounce(
//       onTap: onPressed,
//       child: Container(
//         height: 42.h,
//         width: MediaQuery.sizeOf(context).width,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(22.r),
//             border: Border.all(color: AppColors.kGrey.withValues(alpha: .1))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Image.asset(
//             //   Assets.icons.auth.google.path,
//             //   width: 22.w,
//             // ),
           
//             Text(text, style: AppTypography.kBold16.copyWith(fontSize: 16.sp)),
//           ],
//         ),
//       ),
//     );
//   }
// }

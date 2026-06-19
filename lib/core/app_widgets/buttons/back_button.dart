// import 'package:cal_scanner/core/extensions/widget_extension.dart';
// import 'package:cal_scanner/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppBackButton extends StatelessWidget {
//   final Function()? onPressed;
//   const AppBackButton({super.key, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Ink(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: AppColors.kWhite,
//           border: Border.all(color: AppColors.kgrey),
//         ),
//         child: InkWell(
//           onTap: onPressed ?? () => Navigator.pop(context),
//           borderRadius: BorderRadius.circular(100),
//           child: Padding(
//             padding: EdgeInsets.all(4.sp),
//             child: const Icon(Icons.arrow_back),
//           ),
//         ),
//       ),
//     ).paddingOnly(left: 10);
//   }
// }

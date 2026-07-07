import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';
import 'package:google_fonts/google_fonts.dart';

class EmpetyCartWidget extends StatelessWidget {
  const EmpetyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(empetyCart),
        ),
        4.vSpace,
        Text('Cart is Empety', style: GoogleFonts.kanit(fontSize: 22.sp)),
      ],
    );
  }
}

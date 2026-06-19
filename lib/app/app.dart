import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/app/ui_gallery_home.dart';
import 'package:flutter_ui/core/theme/app_theme.dart';

class FlutterUiApp extends StatelessWidget {
  const FlutterUiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter UI's",
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeMode.system,
          home: child,
        );
      },
      child: const UiGalleryHome(),
    );
  }
}

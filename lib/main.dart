import 'package:flutter/material.dart';
import 'package:flutter_ui/3d_object/three_d_object_view.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter UI's",
      theme: ThemeData(
        textTheme: AppTypography.googleTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ThreeDObjectView(),
    );
  }
}

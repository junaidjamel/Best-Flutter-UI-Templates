import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';

class PageViewWithDots extends StatefulWidget {
  const PageViewWithDots({super.key});

  @override
  PageViewWithDotsState createState() => PageViewWithDotsState();
}

class PageViewWithDotsState extends State<PageViewWithDots> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;
  final List<String> _slides = [c1, c2, c3];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to change page after 1 second
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      if (_currentIndex < _slides.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 0,
          // 300.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: _slides.length,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[400],
                  // image: DecorationImage(
                  //   image: AssetImage(_slides[index]),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

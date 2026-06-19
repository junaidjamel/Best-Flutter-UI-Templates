import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';
import 'package:flutter_ui/features/three_d_object/const/three_d_object_colors.dart';

class ObjectList extends StatelessWidget {
  const ObjectList({super.key});

  static const _items = [
    _ObjectItem(
      title: 'Rainy Jumper',
      creator: 'Baristo W',
      likes: '45k likes',
      imagePath: 'assets/three_d_object/images/rainbow.png',
      avatarColor: Color(0xFFD7E7EC),
    ),
    _ObjectItem(
      title: 'Error Buddy',
      creator: 'Alex M',
      likes: '28k likes',
      imagePath: 'assets/three_d_object/images/error_buddy.png',
      avatarColor: Color(0xFFE7D4C0),
    ),
    _ObjectItem(
      title: 'Cyber Shroom',
      creator: 'Emilia K',
      likes: '36k likes',
      imagePath: 'assets/three_d_object/images/cyber_shroom.png',
      avatarColor: Color(0xFFF5A3CE),
    ),

    _ObjectItem(
      title: 'Canned Slack',
      creator: 'Julia G',
      likes: '19k likes',
      imagePath: 'assets/three_d_object/images/canned_slack.png',
      avatarColor: Color(0xFFBA8F82),
    ),
    _ObjectItem(
      title: 'CloudJumper',
      creator: 'Peter W',
      likes: '42k likes',
      imagePath: 'assets/three_d_object/images/cloudjumper.png',
      avatarColor: Color(0xFFD7E7EC),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 24.h),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: _ObjectCard(item: _items[index]),
          );
        },
      ),
    );
  }
}

class _ObjectCard extends StatelessWidget {
  const _ObjectCard({required this.item});

  final _ObjectItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      height: 142.h,
      decoration: BoxDecoration(
        color: ThreeDObjectColors.cardBg,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ThreeDObjectColors.borderClr),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              item.imagePath,
              width: 130.w,
              height: 142.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 11.r,
                        backgroundColor: item.avatarColor,
                        child: Text(
                          item.creator.characters.first,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          item.creator,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.buttonSecondary.copyWith(
                            color: ThreeDObjectColors.whiteClr.withValues(
                              alpha: .5,
                            ),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.displayName.copyWith(
                      color: ThreeDObjectColors.whiteClr.withValues(alpha: .9),
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.heart,
                        color: ThreeDObjectColors.whiteClr.withValues(
                          alpha: .45,
                        ),
                        size: 17.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        item.likes,
                        style: AppTypography.label.copyWith(
                          color: ThreeDObjectColors.whiteClr.withValues(
                            alpha: .5,
                          ),
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}

class _ObjectItem {
  const _ObjectItem({
    required this.title,
    required this.creator,
    required this.likes,
    required this.imagePath,
    required this.avatarColor,
  });

  final String title;
  final String creator;
  final String likes;
  final String imagePath;
  final Color avatarColor;
}

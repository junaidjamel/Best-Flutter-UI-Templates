import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/scroll_social/const/scroll_social_colors.dart';
import 'package:flutter_ui/features/scroll_social/const/social_data.dart';
import 'package:flutter_ui/features/scroll_social/widgets/social_network_image.dart';

class SocialProfilePage extends StatelessWidget {
  const SocialProfilePage({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
          sliver: SliverList.list(
            children: [
              _ProfileHeader(onBack: onBack),
              SizedBox(height: 25.h),
              const _ProfileStats(),
              SizedBox(height: 18.h),
              const _ProfileIdentity(),
              SizedBox(height: 22.h),
              const _ProfileSwitcher(),
              SizedBox(height: 14.h),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.w,
              childAspectRatio: .72,
            ),
            itemCount: SocialData.profileGrid.length,
            itemBuilder: (_, index) => _GridPost(
              imageUrl: SocialData.profileGrid[index],
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      IconButton(
        onPressed: onBack,
        icon: const Icon(CupertinoIcons.chevron_back, size: 22),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
      Expanded(
        child: Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      Container(
        width: 38.w,
        height: 38.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ScrollSocialColors.surfaceSoft,
        ),
        child: const Icon(CupertinoIcons.bell, size: 20),
      ),
    ],
  );
}

class _ProfileStats extends StatelessWidget {
  const _ProfileStats();
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      const _Stat(value: '2.5M', label: 'Followers'),
      Container(
        padding: EdgeInsets.all(3.w),
        decoration: const BoxDecoration(
          color: ScrollSocialColors.accentSoft,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 51.r,
          backgroundColor: ScrollSocialColors.avatarBackground,
          backgroundImage: const NetworkImage(SocialImageUrls.leslie),
        ),
      ),
      const _Stat(value: '120', label: 'Following'),
    ],
  );
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        value,
        style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w800),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          color: ScrollSocialColors.textSecondary,
        ),
      ),
    ],
  );
}

class _ProfileIdentity extends StatelessWidget {
  const _ProfileIdentity();
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Leslie Alexander',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(width: 5.w),
          Icon(
            CupertinoIcons.checkmark_seal_fill,
            color: ScrollSocialColors.accent,
            size: 17.sp,
          ),
        ],
      ),
      SizedBox(height: 3.h),
      Text(
        '@leslie_alex007',
        style: TextStyle(
          fontSize: 13.sp,
          color: ScrollSocialColors.textTertiary,
        ),
      ),
    ],
  );
}

class _ProfileSwitcher extends StatelessWidget {
  const _ProfileSwitcher();
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: _Segment(label: 'Post', badge: '25', selected: false),
      ),
      SizedBox(width: 8.w),
      Expanded(
        child: _Segment(label: 'Reels', badge: '34', selected: true),
      ),
    ],
  );
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.badge,
    required this.selected,
  });
  final String label;
  final String badge;
  final bool selected;
  @override
  Widget build(BuildContext context) => Container(
    height: 50.h,
    decoration: BoxDecoration(
      color: selected
          ? ScrollSocialColors.accent
          : ScrollSocialColors.background,
      border: Border.all(color: ScrollSocialColors.outline),
      borderRadius: BorderRadius.circular(27.r),
      boxShadow: selected
          ? const [
              BoxShadow(
                color: ScrollSocialColors.shadowSoft,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ]
          : null,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: selected
                ? ScrollSocialColors.textPrimary
                : ScrollSocialColors.surfaceMuted,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Text(
            badge,
            style: TextStyle(
              fontSize: 10.sp,
              color: selected
                  ? ScrollSocialColors.background
                  : ScrollSocialColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

class _GridPost extends StatelessWidget {
  const _GridPost({required this.imageUrl, required this.index});
  final String imageUrl;
  final int index;
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(11.r),
    child: Stack(
      fit: StackFit.expand,
      children: [
        SocialNetworkImage(imageUrl: imageUrl),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ScrollSocialColors.transparent,
                ScrollSocialColors.darkOverlayStrong,
              ],
              stops: [0.56, 1],
            ),
          ),
        ),
        Positioned(
          left: 7.w,
          bottom: 7.h,
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.play_circle,
                size: 15,
                color: ScrollSocialColors.background,
              ),
              SizedBox(width: 3.w),
              Text(
                ['20.5K', '45.9K', '534.4K', '12.7K', '39.1K', '62.4K'][index],
                style: TextStyle(
                  color: ScrollSocialColors.background,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

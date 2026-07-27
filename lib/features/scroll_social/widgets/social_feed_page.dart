import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/scroll_social/const/social_data.dart';
import 'package:flutter_ui/features/scroll_social/const/scroll_social_colors.dart';
import 'package:flutter_ui/features/scroll_social/widgets/social_network_image.dart';

class SocialFeedPage extends StatefulWidget {
  const SocialFeedPage({super.key, required this.onOpenProfile});

  final VoidCallback onOpenProfile;

  @override
  State<SocialFeedPage> createState() => _SocialFeedPageState();
}

class _SocialFeedPageState extends State<SocialFeedPage> {
  var _showFollowing = false;

  @override
  Widget build(BuildContext context) {
    final posts = _showFollowing ? SocialData.followingPosts : SocialData.posts;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
          sliver: SliverList.list(
            children: [
              _TopBar(
                showFollowing: _showFollowing,
                onSelectionChanged: (showFollowing) {
                  setState(() => _showFollowing = showFollowing);
                },
              ),
            
              SizedBox(height: 18.h),
           const _SectionHeading(title: 'Stories', action: 'Watch all'),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(height: 170.h, child:  _Stories()),
          ),
        ),
      
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 118.h),
          sliver: SliverList.list(
            children: [
              _SectionHeading(
                title: _showFollowing ? 'Following' : 'Trending',
                action: _showFollowing ? 'Latest updates' : 'Curated today',
              ),
              SizedBox(height: 10.h),
              ...posts.map(
                (post) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: 
                  _PostCard(
                    post: post,
                    onTapAvatar: widget.onOpenProfile,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
      ),
      const Spacer(),
      Text(
        action.toUpperCase(),
        style: TextStyle(
          color: ScrollSocialColors.textTertiary,
          fontSize: 9.sp,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    ],
  );
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.showFollowing,
    required this.onSelectionChanged,
  });

  final bool showFollowing;
  final ValueChanged<bool> onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FeedTab(
          label: 'Following',
          isSelected: showFollowing,
          onTap: () => onSelectionChanged(true),
        ),
        SizedBox(width: 28.w),
        _FeedTab(
          label: 'For You',
          isSelected: !showFollowing,
          onTap: () => onSelectionChanged(false),
        ),
        const Spacer(),
        Container(
          width: 47.w,
          height: 47.w,
          decoration: BoxDecoration(
            color: ScrollSocialColors.accent,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: ScrollSocialColors.shadowSoft,
                blurRadius: 12,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(CupertinoIcons.search, size: 23),
        ),
      ],
    );
  }
}

class _FeedTab extends StatelessWidget {
  const _FeedTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    selected: isSelected,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: 17.sp,
                color: isSelected
                    ? ScrollSocialColors.textPrimary
                    : ScrollSocialColors.textMuted,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
              ),
              child: Text(label),
            ),
            SizedBox(height: 6.h),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              width: isSelected ? 48.w : 0,
              height: 3.h,
              decoration: BoxDecoration(
                color: ScrollSocialColors.accent,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      clipBehavior: Clip.none,
      itemCount: SocialData.stories.length,
      separatorBuilder: (context, index) => SizedBox(width: 12.w),
      itemBuilder: (_, index) {
        final story = SocialData.stories[index];
        return RepaintBoundary(
          child: SizedBox(
            width: 132.w,
            child: Container(
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: ScrollSocialColors.accentSoft,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SocialNetworkImage(imageUrl: story.imageUrl),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ScrollSocialColors.transparent,
                            ScrollSocialColors.darkOverlayStrong,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 9.h,
                      left: 9.w,
                      child: _StoryTag(label: story.tag, views: story.views),
                    ),
                    Positioned(
                      left: 9.w,
                      right: 8.w,
                      bottom: 9.h,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12.r,
                            backgroundImage: NetworkImage(story.imageUrl),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              story.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: ScrollSocialColors.background,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StoryTag extends StatelessWidget {
  const _StoryTag({required this.label, required this.views});
  final String label;
  final String views;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: label == 'Premiere'
              ? ScrollSocialColors.accent
              : ScrollSocialColors.canvas,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w700),
        ),
      ),
      SizedBox(width: 5.w),
      Text(
        views,
        style: TextStyle(color: ScrollSocialColors.background, fontSize: 10.sp),
      ),
    ],
  );
}

class _PostCard extends StatefulWidget {
  const _PostCard({required this.post, required this.onTapAvatar});
  final SocialPost post;
  final VoidCallback onTapAvatar;

  @override
  State<_PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<_PostCard> {
  var _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20.r);
    return AspectRatio(
      aspectRatio: .89,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: const [
            BoxShadow(
              color: ScrollSocialColors.shadowSoft,
              blurRadius: 20,
              offset: Offset(0, 9),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SocialNetworkImage(imageUrl: widget.post.imageUrl),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ScrollSocialColors.darkOverlayLight,
                      ScrollSocialColors.darkOverlaySubtle,
                      ScrollSocialColors.darkOverlayMedium,
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                left: 16.w,
                child: InkWell(
                  onTap: widget.onTapAvatar,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ScrollSocialColors.white85,
                        ),
                        child: CircleAvatar(
                          radius: 17.r,
                          backgroundImage: NetworkImage(widget.post.avatarUrl),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.post.name,
                            style: TextStyle(
                              color: ScrollSocialColors.background,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.post.handle,
                            style: TextStyle(
                              color: ScrollSocialColors.white70,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 14.h,
                left: 14.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: ScrollSocialColors.white12,
                    border: Border.all(color: ScrollSocialColors.white12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      _Reaction(
                        icon: _isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        value: widget.post.likes,
                        isActive: _isLiked,
                        onTap: () => setState(() => _isLiked = !_isLiked),
                      ),
                      SizedBox(width: 28.w),
                      _Reaction(
                        icon: CupertinoIcons.chat_bubble,
                        value: widget.post.comments,
                      ),
                      SizedBox(width: 28.w),
                      _Reaction(
                        icon: CupertinoIcons.paperplane,
                        value: widget.post.shares,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Reaction extends StatelessWidget {
  const _Reaction({
    required this.icon,
    required this.value,
    this.onTap,
    this.isActive = false,
  });
  final IconData icon;
  final String value;
  final VoidCallback? onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(14.r),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive
                ? ScrollSocialColors.accent
                : ScrollSocialColors.background,
            size: 18.sp,
          ),
          SizedBox(width: 5.w),
          Text(
            value,
            style: TextStyle(
              color: ScrollSocialColors.background,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    ),
  );
}

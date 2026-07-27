import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/scroll_social/const/scroll_social_colors.dart';
import 'package:flutter_ui/features/scroll_social/widgets/social_bottom_navigation.dart';
import 'package:flutter_ui/features/scroll_social/widgets/social_feed_page.dart';
import 'package:flutter_ui/features/scroll_social/widgets/social_profile_page.dart';
import 'package:flutter_ui/features/scroll_social/widgets/social_tab_placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

/// A fashion-focused social experience inspired by the Scroll concept.
class ScrollSocialView extends StatefulWidget {
  const ScrollSocialView({super.key});

  @override
  State<ScrollSocialView> createState() => _ScrollSocialViewState();
}

class _ScrollSocialViewState extends State<ScrollSocialView> {
  var _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        backgroundColor: ScrollSocialColors.canvas,
        body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: _selectedTab,
            children: [
              SocialFeedPage(
                onOpenProfile: () => setState(() => _selectedTab = 4),
              ),

              const SocialTabPlaceholder(
                title: 'Find your next favourite',
                message:
                    'Discover the creators, looks, and ideas that feel like you.',
                icon: CupertinoIcons.compass,
                actionLabel: 'Explore creators',
              ),
              const SizedBox.shrink(),
              const SocialTabPlaceholder(
                title: 'Your inbox is quiet',
                message:
                    'When someone sends you a message, it will show up here.',
                icon: CupertinoIcons.chat_bubble_2,
                actionLabel: 'Start a conversation',
              ),
             SocialProfilePage(onBack: () => setState(() => _selectedTab = 0)),
          
            ],
          ),
        ),
        bottomNavigationBar: SocialBottomNavigation(
          selectedIndex: _selectedTab,
          onChanged: (index) => setState(() => _selectedTab = index),
          onCreatePressed: () => showModalBottomSheet<void>(
            context: context,
            backgroundColor: ScrollSocialColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
            ),
            builder: (_) => const SocialCreateSheet(),
          ),
        ),
   
      ),
    );
  }
}

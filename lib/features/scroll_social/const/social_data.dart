class SocialStory {
  const SocialStory({
    required this.name,
    required this.imageUrl,
    required this.views,
    this.tag = 'Live',
  });

  final String name;
  final String imageUrl;
  final String views;
  final String tag;
}

class SocialPost {
  const SocialPost({
    required this.imageUrl,
    required this.avatarUrl,
    required this.name,
    required this.handle,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  final String imageUrl;
  final String avatarUrl;
  final String name;
  final String handle;
  final String likes;
  final String comments;
  final String shares;
}

/// All remote imagery is kept in one place so the UI stays easy to maintain.
abstract final class SocialImageUrls {
  static const leslie =
      'https://i.pinimg.com/736x/e2/52/40/e2524035b14eef4e013041a7e4710328.jpg';
  static const savannah =
      'https://i.pinimg.com/736x/81/1c/b1/811cb12300a11eba6e3cadc9cad15971.jpg';
  static const guy =
      'https://i.pinimg.com/1200x/d9/e1/4c/d9e14c251d468cc476c0ec33f969b5da.jpg';
  static const robert =
      'https://i.pinimg.com/1200x/ff/c2/29/ffc22901b6815d1a7ca26e6f81db7788.jpg';
  static const bessie =
      'https://i.pinimg.com/736x/97/c9/69/97c9691a83cf3f2650ceafe694b6e5b7.jpg';
  static const trending =
      'https://i.pinimg.com/736x/81/1c/b1/811cb12300a11eba6e3cadc9cad15971.jpg';
  static const postTwo =
      'https://i.pinimg.com/736x/3d/87/37/3d87371b79e998444e9a4f81c96fa998.jpg';
  static const postThree =
      'https://i.pinimg.com/1200x/eb/d2/c9/ebd2c947fa4e41abe889f8646be506bc.jpg';
  static const postFour =
      'https://i.pinimg.com/736x/5b/c0/b7/5bc0b7c0947f0a765ec3bb3cdc8dc72d.jpg';
  static const postFive =
      'https://i.pinimg.com/1200x/67/04/5a/67045a37b872dacf164de255c1a2d1ff.jpg';
  static const postSix =
      'https://i.pinimg.com/1200x/31/d6/d4/31d6d4ce30bf16bfb6083cd51c3a4a16.jpg';
  static const cameron =
      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=85';
  static const jane =
      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=85';
  static const devon =
      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=400&q=85';
  static const esther =
      'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=400&q=85';
  static const gridOne =
      'https://i.pinimg.com/736x/08/9f/86/089f863bd18eebf9ed1a30da68172336.jpg';
  static const gridTwo =
      'https://i.pinimg.com/736x/df/96/32/df9632349906123ef72b67a841e5c558.jpg';
  static const gridThree =
      'https://i.pinimg.com/1200x/0f/a7/a1/0fa7a17be2aba49b16b3ce6a22054b60.jpg';
  static const gridFour =
      'https://i.pinimg.com/1200x/67/2a/a7/672aa71c3c90330f885cd217d28fb834.jpg';
  static const gridFive =
      'https://i.pinimg.com/736x/15/cd/ce/15cdceed6aeeaa39140f52dc9ae30b65.jpg';
  static const gridSix =
      'https://i.pinimg.com/736x/48/a7/f5/48a7f5da0968e0609ad69616b83452a5.jpg';
}

abstract final class SocialData {
  static const stories = [
    SocialStory(
      name: 'Guy Hawkins',
      imageUrl: SocialImageUrls.guy,
      views: '20.5K',
    ),
    SocialStory(
      name: 'Robert Fox',
      imageUrl: SocialImageUrls.robert,
      views: '12.8K',
      tag: 'Premiere',
    ),
    SocialStory(
      name: 'Bessie Cooper',
      imageUrl: SocialImageUrls.bessie,
      views: '34.6K',
    ),
    SocialStory(
      name: 'Jane Cooper',
      imageUrl: SocialImageUrls.postThree,
      views: '18.2K',
      tag: 'New',
    ),
    SocialStory(
      name: 'Devon Lane',
      imageUrl: SocialImageUrls.postSix,
      views: '9.4K',
    ),
  ];

  static const posts = [
    SocialPost(
      imageUrl: SocialImageUrls.trending,
      avatarUrl: SocialImageUrls.savannah,
      name: 'Savannah Nguyen',
      handle: '@savannah_nguyen',
      likes: '120K',
      comments: '96K',
      shares: '36K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.postTwo,
      avatarUrl: SocialImageUrls.leslie,
      name: 'Brooklyn Simmons',
      handle: '@brooklyn_simmons',
      likes: '88K',
      comments: '12K',
      shares: '9.8K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.postThree,
      avatarUrl: SocialImageUrls.jane,
      name: 'Jane Cooper',
      handle: '@jane.cooper',
      likes: '74K',
      comments: '14.2K',
      shares: '11K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.postFour,
      avatarUrl: SocialImageUrls.cameron,
      name: 'Cameron Williamson',
      handle: '@cameron.w',
      likes: '56K',
      comments: '7.8K',
      shares: '4.5K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.postFive,
      avatarUrl: SocialImageUrls.esther,
      name: 'Esther Howard',
      handle: '@esther.howard',
      likes: '91K',
      comments: '21K',
      shares: '18K',
    ),
  ];

  /// Updates from accounts the user follows, intentionally separate from For You.
  static const followingPosts = [
    SocialPost(
      imageUrl: SocialImageUrls.postTwo,
      avatarUrl: SocialImageUrls.leslie,
      name: 'Brooklyn Simmons',
      handle: '@brooklyn_simmons',
      likes: '88K',
      comments: '12K',
      shares: '9.8K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.gridSix,
      avatarUrl: SocialImageUrls.savannah,
      name: 'Ralph Edwards',
      handle: '@ralph.edwards',
      likes: '42K',
      comments: '8.4K',
      shares: '6.1K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.postFour,
      avatarUrl: SocialImageUrls.cameron,
      name: 'Cameron Williamson',
      handle: '@cameron.w',
      likes: '56K',
      comments: '7.8K',
      shares: '4.5K',
    ),
    SocialPost(
      imageUrl: SocialImageUrls.postSix,
      avatarUrl: SocialImageUrls.devon,
      name: 'Devon Lane',
      handle: '@devon.lane',
      likes: '63K',
      comments: '10K',
      shares: '7.2K',
    ),
  ];

  static const profileGrid = [
    SocialImageUrls.gridOne,
    SocialImageUrls.gridTwo,
    SocialImageUrls.gridThree,
    SocialImageUrls.gridFour,
    SocialImageUrls.gridFive,
    SocialImageUrls.gridSix,
  ];
}

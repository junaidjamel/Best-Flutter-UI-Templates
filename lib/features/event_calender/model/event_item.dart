class EventItem {
  const EventItem({
    required this.title,
    required this.category,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.attendees,
    required this.description,
    required this.host,
    required this.guestImageUrls,
  });

  final String title;
  final String category;
  final String location;
  final DateTime date;
  final String imageUrl;
  final int attendees;
  final String description;
  final String host;
  final List<String> guestImageUrls;
}

abstract final class EventCalenderData {
  static final events = <EventItem>[
    EventItem(
      title: 'Cevin Sephora',
      category: 'Art Gallery',
      location: 'Lumen Arts, Downtown',
      date: DateTime(2026, 7, 5, 19, 30),
      imageUrl:
          'https://i.pinimg.com/736x/df/46/ba/df46ba9cad678cac330d42bbf00cb3ee.jpg',
      attendees: 1456,
      host: 'Maya Chen',
      guestImageUrls: const [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
      ],
      description:
          'An intimate evening with a new generation of visual artists, live installations, music, and conversations.',
    ),
    EventItem(
      title: 'After Dark',
      category: 'Live Music',
      location: 'Neon Hall, Clifton',
      date: DateTime(2026, 7, 12, 21),
      imageUrl:
          'https://i.pinimg.com/736x/fb/2e/02/fb2e02c40f4632e896041745d5c50748.jpg',
      attendees: 982,
      host: 'Noah James',
      guestImageUrls: const [
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=100&q=80',
      ],
      description:
          'A vivid night of electronic sound, immersive light, and performances from the city’s most exciting artists.',
    ),
    EventItem(
      title: 'Forms of Light',
      category: 'Exhibition',
      location: 'The Modern Room',
      date: DateTime(2026, 7, 18, 18),
      imageUrl:
          'https://i.pinimg.com/736x/f9/2d/32/f92d327eb4e142b6084c52855734192e.jpg',
      attendees: 624,
      host: 'Ava Hart',
      guestImageUrls: const [
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1527980965255-d3b416303d12?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?auto=format&fit=crop&w=100&q=80',
      ],
      description:
          'Explore light as material through projection, sculpture, and interactive installations in a quiet gallery setting.',
    ),
    EventItem(
      title: 'City Stories',
      category: 'Photography',
      location: 'North House Studio',
      date: DateTime(2026, 7, 25, 17, 30),
      imageUrl:
          'https://i.pinimg.com/736x/c5/8c/58/c58c58e9a88bd4ff95173406827c706f.jpg',
      attendees: 418,
      host: 'Jane Haris',
      guestImageUrls: const [
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1504257432389-52343af06ae3?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?auto=format&fit=crop&w=100&q=80',
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=100&q=80',
      ],
      description:
          'A collection of candid city moments, followed by an open conversation with the photographers.',
    ),
  ];
}

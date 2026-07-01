import 'package:flutter_ui/features/article_app/const/article_data.dart';

class ArticleCategory {
  const ArticleCategory({required this.name, required this.articles});

  final String name;
  final List<ArticleData> articles;
}

const List<ArticleCategory> discoveryCategories = [
  ArticleCategory(
    name: 'For You',
    articles: [
      ArticleData(
        title: 'Why personal websites are making a comeback',
        description:
            'Creators are building independent spaces where they can publish ideas without chasing an algorithm.',
        imageUrl:
            'https://i.pinimg.com/1200x/a4/7b/d4/a47bd47f1fd06ad72da62c7cb1fee1e9.jpg',
        content:
            'A personal website offers ownership, flexibility, and a lasting home for creative work. Better tools are making these spaces easier for anyone to design and maintain.',
      ),
      ArticleData(
        title: 'Seven small technologies quietly shaping daily life',
        description:
            'From smarter batteries to private on-device AI, useful innovation is becoming almost invisible.',
        imageUrl:
            'https://i.pinimg.com/1200x/ea/23/26/ea23267abb5944ef3ccc876550c03094.jpg',
        content:
            'The most meaningful technology is not always the loudest. Small improvements in devices, software, and connectivity are steadily changing how people work and live.',
      ),

      ArticleData(
        title: 'Can technology make remote work feel more human?',
        description:
            'Teams are experimenting with better tools for collaboration, focus, and meaningful connection.',
        imageUrl:
            'https://i.pinimg.com/736x/34/bb/2d/34bb2dfcfc5a97d705236f280330211d.jpg',
        content:
            'Remote work is about more than video meetings. Thoughtful technology can help teams share context, protect focused time, and maintain a genuine sense of belonging.',
      ),
      ArticleData(
        title: 'What comes after the smartphone?',
        description:
            'Wearables, spatial interfaces, and ambient computing are competing to become the next essential platform.',
        imageUrl:
            'https://i.pinimg.com/1200x/94/2a/3a/942a3aabf56e9996c899f964e9a09087.jpg',
        content:
            'The next major computing platform may not replace the phone overnight. It is more likely to appear gradually through connected devices that understand context.',
      ),

      ArticleData(
        title: 'The quiet revolution happening inside batteries',
        description:
            'New materials and smarter charging systems could make everyday devices last longer.',
        imageUrl:
            'https://images.unsplash.com/photo-1609521263047-f8f205293f24?auto=format&fit=crop&w=900&q=85',
        content:
            'Battery innovation affects everything from phones to electric vehicles. Researchers are improving safety, charging speed, and energy density without changing how people use their devices.',
      ),
    ],
  ),
  ArticleCategory(
    name: 'AI',
    articles: [
      ArticleData(
        title: 'How to collaborate with AI without losing your voice',
        description:
            'The best results come from treating AI as a thinking partner rather than an automatic answer machine.',
        imageUrl:
            'https://i.pinimg.com/736x/00/ae/70/00ae708620505dac5f1f51cbaa3043e3.jpg',
        content:
            'Strong AI-assisted work still depends on human judgment. Clear direction, careful editing, and original perspective are what turn a generated draft into meaningful work.',
      ),
      ArticleData(
        title: 'Small AI models are having a big moment',
        description:
            'Efficient models can now run directly on phones and laptops without sending every request to the cloud.',
        imageUrl:
            'https://i.pinimg.com/736x/80/7e/86/807e86ec3335dcaeb832aa81e8ff07ea.jpg',
        content:
            'Smaller models improve speed, privacy, and reliability. They are making useful artificial intelligence possible in places where an internet connection is limited.',
      ),

      ArticleData(
        title: 'Why transparent AI matters',
        description:
            'Researchers are finding clearer ways to explain how intelligent systems reach important decisions.',
        imageUrl:
            'https://i.pinimg.com/236x/58/8a/7e/588a7e030fe4e9186ace61274480869c.jpg',
        content:
            'People need to understand when and why automated systems affect them. Transparency makes it easier to evaluate errors, reduce bias, and build trust.',
      ),
    ],
  ),
  ArticleCategory(
    name: 'Gadgets',
    articles: [
      ArticleData(
        title: 'The return of thoughtfully designed gadgets',
        description:
            'A new wave of devices is focusing on repairability, simplicity, and long-term usefulness.',
        imageUrl:
            'https://i.pinimg.com/736x/7c/00/0d/7c000daefc75abfd45da7d13de879423.jpg',
        content:
            'Good hardware should age gracefully. More companies are exploring modular parts, longer software support, and designs that solve one problem especially well.',
      ),
      ArticleData(
        title: 'Are smart glasses finally ready?',
        description:
            'Lighter designs and useful AI features are giving wearable displays another chance.',
        imageUrl:
            'https://i.pinimg.com/736x/03/bd/5e/03bd5e4a9d87cd961c3b610b51ea8459.jpg',
        content:
            'Smart glasses are becoming less experimental and more practical. The winning products will need to balance helpful features with comfort, privacy, and battery life.',
      ),
      ArticleData(
        title: 'Why compact cameras feel exciting again',
        description:
            'Creators are rediscovering dedicated cameras for their tactile controls and distinctive images.',
        imageUrl:
            'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=900&q=85',
        content:
            'Phones remain incredibly convenient, but dedicated cameras create a more intentional experience. Their renewed popularity shows that focused devices still have a place.',
      ),
      ArticleData(
        title: 'Mechanical keyboards keep getting more creative',
        description:
            'New layouts, switches, and materials are turning a basic computer tool into a personal object.',
        imageUrl:
            'https://i.pinimg.com/1200x/86/f7/bc/86f7bc43ac398dec7add867b9972991f.jpg',
        content:
            'Mechanical keyboards combine function with personal expression. Enthusiasts can now choose every detail, from sound and feel to layout and visual design.',
      ),
      ArticleData(
        title: 'What makes a great pair of wireless earbuds?',
        description:
            'Comfort, reliable controls, and natural sound matter more than an endlessly growing feature list.',
        imageUrl:
            'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?auto=format&fit=crop&w=900&q=85',
        content:
            'The best earbuds disappear into daily life. Strong connectivity, useful noise control, and a comfortable fit often matter more than impressive specifications.',
      ),
      ArticleData(
        title: 'Handheld gaming enters a new golden age',
        description:
            'Powerful portable systems are making full-sized games available almost anywhere.',
        imageUrl:
            'https://images.unsplash.com/photo-1592840496694-26d035b52b48?auto=format&fit=crop&w=900&q=85',
        content:
            'Modern handhelds blend the openness of a computer with the convenience of a console. Better processors and displays are giving players more choice than ever.',
      ),
    ],
  ),
];

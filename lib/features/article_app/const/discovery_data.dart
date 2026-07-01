import 'package:flutter_ui/features/article_app/const/article_data.dart';

class ArticleCategory {
  const ArticleCategory({required this.name, required this.articles});

  final String name;
  final List<ArticleData> articles;
}

const discoveryCategories = [
  ArticleCategory(
    name: 'For You',
    articles: [
      ArticleData(
        title: 'Seven small technologies quietly shaping daily life',
        description:
            'From smarter batteries to private on-device AI, useful innovation is becoming almost invisible.',
        imageUrl:
            'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=900&q=85',
        content:
            'The most meaningful technology is not always the loudest. Small improvements in devices, software, and connectivity are steadily changing how people work and live.',
      ),
      ArticleData(
        title: 'A practical guide to building better digital habits',
        description:
            'Simple ways to make your devices feel calmer, more focused, and genuinely helpful.',
        imageUrl:
            'https://images.unsplash.com/photo-1499750310107-5fef28a66643?auto=format&fit=crop&w=900&q=85',
        content:
            'Technology should support attention rather than constantly compete for it. A few thoughtful settings and routines can make everyday digital tools much easier to live with.',
      ),
      ArticleData(
        title: 'What comes after the smartphone?',
        description:
            'Wearables, spatial interfaces, and ambient computing are competing to become the next essential platform.',
        imageUrl:
            'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=900&q=85',
        content:
            'The next major computing platform may not replace the phone overnight. It is more likely to appear gradually through connected devices that understand context.',
      ),
      ArticleData(
        title: 'Why personal websites are making a comeback',
        description:
            'Creators are building independent spaces where they can publish ideas without chasing an algorithm.',
        imageUrl:
            'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?auto=format&fit=crop&w=900&q=85',
        content:
            'A personal website offers ownership, flexibility, and a lasting home for creative work. Better tools are making these spaces easier for anyone to design and maintain.',
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
      ArticleData(
        title: 'Can technology make remote work feel more human?',
        description:
            'Teams are experimenting with better tools for collaboration, focus, and meaningful connection.',
        imageUrl:
            'https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=900&q=85',
        content:
            'Remote work is about more than video meetings. Thoughtful technology can help teams share context, protect focused time, and maintain a genuine sense of belonging.',
      ),
    ],
  ),
  ArticleCategory(
    name: 'AI',
    articles: [
      ArticleData(
        title: 'Small AI models are having a big moment',
        description:
            'Efficient models can now run directly on phones and laptops without sending every request to the cloud.',
        imageUrl:
            'https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=900&q=85',
        content:
            'Smaller models improve speed, privacy, and reliability. They are making useful artificial intelligence possible in places where an internet connection is limited.',
      ),
      ArticleData(
        title: 'How to collaborate with AI without losing your voice',
        description:
            'The best results come from treating AI as a thinking partner rather than an automatic answer machine.',
        imageUrl:
            'https://images.unsplash.com/photo-1531746790731-6c087fecd65a?auto=format&fit=crop&w=900&q=85',
        content:
            'Strong AI-assisted work still depends on human judgment. Clear direction, careful editing, and original perspective are what turn a generated draft into meaningful work.',
      ),
      ArticleData(
        title: 'Why transparent AI matters',
        description:
            'Researchers are finding clearer ways to explain how intelligent systems reach important decisions.',
        imageUrl:
            'https://images.unsplash.com/photo-1555255707-c07966088b7b?auto=format&fit=crop&w=900&q=85',
        content:
            'People need to understand when and why automated systems affect them. Transparency makes it easier to evaluate errors, reduce bias, and build trust.',
      ),
      ArticleData(
        title: 'How AI is learning to understand video',
        description:
            'Multimodal models can now follow actions, scenes, and spoken context across moving images.',
        imageUrl:
            'https://images.unsplash.com/photo-1536240478700-b869070f9279?auto=format&fit=crop&w=900&q=85',
        content:
            'Video understanding gives AI a richer view of the world. It could improve accessibility, education, creative editing, and the way large media libraries are searched.',
      ),
      ArticleData(
        title: 'AI agents are moving from answers to actions',
        description:
            'New systems can plan tasks, use software tools, and complete multi-step digital work.',
        imageUrl:
            'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?auto=format&fit=crop&w=900&q=85',
        content:
            'AI agents promise to reduce repetitive work by combining reasoning with practical tools. Reliability and clear user control will determine how useful these systems become.',
      ),
      ArticleData(
        title: 'The growing role of synthetic data in AI',
        description:
            'Generated examples are helping researchers train models when real-world information is limited.',
        imageUrl:
            'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=900&q=85',
        content:
            'Synthetic data can fill important gaps while protecting sensitive information. Its value depends on quality, diversity, and careful checks against real-world behavior.',
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
            'https://images.unsplash.com/photo-1498049794561-7780e7231661?auto=format&fit=crop&w=900&q=85',
        content:
            'Good hardware should age gracefully. More companies are exploring modular parts, longer software support, and designs that solve one problem especially well.',
      ),
      ArticleData(
        title: 'Are smart glasses finally ready?',
        description:
            'Lighter designs and useful AI features are giving wearable displays another chance.',
        imageUrl:
            'https://images.unsplash.com/photo-1577803645773-f96470509666?auto=format&fit=crop&w=900&q=85',
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
            'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=900&q=85',
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

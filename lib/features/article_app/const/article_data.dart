class ArticleData {
  const ArticleData({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
  });

  final String title;
  final String description;
  final String imageUrl;
  final String content;
}

const articleDetailContent =
    'Artificial intelligence is evolving quickly as researchers and technology '
    'companies introduce more capable tools. Understanding how these systems '
    'work helps people use them thoughtfully and prepare for the changes they '
    'may bring.';

const List<ArticleData> articlePosts = [
  ArticleData(
    title: 'How generative AI is changing creative work',
    description:
        'New AI tools are helping designers, writers, and developers move from early ideas to polished work faster.',
    imageUrl:
        'https://i.pinimg.com/1200x/e2/36/f3/e236f32a9d24460389e1df94e75560b6.jpg',
    content: articleDetailContent,
  ),

  ArticleData(
    title: 'Why AI assistants are becoming more personal',
    description:
        'Modern assistants can understand context, organize daily work, and provide more useful responses.',
    imageUrl:
        'https://i.pinimg.com/736x/55/58/fe/5558fe79c2a623add528b652991c233f.jpg',
    content: articleDetailContent,
  ),
  ArticleData(
    title: 'Inside the race to build powerful AI chips',
    description:
        'Technology companies are designing faster processors to train larger models with less time and energy.',
    imageUrl:
        'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=1200&q=85',
    content: articleDetailContent,
  ),
  ArticleData(
    title: 'Can artificial intelligence improve healthcare?',
    description:
        'AI systems are helping doctors analyze medical images, discover treatments, and identify health risks earlier.',
    imageUrl:
        'https://i.pinimg.com/1200x/15/53/dd/1553ddc683da7c40cc23dda2f470df55.jpg',
    content: articleDetailContent,
  ),

  ArticleData(
    title: 'How quantum computing could transform technology',
    description:
        'Researchers are exploring machines that could solve scientific and computing problems beyond today’s systems.',
    imageUrl:
        'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?auto=format&fit=crop&w=1200&q=85',
    content: articleDetailContent,
  ),
];

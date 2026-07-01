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

const articlePosts = [
  ArticleData(
    title: 'How generative AI is changing creative work',
    description:
        'New AI tools are helping designers, writers, and developers move from early ideas to polished work faster.',
    imageUrl:
        'https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&w=1200&q=85',
    content: articleDetailContent,
  ),
  ArticleData(
    title: 'The next generation of smarter robots',
    description:
        'Advances in machine learning are enabling robots to understand their surroundings and handle complex tasks.',
    imageUrl:
        'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&w=1200&q=85',
    content: articleDetailContent,
  ),
  ArticleData(
    title: 'Why AI assistants are becoming more personal',
    description:
        'Modern assistants can understand context, organize daily work, and provide more useful responses.',
    imageUrl:
        'https://images.unsplash.com/photo-1531746790731-6c087fecd65a?auto=format&fit=crop&w=1200&q=85',
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
        'https://images.unsplash.com/photo-1576086213369-97a306d36557?auto=format&fit=crop&w=1200&q=85',
    content: articleDetailContent,
  ),
  ArticleData(
    title: 'The technology powering tomorrow’s smart cities',
    description:
        'Connected sensors and intelligent software are helping cities reduce traffic, energy use, and waste.',
    imageUrl:
        'https://images.unsplash.com/photo-1518005020951-eccb494ad742?auto=format&fit=crop&w=1200&q=85',
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

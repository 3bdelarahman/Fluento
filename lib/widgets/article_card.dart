import 'package:flutter/material.dart';
import 'package:fluento/models/article.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/widgets/level_badge.dart';

class ArticleCard extends StatelessWidget {
  final Article? article;
  final String? title;
  final String? description;
  final CefrLevel? level;
  final int? readingTimeMinutes;
  final int? newWordsCount;
  final String? imageEmoji;
  final VoidCallback onTap;

  const ArticleCard({
    super.key,
    this.article,
    this.title,
    this.description,
    this.level,
    this.readingTimeMinutes,
    this.newWordsCount,
    this.imageEmoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = title ?? article?.title ?? '';
    final d = description ?? article?.description ?? '';
    final l = level ?? article?.level ?? CefrLevel.b1;
    final rt = readingTimeMinutes ?? article?.readingTimeMinutes ?? 0;
    final nw = newWordsCount ?? article?.newWordsCount ?? 0;
    final emoji = imageEmoji ?? article?.imageEmoji ?? '📖';

    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t,
                      style: const TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B1B1B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      d,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        LevelBadge(level: l),
                        const SizedBox(width: 12),
                        const Icon(Icons.access_time_rounded, size: 16, color: Color(0xFF6B7280)),
                        const SizedBox(width: 4),
                        Text(
                          '$rt min',
                          style: const TextStyle(
                            fontFamily: 'Figtree',
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.menu_book_rounded, size: 16, color: Color(0xFF6B7280)),
                        const SizedBox(width: 4),
                        Text(
                          '$nw words',
                          style: const TextStyle(
                            fontFamily: 'Figtree',
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF8F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
